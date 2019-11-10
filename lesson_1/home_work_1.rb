require 'tzinfo'

class HomeWork

  COLORS = { red: 31, green: 32, yellow: 33, blue: 34, pink: 35 }.freeze

  class << self
    def timezone
      tzinfo = TZInfo::Timezone.get(ARGV[0])
      period = tzinfo.current_period
      utc_offset = period.offset.utc_total_offset
      puts Time.now.getlocal(utc_offset)
    rescue TZInfo::InvalidTimezoneIdentifier
      puts 'Invalid timezone'
    end

    def color_text
      text = File.read(ARGV[1])
      color_code = COLORS[ARGV[0].to_sym]
      return puts 'No such color' unless color_code

      puts "\e[#{color_code}m#{text}\e[0m"
    rescue Errno::ENOENT, TypeError
      puts 'No such file or Invalid color_text'
    end

    def common_elements
      puts ARGV[0].split(",") & ARGV[1].split(",")
    rescue NoMethodError
      puts 'Invalid array'
    end

    def memory_size
      boolean = ARGV[0].eql?('true')
      integer = boolean ? 1 : 0
      puts integer.to_s.bytesize
    end

    def line_number
      File.open(ARGV[0], "r") do |f|
        f.each_line.with_index do |line, i|
          match_line = line.gsub("\n",'').eql?(ARGV[1])
          puts i + 1 if match_line
          break if match_line
        end
      end
    rescue Errno::ENOENT
      puts 'No such file'
    end
  end
end

HomeWork.timezone
HomeWork.color_text
HomeWork.common_elements
HomeWork.memory_size
HomeWork.line_number
