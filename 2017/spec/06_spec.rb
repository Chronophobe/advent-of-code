require_relative '../days/06.rb'

include Day06

describe 'The sixth day of Advent' do
  describe '#parse' do
    it 'returns an array of integers' do
      expect(parse("1\t2\t3")).to be == [1,2,3]
    end
  end
  describe '#index_at_max' do
    context 'given an array with unique numbers' do
      it 'returns the index of the maximum number' do
        data = [0, 5, 8, 3, 7, 1]
        expect(index_at_max(data)).to be == 2
      end
    end

    context 'given an array with multiple max numbers' do
      it 'returns the index of the first maximum number' do
        data = [0, 5, 8, 3, 7, 1, 8]
        expect(index_at_max(data)).to be == 2
      end
    end
  end

  describe '#redistribute' do
    it 'applies the distribution to the current memory blocks' do
      memory = [0, 2, 7, 0]
      expect(redistribute(memory)).to be == [2, 4, 1, 2]

      # case failed before
      memory = [14, 14, 0, 10, 3, 2, 8, 8, 7, 7, 4, 4, 10, 4, 2, 14]
      update = [0, 15, 1, 11, 4, 3, 9, 9, 8, 8, 5, 5, 11, 5, 3, 14]
      expect(redistribute(memory)).to be == update
    end
  end

  describe '#routine' do
    it 'computes the number of redistributions until a known memory allocation is found' do
      memory = [0, 2, 7, 0]
      expect(routine(memory)).to be == 5
    end
  end
end