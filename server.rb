require 'bxm'
require 'optparse'

options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: server COMMAND [OPTIONS]"
  opt.separator  ""
  opt.separator  "Commands"
  opt.separator  "     password: creates english password"
  opt.separator  "     palabras: crea contrasena en espanol"
  opt.separator  "     worts: Erstellt deutsches Passwort"
  opt.separator  ""
  opt.separator  "Options"


  opt.on("-c COMPLEXITY","--complexity COMPLEXITY",Numeric,"which complexity you want to run") do |complexity|
    options[:complexity] = complexity
  end

  opt.on_tail("-s","--special","If you want special characters") do |specialChar|
    options[:specialChar] = specialChar
  end
end

opt_parser.parse!

if options[:complexity] == nil
  @times = 4
else
  @times = options[:complexity].to_i
end

if options[:specialChar] == nil
  @specialChar = false
else
  @specialChar = true
end

case ARGV[0]
  when "password"
    STDOUT.puts Bxm::Password.rand_key(@times,"words",@specialChar).to_s
  when "palabras"
    STDOUT.puts Bxm::Password.rand_key(@times,"palabras",@specialChar).to_s
  when "worts"
    STDOUT.puts Bxm::Password.rand_key(@times,"worts",@specialChar).to_s
  else
    puts opt_parser
end