require 'reduce_ranges/version'

class Array
  def reduce_ranges
    raise TypeError unless all? { |el| el.is_a?(Fixnum) }

    results = []
    temp = [self[0]]
    self[1..-1].each do |e|
      temp << e && next if temp.last == e - 1
      results << (temp[1] ? (temp[0]..temp.last) : temp[0])
      temp = [e]
    end
    results << (temp[1] ? (temp[0]..temp.last) : temp[0])
  end

  def max_sub_array
    raise TypeError unless all? { |el| el.is_a?(Fixnum) }

    max_sum = 0
    max_start = 0
    max_end = 0
    curr_sum = 0
    curr_start = 0
    curr_end = 0

    arr = self.dup
    arr.each_with_index do |el, index|
      curr_sum += el

      if curr_sum > max_sum
        max_sum = curr_sum
        curr_end = index
        max_start = curr_start
        max_end = curr_end
      elsif curr_sum < 0
        curr_sum = 0
        curr_start = index + 1
        curr_end = index + 1
      end
    end

    arr.slice(max_start, max_end - max_start + 1)
  end
end
