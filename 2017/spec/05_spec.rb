require_relative '../days/05.rb'

describe 'The fifth day of Advent' do
  let(:instructions) { [0, 3, 0, 1, -3] }

  describe '#parse' do
    it 'creates an array of integers' do
      expect(parse("1\n2\n3")).to be == [1,2,3]
    end
  end

  describe '#jump' do
    it 'increments the location with the value in the current location' do
      pointer = jump(instructions, 0)
      expect(pointer).to be == 0

      pointer = jump(instructions, 1)
      expect(pointer).to be == 4
    end

    it 'increments the instruction at the current location' do
      jump(instructions, 0)
      expect(instructions).to be == [1,3,0,1,-3]

      jump(instructions, 4)
      expect(instructions).to be == [1,3,0,1,-2]
    end
  end

  describe '#execute' do
    it 'computes the number of instructions to do until the pointer is outside' do
      n = execute(instructions)
      expect(n).to be == 5
    end
  end

  describe '#jump block' do
    it 'uses the block to manipulate the instructions' do
      jump(instructions, 1) do |i|
        i >= 3 ? i - 1 : i + 1
      end
      expect(instructions).to be == [0,2,0,1,-3]
    end
  end

  describe '#execute block' do
    it 'uses the block to manipulate the instructions' do
      n = execute(instructions) do |i|
        i >= 3 ? i - 1 : i + 1
      end
      expect(n).to be == 10
    end
  end
end