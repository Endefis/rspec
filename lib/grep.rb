class Grep
  def self.grep(pattern, flags, files)
    new(pattern, flags, files).grep
  end

  def initialize(pattern, flags, files)
    @flags = flags
    @files = files
    @pattern = insensitive? ? pattern.downcase : pattern
  end

  def grep
    @files.map do |file|
      IO.readlines(file, chomp: true).map.with_index do |line, i|
        if matches?(line)
          if print_file_name?
            break file # stop processing this file
          else
            print_line(file, line, i)
          end
        end
      end
    end.flatten.compact.join "\n"
  end

  private

  def print_line(file, line, i)
    if print_line_number?
      line = "#{i+1}:#{line}"
    end
    if @files.count > 1
      line = "#{file}:#{line}"
    end
    line
  end

  def matches?(line)
    if insensitive?
      line = line.downcase
    end
    match =
      if match_full_line?
        line === @pattern
      else
        line.include? @pattern
      end
    invert? ? !match : match
  end

  def flag?(flag)
    @flags.include? flag
  end

  def insensitive?
    flag? '-i'
  end

  def invert?
    flag? '-v'
  end

  def match_full_line?
    flag? '-x'
  end

  def print_line_number?
    flag? '-n'
  end

  def print_file_name?
    flag? '-l'
  end
end
