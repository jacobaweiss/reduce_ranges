require 'rspec'
require 'reduce_ranges'

describe 'Array#reduce_ranges' do
  let(:ranged_array) { [1..3, 5..8] }
  let(:array) { expand_array(ranged_array) }

  subject { array.reduce_ranges }

  it 'does not modify the existing array' do
    expect { subject }.not_to change { array }
  end

  context 'with no ranges' do
    let(:array) { [1, 3, 5, 7, 9] }

    it 'returns an array with no ranges' do
      expect(subject.select { |el| el.is_a?(Range) }).to be_empty
    end
  end

  context 'with only positive integer ranges' do
    let(:ranged_array) { [0..2, 5, 7..9] }

    it 'returns an array with the given ranges' do
      expect(subject).to eql(ranged_array)
    end
  end

  context 'with only negative integer ranges' do
    let(:ranged_array) { [-10..-8, -5, - 3..0] }

    it 'returns an array with the given ranges' do
      expect(subject).to eql(ranged_array)
    end
  end

  context 'with positive and negative integer ranges' do
    let(:ranged_array) { [-10..-8, 5, 7..9] }

    it 'returns an array with the given ranges' do
      expect(subject).to eql(ranged_array)
    end
  end

  context 'with non-Fixnum elements' do
    context 'with Floats' do
      let(:array) { [1, 2, 3.0, 5.5, 6.5, 7.5] }

      it 'returns an array with the given ranges' do
        expect { subject }.to raise_error(TypeError)
      end
    end

    context 'with non-numeric elements' do
      let(:array) { [-10.2..-8.1, '5.2', 5.3..9] }

      it 'raises an error' do
        expect { subject }.to raise_error(TypeError)
      end
    end
  end
end

describe 'Array#reduce_ranges' do
  let(:ranged_array) { [Date.new(2018,5,30)..Date.new(2018,6,1), Date.new(2018,6,3)..Date.new(2018,6,5)] }
  let(:array) { expand_array(ranged_array) }

  subject { array.reduce_ranges }

  it 'does not modify the existing array' do
    expect { subject }.not_to change { array }
  end

  context 'with no ranges' do
    let(:array) { [Date.new(2018,5,30), Date.new(2018,6,1), Date.new(2018,6,3), Date.new(2018,6,5)] }

    it 'returns an array with no ranges' do
      expect(subject.select { |el| el.is_a?(Range) }).to be_empty
    end
  end

  context 'with date ranges' do
    let(:ranged_array) { [Date.new(2018,5,30)..Date.new(2018,6,1), Date.new(2018,6,3), Date.new(2018,6,5)..Date.new(2018,6,7)] }

    it 'returns an array with the given ranges' do
      expect(subject).to eql(ranged_array)
    end
  end

  context 'with mixed elements' do
    let(:array) { [-10..-8, Date.new(2018,6,3), 5..9] }

    it 'raises an error' do
      expect { subject }.to raise_error(TypeError)
    end
  end
end

def expand_array(ranges)
  ranges.reduce([]) {|s, x| s + Array(x)}
end
