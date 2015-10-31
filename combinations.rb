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
