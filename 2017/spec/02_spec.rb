require_relative '../days/02.rb'

describe 'Day 02' do
  context 'Empty data set' do
    let(:data) { ""}
    describe '#parse' do
      it 'returns an empty array' do
        expect(parse(data)).to be_empty
      end
    end

    describe '#minmax' do
      it 'returns 0' do
        expect(minmax(data)).to be == 0
      end
    end

    describe '#divisible' do
      it 'returns 0' do
        expect(divisible(data)).to be == 0
      end
    end
  end

  context 'Single line of data' do
    let(:data) { "5 9 2 8"}
    describe '#parse' do
      it 'returns a array of Integer arrays' do
        expect(parse(data)).to be == [[5,9,2,8]]
      end
    end

    describe '#minmax' do
      it 'computes the difference between the minimum and maximum' do
        expect(minmax(data)).to be == 7
      end
    end

    describe '#divisible' do
      it 'divides of the two evenly divisible numbers' do
        expect(divisible(data)).to be == 4
      end
    end
  end

  context 'Multiple lines of data' do
    let(:data) { "5 9 2 8\n9 4 7 3"}
    describe '#parse' do
      it 'returns a array of Integer arrays' do
        expect(parse(data)).to be == [[5,9,2,8], [9,4,7,3]]
      end
    end

    describe '#minmax' do
      it 'sums of the difference between the minimum and maximum in each row'\
          'each row' do
        expect(minmax(data)).to be == 7 + 6
      end
    end

    describe '#divisible' do
      it 'sums the division of the two evenly divisible numbers in each row' do
        expect(divisible(data)).to be == 4 + 3
      end
    end
  end
end
