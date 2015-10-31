require './combinations.rb'

describe 'Combinations' do

  dictionary = ['a', 'b', 'c', 'ab', 'abc']

  it 'when no target' do
    target = ''
    expect(find_combinations(dictionary, target)).to eq []
  end

  it 'when no actual element in dictionary' do
    target = 'aabcx'
    expect(find_combinations(dictionary, target)).to eq []
  end

  it 'valid example1' do
    target = 'aabc'
    expect(find_combinations(dictionary, target)).to match_array ['a abc',
                                                                  'a a b c',
                                                                  'a ab c']
  end

  it 'valid example2' do
    target = 'aabcab'
    expect(find_combinations(dictionary, target)).to match_array ['a abc a b',
                                                                  'a a b c a b',
                                                                  'a ab c a b',
                                                                  'a abc ab',
                                                                  'a a b c ab',
                                                                  'a ab c ab']
  end

end
