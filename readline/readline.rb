require 'getoptlong'

def main
  parser = GetoptLong.new

  parser.set_options(
    ['--help',    '-h', GetoptLong::NO_ARGUMENT],
    ['--version', '-v', GetoptLong::NO_ARGUMENT],
    ['--output',  '-o', GetoptLong::REQUIRED_ARGUMENT],
  )

  is_help = 0
  output = nil

  begin
    parser.each_option do |opt, optarg|
      case opt
        when '--help'
          is_help = 1
        when '--version'
          is_version = 1
        when '--output'
          output = optarg
      end
    end
  rescue
    exit(1)
  end

  puts("is_help is #{is_help}")
  puts("output is #{output}")

  while ARGV.length != 0 do
    filename = ARGV.shift
    puts "filename is #{filename}"

    File.readlines(filename, chomp: true).each do |line|
      puts(line)
    end
  end
end

main

