#!/usr/bin/env ruby -w

# Include required libraries.
require 'optparse'

# Define variables.
month = `date '+%B'`
day = `date '+%d'`
year = `date '+%Y'`
hour = `date '+%H'`
minute = `date '+%M'`
second = `date '+%S'`
version = '1.0.0'
long_date_and_time = ''
data_dir = `pwd`
seconds = ''
date1 = ''

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: chefknife COMMAND [OPTIONS]"
  opt.separator  ""
  opt.separator  "Commands"
  opt.separator  "     month: Print current month."
  opt.separator  "     version: Print verison of obsgetinfo."
  opt.separator  "     day: Print day of the month."
  opt.separator  "     year: Print the year."
  opt.separator  "     hour: Print the hour."
  opt.separator  "     minute: Print the minute."
  opt.separator  "     second: Print the second."
  opt.separator  "     long_date_and_time: Print current date and time."
  opt.separator  ""
  opt.separator  "Options"

  opt.on("-h","--help","help") do
    puts opt_parser
  end
end

opt_parser.parse!

# Uncomment to debug.
#puts "Month: #{month} Day: #{day} Year: #{year} Hour: #{hour} Minute: #{minute} Second: #{second} data_dir: #{data_dir}"

# Define get_month().
def get_month(month)

  puts "#{month}"

end

# Define get_day().
def get_day(day)

  puts "#{day}"

end

# Define get_year().
def get_year(year)

  puts "#{year}"

end

# Define get_hour().
def get_hour(hour)

  puts "#{hour}"

end

# Define get_minute().
def get_minute(minute)

  puts "#{minute}"

end

# Define get_second().
def get_second(second)

  puts "#{second}"

end

# Define get_long_date_and_time().
def get_long_date_and_time(long_date_and_time, month, day, year, hour, minute, second, data_dir)

  # Strip whitespace and build long date.
  hour = hour.gsub(/\s+/, ' ').strip
  minute = minute.gsub(/\s+/, ' ').strip
  second = second.gsub(/\s+/, ' ').strip
  long_date_and_time = "#{month}#{day}#{year} #{hour}:#{minute}:#{second}"
  long_date_and_time = long_date_and_time.gsub(/\s+/, ' ').strip

  # Write long data and time to pwd/obs_long_data_and_time.txt
  f = "#{data_dir}/obs_long_data_and_time.txt"
  f = f.gsub(/\s+/, '').strip
  file = File.open(f, "w")
  file.puts "#{long_date_and_time}"
  file.close
  
  # Uncomment to debug.
  #puts "#{long_date_and_time}"

end

def quitting_time_countdown_timmer(seconds, date1)

  date1 = Time.new
  date1 = Time.now
  while Time.now < date1
    t = Time.at(date1.to_i - Time.now.to_i)
    p t.strftime('%H:%M:%S')
    sleep 1
    puts "#{t}"
  end

end

# Define get_version().
def get_version(version)

  puts "obsgetinfo: Version #{version}"

end

case ARGV[0]
when "month"
  get_month(month) 

when "day"
  get_day(day)

when "year"
  get_year(year)

when "version"
  get_version(version)

when "hour"
  get_hour(hour)

when "minute"
  get_minute(minute)

when "second"
  get_second(second)

when "long_date_and_time"
  get_long_date_and_time(long_date_and_time, month, day, year, hour, minute, second, data_dir)

when "quitting_time_timer"
  quitting_time_countdown_timmer(seconds, date1)

else
  puts opt_parser
 
end
