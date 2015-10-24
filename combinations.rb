def find_combinations(dictionary, target)
  arr = []
  # Slice target string and get dictionary elements in array if they start a target.
  (0...target.size).each do |i|
    target_substr = target[i...target.size]
    arr_i = dictionary.group_by { |word| target_substr.start_with?(word) }[true] || []
    arr  = i.zero? ? arr_i : arr.product(arr_i)
  end

  arr.map! do |e|
    e.flatten!

    # If some element have length > 1 then delete (size-1) next elements.
    # Implement: Copy every element
    #            and skip next (current element - 1) if current element length more then 1
    #            (index incremented at current element size (not 1),
    #             if elements skiped then they be 'nil'  )
    result = []
    index = 0
    e.each_index do |i|
      result[i] = e[index]
      index += e[index].size if e[index]
    end

    result.compact.join ' ' # Delete all 'nil' and join at string.
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
