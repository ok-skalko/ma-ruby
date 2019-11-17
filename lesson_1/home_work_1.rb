require 'tzinfo'

class HomeWork

  COLORS = { red: 31, green: 32, yellow: 33, blue: 34, pink: 35 }.freeze

  class << self
    def timezone(zone_name)
      tzinfo = TZInfo::Timezone.get(zone_name)
      period = tzinfo.current_period
      utc_offset = period.offset.utc_total_offset
      puts Time.now.getlocal(utc_offset)
    rescue TZInfo::InvalidTimezoneIdentifier
      puts 'Invalid timezone'
    end

    def color_text(color,file)
      text = File.read(file)
      color_code = COLORS[color.to_sym]
      return puts 'No such color' unless color_code

      puts "\e[#{color_code}m#{text}\e[0m"
    rescue Errno::ENOENT, TypeError
      puts 'No such file or Invalid color_text'
    end

    def common_elements(arr1, arr2)
      puts arr1.split(",") & arr2.split(",")
    rescue NoMethodError
      puts 'Invalid array'
    end

    def memory_size(value)
      boolean = value.eql?('true')
      integer = boolean ? 1 : 0
      puts integer.to_s.bytesize
    end

    def line_number(file,string)
      File.open(file, "r") do |f|
        f.each_line.with_index do |line, i|
          match_line = line.gsub("\n",'').eql?(string)
          puts i + 1 if match_line
          break if match_line
        end
      end
    rescue Errno::ENOENT
      puts 'No such file'
    end

    def random_element(arr)
      puts arr.split('').sample
    end

    def sorted_array(arr)
      puts arr.split('').sort.reverse
    end
  end

  class NumbersOperations

    class << self
      def numbers(num1, num2, method)
        a = num1.to_i
        b = num2.to_i
        case method
        when 'sum'
          puts a + b
        when 'difference'
          puts a - b
        when 'division'
          puts a / b
        when 'multiplication'
          puts a * b
        end
      rescue ZeroDivisionError
        puts 'Cannot Be Divided By Zero'
      end
    end
  end
end

