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
end
