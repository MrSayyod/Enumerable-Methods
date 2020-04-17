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

puts %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
puts %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
puts %w{ant bear cat}.my_none?(/d/)                        #=> true
puts [1, 3.14, 42].my_none?(Float)                         #=> false
puts [].my_none?                                           #=> true
puts [nil].my_none?                                        #=> true
puts [nil, false].my_none?                                 #=> true
puts [nil, false, true].my_none?                           #=> false
puts ""
puts ""
puts %w{ant bear cat}.none? { |word| word.length == 5 } #=> true
puts %w{ant bear cat}.none? { |word| word.length >= 4 } #=> false
puts %w{ant bear cat}.none?(/d/)                        #=> true
puts [1, 3.14, 42].none?(Float)                         #=> false
puts [].none?                                           #=> true
puts [nil].none?                                        #=> true
puts [nil, false].none?                                 #=> true
puts [nil, false, true].none?                           #=> false


  # def my_count

  # end

  # def my_map

  # end

  # def my_inject

  # end

  # def multiply_els

  # end

  # my_map = Proc.new do 

  # end
# end
