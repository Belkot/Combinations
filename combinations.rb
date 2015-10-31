def find_combinations(dictionary, target)
  arr = []

  (0...target.size).each { |i|
    arr << dictionary.select { |word| target[i...target.size].start_with?(word) }
  }

  arr = arr[0].product(*arr[1...target.size]) if arr.any?

  arr.map do |row|
    str = ''
    row.each_with_index { |e, i| str << "#{e} " if str.gsub(' ','').size == i }
    str.chomp(' ')
  end

end
