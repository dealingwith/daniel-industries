#!/usr/bin/env ruby
# transcript-scrubber.rb
#
# Usage:
#   ruby transcript-scrubber.rb transcript.txt -o scrubbed.txt
#   cat transcript.txt | ruby transcript-scrubber.rb --keep-like -o scrubbed.txt

class TranscriptScrubber
  DEFAULT_FILLERS = [
    "um",
    "uh",
    "erm",
    "ah",
    "eh",
    "mm",
    "hmm",
    "i mean",
  ].freeze

  BRACKETED_NOISES = %w[
    laughter laugh laughs inaudible crosstalk pause sigh sighs
    breath breathing music applause applauses cheering cheer cheers
    singing snort snorts cough coughs clears\ throat
  ].freeze

  def initialize(text, fillers:)
    @text = text.dup
    @fillers = fillers
  end

  def scrub
    normalize
    remove_youtube_artifacts
    remove_bracketed_noises
    dedupe_transcript_chunks
    remove_fillers
    dedupe_single_words
    dedupe_short_phrases
    cleanup
    capitalize_sentences
    @text.strip
  end

  private

  def normalize
    @text.strip!
    @text.gsub!(/\A`(.*)`\z/m, '\1')
    @text.gsub!(/\\n/, "\n")
    @text.gsub!(/\\t/, " ")
    @text.gsub!(/\r\n?/, "\n")
    @text.gsub!(/[“”]/, '"')
    @text.gsub!(/[‘’]/, "'")
    @text.gsub!(/[ \t]+/, " ")
  end

  def remove_youtube_artifacts
    @text.gsub!(/\b\d{1,2}:\d{2}(?::\d{2})?(?:\.\d+)?\b/, "")
  end

  def remove_bracketed_noises
    pattern = BRACKETED_NOISES.map { |w| Regexp.escape(w) }.join("|")
    @text.gsub!(/\[(?:#{pattern})\]/i, "")
  end

  def remove_fillers
    @fillers.sort_by { |f| -f.length }.each do |filler|
      escaped = Regexp.escape(filler)
      @text.gsub!(/(?<!\w)#{escaped}(?!\w)(?:\s*,)?/i, "")
    end
  end

  def dedupe_transcript_chunks
    words = @text.split
    return if words.length < 4

    deduped = []
    words.each do |word|
      deduped << word

      max_chunk_size = deduped.length / 2
      chunk_size = [max_chunk_size, 24].min
      while chunk_size >= 2
        previous_chunk = deduped[-(chunk_size * 2), chunk_size]
        current_chunk = deduped[-chunk_size, chunk_size]

        if normalized_chunk(previous_chunk) == normalized_chunk(current_chunk)
          deduped.pop(chunk_size)
          break
        end

        chunk_size -= 1
      end
    end

    @text = deduped.join(" ")
  end

  def normalized_chunk(words)
    words.map { |word| word.downcase.gsub(/\A[[:punct:]]+|[[:punct:]]+\z/, "") }
  end

  def dedupe_single_words
    3.times do
      @text.gsub!(/\b([A-Za-z']+)\b(?:\s+[,.]?\s*\1\b)+/i, '\1')
    end
  end

  def dedupe_short_phrases
    2.times do
      @text.gsub!(
        /\b((?:[A-Za-z']+\s+){1,3}[A-Za-z']+)\b(?:\s+[,.]?\s*\1\b)+/i,
        '\1'
      )
    end
  end

  def cleanup
    @text.gsub!(/\s+([,.;:!?])/, '\1')
    @text.gsub!(/([,.;:!?]){2,}/, '\1')
    @text.gsub!(/[ \t]+/, " ")
    @text.gsub!(/ *\n */, "\n")
    @text.gsub!(/\n{3,}/, "\n\n")
  end

  def capitalize_sentences
    should_capitalize = true

    @text = @text.gsub(/[A-Za-z]+|[.!?]+|\n+/) do |token|
      if token.match?(/\A[.!?]+\z/)
        should_capitalize = true
        token
      elsif token.include?("\n")
        should_capitalize = true if token.length >= 2
        token
      elsif should_capitalize
        should_capitalize = false
        token.sub(/\A[A-Za-z]/, &:upcase)
      else
        token
      end
    end
  end
end

def usage
  <<~USAGE
    Usage:
      ruby transcript-scrubber.rb [--keep-like] [input.txt] [-o output.txt]
      ruby transcript-scrubber.rb [--keep-like] [input.txt] [--output output.txt]
      cat input.txt | ruby transcript-scrubber.rb [--keep-like] [-o output.txt]
  USAGE
end

args = ARGV.dup
keep_like = false
output_path = nil
input_path = nil

until args.empty?
  arg = args.shift

  case arg
  when "--keep-like"
    keep_like = true
  when "-o", "--output"
    abort "Missing output path.\n\n#{usage}" if args.empty?

    output_path = args.shift
  when /\A--output=(.+)\z/
    output_path = Regexp.last_match(1)
  when "-h", "--help"
    puts usage
    exit
  when /\A-/
    abort "Unknown option: #{arg}\n\n#{usage}"
  else
    abort "Too many input files.\n\n#{usage}" if input_path

    input_path = arg
  end
end

input = if input_path
    File.read(input_path)
  else
    $stdin.read
  end

fillers = TranscriptScrubber::DEFAULT_FILLERS.dup
fillers.delete("like") if keep_like

output = TranscriptScrubber.new(input, fillers: fillers).scrub

if output_path
  File.write(output_path, "#{output}\n")
else
  puts output
end
