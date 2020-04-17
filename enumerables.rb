module Enumerable
  def my_each
    (is_a? Hash) ? (self.length).times {|element| yield(keys[element], self[keys[element]])} : self.length.times {|element| yield(self[element])}
  end
  
  def my_each_with_index
    self.length.times {|element| yield(self[element], element)}
  end
  
  def my_select
    new_array=[]
    my_each {|element| new_array.push(element) if yield(element)}
    new_array
  end

  def my_all?(*par) 
    condition = true
    if !par[0].nil?
      my_each { |element| condition = false unless par[0] === element } 
    elsif !block_given?
      my_each { |element| condition = false unless element}
    elsif block_given?
      my_each { |element| condition = false unless yield(element)}
    else 
      false
    end
    condition
  end
  
  def my_any?(*par)
    condition = false
    if !par[0].nil?
      my_each { |element| condition = true if par[0] === element } 
    elsif !block_given?
      my_each { |element| condition = true if element}
    elsif block_given?
      my_each { |element| condition = true if yield(element)}
    else 
      true
    end
    condition
  end
  
  def my_none?(*par)
    condition = true
    if !par[0].nil?
      my_each { |element| condition = false if par[0] === element } 
    elsif !block_given?
      my_each { |element| condition = false if element}
    elsif block_given?
      my_each { |element| condition = false if yield(element)}
    else 
      false
    end
    condition
  end
  
  def my_count(par = nil)
    index = 0
    if par
      my_each {|element| index += 1 if element == par}
    elsif block_given? 
      my_each {|element| index += 1 if yield(element)}
    else  
      index = length
    end
    index
  end
  
  def my_map(proc = nil)
    new_array = []
    my_each {|element| new_array.push(proc.nil? ? yield(element) : proc.call(element))}
    new_array
  end
  
  def my_inject(*par)
    new_array = is_a?(Array) ? self : to_a
      memo = par[0]
      new_array.my_each {|element| memo = memo ? yield(memo, element) : element}
      memo
    end
    
    def multiply_els
      self.my_inject {|memo, element| memo * element}
  end
end

# array_check = %w(array hash 01258 symbol true 999)
# hash_check = { :Name => "Microverse",
#   :CEO => "Ariel Camus",
#   "Current year" => 2020,
  #   "Student" => "Sayyod",
  # }

  # puts "Check for my_each method"
  # puts ""
  # array_check.my_each {|x| puts x }
  # hash_check.my_each {|x, y| puts "#{x}: #{y}" }
  # hash_check.my_each {|x, y| puts x }
  # puts ""
  # puts "Compare results with .each method"
  # puts ""
  # array_check.each {|x| puts x }
  # hash_check.each {|x, y| puts "#{x}: #{y}" }
  # hash_check.each {|x, y| puts x }
  
  # array_check = %w(array hash 01258 symbol true 999)
  # puts "Check for my_each_with_index method"
  # puts ""
  # array_check.my_each_with_index { |x, y| puts " #{x} with an index #{y}" }
  # puts ""
  # puts "Compare results with .each_with_index method"
  # puts ""
  # array_check.each_with_index { |x, y| puts " #{x} with an index #{y}" }
  
  # puts "Check for my_select method"
  # print (1..100).to_a.my_select { |item| item % 10 == 0 }
  # puts ""
  # print %w(London, Paris, Rome, Lisbon, Geneva, Budapest).my_select {|x| x.include? "s"}
  # puts ""
  # puts ""
  # puts "Compare results with .select method"
  # print (1..100).to_a.select { |item| item % 10 == 0 }
  # puts ""
  # print %w(London, Paris, Rome, Lisbon, Geneva, Budapest).select {|x| x.include? "s"}
  # puts ""

  # puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
  # puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
  # puts %w[ant bear cat].my_all?(/t/)                        #=> false
  # puts [1, 2i, 3.14].my_all?(Numeric)                       #=> true
  # puts [nil, true, 99].my_all?                              #=> false
  # puts [].my_all?   
  # puts [3, 3, 3].my_all?(3)
  # puts [3, 3, 1].my_all?(3)
  # puts ''
  # puts ''
  # puts %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
  # puts %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
  # puts %w[ant bear cat].all?(/t/)                        #=> false
  # puts [1, 2i, 3.14].all?(Numeric)                       #=> true
  # puts [nil, true, 99].all?                              #=> false
  # puts [].all?                                           #=> true
  # puts [3, 3, 3].all?(3)
  # puts [3, 3, 1].all?(3)

  # puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
  # puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> false
  # puts %w[ant bear cat].my_any?(/d/)                        #=> false
  # puts [1, 2i, 3.14].my_any?(Integer)                       #=> true
  # puts [nil, true, 99].my_any?                              #=> false
  # puts [].my_any?   
  # puts [3, 3, 3].my_any?(3)
  # puts [3, 3, 1].my_any?(2)
  # puts ''
  # puts ''
  # puts %w[ant bear cat].any? { |word| word.length >= 3 } 
  # puts %w[ant bear cat].any? { |word| word.length >= 4 } 
  # puts %w[ant bear cat].any?(/d/)                       
  # puts [1, 2i, 3.14].any?(Integer)                       
  # puts [nil, true, 99].any?                              
  # puts [].any?                                           
  # puts [3, 3, 3].any?(3)
  # puts [3, 3, 1].any?(2)

# puts %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
# puts %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
# puts %w{ant bear cat}.my_none?(/d/)                        #=> true
# puts [1, 3.14, 42].my_none?(Float)                         #=> false
# puts [].my_none?                                           #=> true
# puts [nil].my_none?                                        #=> true
# puts [nil, false].my_none?                                 #=> true
# puts [nil, false, true].my_none?                           #=> false
# puts ""
# puts ""
# puts %w{ant bear cat}.none? { |word| word.length == 5 } #=> true
# puts %w{ant bear cat}.none? { |word| word.length >= 4 } #=> false
# puts %w{ant bear cat}.none?(/d/)                        #=> true
# puts [1, 3.14, 42].none?(Float)                         #=> false
# puts [].none?                                           #=> true
# puts [nil].none?                                        #=> true
# puts [nil, false].none?                                 #=> true
# puts [nil, false, true].none?                           #=> false

# ary = [1, 2, 4, 2]
# puts ary.my_count               #=> 4
# puts ary.my_count(2)            #=> 2
# puts ary.my_count{ |x| x%2==0 } #=> 3
# puts ""
# puts ""
# puts ary.count               #=> 4
# puts ary.count(2)            #=> 2
# puts ary.count{ |x| x%2==0 } #=> 3

print (1..10).to_a.my_map { |i| i*i }      #=> [1, 4, 9, 16]
puts ""
print ["a", "b", "c"].my_map { |string| string.upcase }
puts "" 
puts "" 
print ["a", "b", "c"].map { |string| string.upcase }
puts "" 

# puts (5..10).my_inject { |sum, n| sum + n }            #=> 45
# puts (5..10).my_inject(1) { |product, n| product * n } #=> 151200
# longest = %w{ cat sheep bear }.my_inject do |memo, word|
#    memo.length > word.length ? memo : word
# end
# puts longest
# puts ""                                        
# puts ""                                        
# puts (5..10).inject { |sum, n| sum + n }            #=> 45
# puts (5..10).inject(1) { |product, n| product * n } #=> 151200
# longest = %w{ cat sheep bear }.inject do |memo, word|
#    memo.length > word.length ? memo : word
# end
# puts longest                                        #=> "sheep"

puts [2, 4, 5].multiply_els

# end
