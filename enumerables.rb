module Enumerable
  # def my_each
  #   (is_a? Hash) ? (self.length).times {|element| yield(keys[element], self[keys[element]])} : self.length.times {|element| yield(self[element])}
  # end
  
  def my_each_with_index
    (is_a? Hash) ? (self.length).times {|element| yield(keys[element], self[keys[element]])} : self.length.times {|element| yield(self[element])}
  end
end
  string_check = "I am a string"
  array_check = %w(array hash 01258 symbol true 999)
  hash_check = { :Name => "Microverse",
    :CEO => "Ariel Camus",
    "Current year" => 2020,
    "Student" => "Sayyod",
  }
  
  # array_check.my_each {|x| puts x }
  # hash_check.my_each {|x, y| puts "#{x}: #{y}" }
  # hash_check.my_each {|x| puts "#{x}" }

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
