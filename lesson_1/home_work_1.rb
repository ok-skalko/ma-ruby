require 'tzinfo'

class HomeWork

  COLORS = { red: 31, green: 32, yellow: 33, blue: 34, pink: 35 }.freeze

  def self.timezone
    tzinfo = TZInfo::Timezone.get(ARGV[0])
    period = tzinfo.current_period
    utc_offset = period.offset.utc_total_offset
    puts Time.now.getlocal(utc_offset)
  rescue TZInfo::InvalidTimezoneIdentifier
    puts 'Invalid timezone'
  end

  def self.color_text
    text = File.read(ARGV[1])
    color_code = COLORS[ARGV[0].to_sym]
    return puts 'No such color' unless color_code

    puts "\e[#{color_code}m#{text}\e[0m"
  rescue Errno::ENOENT
    puts 'No such file'
  end
end

HomeWork.timezone
HomeWork.color_text
