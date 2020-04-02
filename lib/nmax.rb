require 'nmax/version'

module Nmax
  class Error < StandardError; end
  # Your code goes here...
  #puts $stdin.each_line.with_object([]) { |l, ns| l.scan(/\d+/) { |n| ns << n.to_i } }.uniq.sort.reverse[0...ARGV[0].to_i]
  required_bytes = { 48 => '0',
                     49 => '1',
                     50 => '2',
                     51 => '3',
                     52 => '4',
                     53 => '5',
                     54 => '6',
                     55 => '7',
                     56 => '8',
                     57 => '9' }
  result_array = ['']
  loop do
    byte = $stdin.getbyte
    break if byte.nil?

    number = required_bytes[byte]
    if number
      result_array.last << number
    else
      result_array << '' unless result_array.last.empty?
    end
  end
  puts result_array.sort_by(&:to_i).reverse[0...ARGV[0].to_i]
end
