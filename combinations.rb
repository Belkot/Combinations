def find_combinations(dictionary, target)
  arr = []
  # Slice target string and get dictionary elements in array if they start a target.
  (0...target.size).each do |i|
    target_substr = target[i...target.size]
    arr_i = dictionary.group_by { |word| target_substr.start_with?(word) }[true] || []
    arr  = i.zero? ? arr_i : arr.product(arr_i)
  end

  arr.map do |row|
    # If some element have length > 1 then delete (size-1) next elements.
    # Implement: Change current element to nil
    #            if size of all elements before them < curent element index.
    row.flatten!.map!.with_index { |e, i| row[0...i].join.size == i ? e : nil }.
      compact.join ' '
  end
end

# Test
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
    expect(find_combinations(dictionary, target)).to match_array ['a abc', 'a a b c', 'a ab c']
  end

  it 'valid example2' do
    target = 'aabcab'
    expect(find_combinations(dictionary, target)).to match_array ['a abc a b', 'a a b c a b', 'a ab c a b',
                                                                  'a abc ab',  'a a b c ab',  'a ab c ab']
  end

end
