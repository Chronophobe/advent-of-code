require_relative '../days/01.rb'

describe '#captcha' do
  it 'removes of extraneous whitespace' do
    expect(captcha('1122')).to be == captcha(" 1 1 2 2\n")
  end

  it 'adds for every repeated number' do
    expect(captcha('1122')).to be == 3
  end

  it 'uses the repeated number for the next check' do
    expect(captcha('1111')).to be == 4
  end

  it 'does not add for single numbers' do
    expect(captcha('1234')).to be == 0
  end

  it 'loops around' do
    expect(captcha('91212129')).to be == 9
  end
end

describe '#captcha with offset' do
  it 'removes of extraneous whitespace' do
    expect(captcha('1122', true)).to be == captcha(" 1 1 2 2\n", true)
  end

  it 'adds for every repeated number' do
    expect(captcha('1212', true)).to be == 6
  end

  it 'uses the repeated number for the next check' do
    expect(captcha('123425', true)).to be == 4
  end

  it 'does not add for single numbers' do
    expect(captcha('1221', true)).to be == 0
  end

  it 'loops around' do
    expect(captcha('123123', true)).to be == 12
    expect(captcha('12131415', true)).to be == 4
  end
end
