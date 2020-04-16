module Enumerable
  # def my_each
  #   (is_a? Hash) ? (self.length).times {|element| yield(keys[element], self[keys[element]])} : self.length.times {|element| yield(self[element])}
  # end
  
  def my_each_with_index
    self.length.times {|element| yield(self[element], element)}
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
  
  array_check = %w(array hash 01258 symbol true 999)
  puts "Check for my_each_with_index method"
  puts ""
  array_check.my_each_with_index { |x, y| puts " #{x} with an index #{y}" }
  puts ""
  puts "Compare results with .each_with_index method"
  puts ""
  array_check.each_with_index { |x, y| puts " #{x} with an index #{y}" }

  # def my_select

  # end

  # def my_all? 

  # end

  # def my_any?

  # end

  # def my_none?

  # end

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
