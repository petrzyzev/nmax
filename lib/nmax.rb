require 'set'

module Nmax
  class Finder
    attr_reader :io, :count

    def initialize(io, count)
      @io = io
      @count = count
    end

    def run
      buffer = ''
      set = io.each_char.with_object(SortedSet.new) do |char, acc|
        if char.match?(/\d/)
          buffer << char
        elsif !buffer.empty?
          acc << buffer.to_i
          buffer.clear
        end
      end
      set.to_a.last(count)
    end
  end
end
