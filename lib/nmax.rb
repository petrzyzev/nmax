# frozen_string_literal: true

require 'nmax/version'

module Nmax
  class Finder
    REQUIRED_BYTES = { 48 => '0',
                       49 => '1',
                       50 => '2',
                       51 => '3',
                       52 => '4',
                       53 => '5',
                       54 => '6',
                       55 => '7',
                       56 => '8',
                       57 => '9' }.freeze
    attr_reader :io, :n

    def initialize(io, n)
      @io = io
      @n = n
    end

    def find
      result_array = ['']
      loop do
        byte = io.getbyte
        break if byte.nil?

        number = required_bytes[byte]
        if number
          result_array.last << number
        else
          result_array << '' unless result_array.last.empty?
        end
      end
      result_array.sort_by(&:to_i).reverse[0...n]
    end

    def find_2
      io.each_line.with_object([]) { |l, ns| l.scan(/\d+/) { |n| ns << n.to_i } }.uniq.sort.reverse[0...n]
    end
  end
end
