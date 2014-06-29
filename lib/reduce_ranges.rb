require 'reduce_ranges/version'

class Array
  def reduce_ranges
    raise TypeError unless all? { |el| el.is_a?(Fixnum) }

    arr = self.dup
    arr.each_with_index do |el, index|
      range_index = index + 1
      prev = el
      while arr[range_index] == prev + 1 do
        prev = arr[range_index]
        range_index += 1
      end
      arr[index..range_index-1] = (arr[index]..arr[range_index-1]) unless index == range_index - 1
    end
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
