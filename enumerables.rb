# module Enumerable
  # def my_each
  #   (self.length).times {|n| yield(self[n])}
  # end
  def my_each
    (self.length).times { |index| yield(self[index]) }
  end
  array1 = ["hi", 43, "potatoes", "horses", 33]

  puts "my_each output\:"
  puts ""
  array1.my_each { |item| puts item }

 
  # def my_each_with_index

  # end

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
