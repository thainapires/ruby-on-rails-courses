class LineAnalyzer

  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(cont, line_n)
    @content = cont
    @line_number = line_n
    @highest_wf_count = 0
    @highest_wf_words = []
    calculate_word_frequency
  end

  def calculate_word_frequency()
    freq = Hash.new(0)
    #puts "oi #{content.split}"
    @content.split.each do |word|
      freq[word.downcase] +=1
    end
    freq.each_pair do |key, value|
      if value.to_i > @highest_wf_count
        @highest_wf_count = value
      end
    end 
    freq.each_pair do |key, value|
      if value.to_i === @highest_wf_count
        highest_wf_words.push(key)
      end
    end
  end
end

class Solution
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize()
    @analyzers = []
  end

  def analyze_file()
    cont = 1
    File.foreach('test.txt') do |line|
      an = LineAnalyzer.new(line, cont)
      @analyzers.push(an)
      cont = cont + 1
    end
  end

  def calculate_line_with_highest_frequency()
    @highest_count_words_across_lines = []
    @highest_count_across_lines = 0
    @analyzers.each do |item|
      if item.highest_wf_count > @highest_count_across_lines
        @highest_count_across_lines = item.highest_wf_count
      end
    end

    @analyzers.each do |item|
      if item.highest_wf_count.to_i === @highest_count_across_lines
        @highest_count_words_across_lines.push(item)
      end
    end
  end

  def print_highest_word_frequency_across_lines()
    puts "The following words have the highest word frequency per line:"
    @highest_count_words_across_lines.each do |item|
      #print "["
      print "#{item.highest_wf_words} (appears in line #{item.line_number})"
      puts
    end
  end
end