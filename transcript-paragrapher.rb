#!/usr/bin/env ruby
# transcript-paragrapher.rb
#
# Usage:
#   ruby transcript-paragrapher.rb input.txt -o output.txt
#   cat input.txt | ruby transcript-paragrapher.rb -o output.txt

TRANSITION_STARTERS = [
  "however", "but", "so", "anyway", "meanwhile", "instead",
  "then", "still", "also", "now", "well", "okay", "ok",
  "on the other hand", "for example", "for instance",
  "in fact", "that said", "at the same time",
].freeze

def normalize_text(text)
  text
    .gsub(/\r\n?/, "\n")
    .gsub(/\s+/, " ")
    .strip
end

def split_into_sentences(text)
  # Simple heuristic sentence splitter:
  # split after ., !, or ? followed by whitespace and a capital letter/quote
  text.split(/(?<=[.!?])\s+(?=(?:["']?[A-Z]))/)
end

def transition_starter?(sentence)
  s = sentence.strip.downcase
  TRANSITION_STARTERS.any? { |t| s.start_with?(t + " ", t + ",", t + ".") || s == t }
end

def question_like?(sentence)
  sentence.strip.end_with?("?")
end

def very_short?(sentence)
  sentence.strip.split.size <= 5
end

def paragraphize(sentences, target_sentences: 4, max_sentences: 6)
  paragraphs = []
  current = []

  sentences.each_with_index do |sentence, i|
    s = sentence.strip
    next if s.empty?

    force_break_before =
      current.any? && (transition_starter?(s) ||
                       (question_like?(current.last) && !very_short?(s)) ||
                       current.length >= max_sentences)

    preferred_break_before =
      current.length >= target_sentences &&
      !very_short?(s) &&
      !very_short?(current.last)

    if force_break_before || preferred_break_before
      paragraphs << current.join(" ")
      current = []
    end

    current << s
  end

  paragraphs << current.join(" ") unless current.empty?
  paragraphs
end

def usage
  <<~USAGE
    Usage:
      ruby transcript-paragrapher.rb [input.txt] [-o output.txt]
      ruby transcript-paragrapher.rb [input.txt] [--output output.txt]
      cat input.txt | ruby transcript-paragrapher.rb [-o output.txt]
  USAGE
end

args = ARGV.dup
output_path = nil
input_path = nil

until args.empty?
  arg = args.shift

  case arg
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

text = normalize_text(input)
sentences = split_into_sentences(text)
paragraphs = paragraphize(sentences)
output = paragraphs.join("\n\n")

if output_path
  File.write(output_path, "#{output}\n")
else
  puts output
end
