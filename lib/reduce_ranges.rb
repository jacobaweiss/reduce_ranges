require 'reduce_ranges/version'

class Array
  def reduce_ranges
    raise TypeError unless all? { |el| el.is_a?(Fixnum) } or all? { |el| el.is_a?(Date) }

    results = []
    temp = [self[0]]
    self[1..-1].each do |e|
      temp << e && next if temp.last == e - 1
      results << (temp[1] ? (temp[0]..temp.last) : temp[0])
      temp = [e]
    end
    results << (temp[1] ? (temp[0]..temp.last) : temp[0])
  end
end
