require_relative '../days/04.rb'

describe '#phrases' do
  it 'splits into lines' do
    expect(phrases("aap noot\nmies boom")).to be == ['aap noot', 'mies boom']
  end
end
describe '#valid?' do
  context 'allowing anagrams' do
    it 'allows only unique words' do
      expect(valid?('a aa aap')).to be true
      expect(valid?('aap noot aap')).to be false
    end
  end

  context 'invalidating anagrams' do
    it 'allows only unique words when sorted' do
      expect(valid?('a aa aap', true)).to be true
      expect(valid?('rail safety fairy tails', true)).to be true
      expect(valid?('resistance ancestries', true)).to be false
    end
  end
end
