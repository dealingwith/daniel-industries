#!/usr/bin/env ruby
# scrub_transcript.rb
#
# Usage:
#   ruby scrub_transcript.rb transcript.txt
#   ruby scrub_transcript.rb --keep-like transcript.txt
#   cat transcript.txt | ruby scrub_transcript.rb --keep-like

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
    breath breathing music
  ].freeze

  def initialize(text, fillers:)
    @text = text.dup
    @fillers = fillers
  end

  def scrub
    normalize
    remove_bracketed_noises
    remove_fillers
    dedupe_single_words
    dedupe_short_phrases
    cleanup
    capitalize_sentences
    @text.strip
  end

  private

  def normalize
    @text.gsub!(/\r\n?/, "\n")
    @text.gsub!(/[“”]/, '"')
    @text.gsub!(/[‘’]/, "'")
    @text.gsub!(/[ \t]+/, " ")
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

args = ARGV.dup
keep_like = args.delete("--keep-like")

input = if args[0]
    File.read(args[0])
  else
    $stdin.read
  end

fillers = TranscriptScrubber::DEFAULT_FILLERS.dup
fillers.delete("like") if keep_like

puts TranscriptScrubber.new(input, fillers: fillers).scrub
