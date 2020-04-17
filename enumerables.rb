module Enumerable
  def my_each
    is_a? Hash ? length.times { |element| yield(keys[element], self[keys[element]]) } : length.times { |element| yield(self[element]) }
  end

  def my_each_with_index
    length.times { |element| yield(self[element], element) }
  end

  def my_select
    new_array = []
    my_each { |element| new_array.push(element) if yield(element) }
    new_array
  end

  def my_all?(*par)
    condition = true
    if !par[0].nil?
      my_each { |element| condition = false unless par[0] === element } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |element| condition = false unless element }
    elsif block_given?
      my_each { |element| condition = false unless yield(element) }
    else
      false
    end
    condition
  end

  def my_any?(*par)
    condition = false
    if !par[0].nil?
      my_each { |element| condition = true if par[0] === element } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |element| condition = true if element }
    elsif block_given?
      my_each { |element| condition = true if yield(element) }
    else 
      true
    end
    condition
  end

  def my_none?(*par)
    condition = true
    if !par[0].nil?
      my_each { |element| condition = false if par[0] === element } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |element| condition = false if element }
    elsif block_given?
      my_each { |element| condition = false if yield(element) }
    else
      false
    end
    condition
  end

  def my_count(par = nil)
    index = 0
    if block_given?
      my_each { |element| index += 1 if yield(element) }
    elsif par
      my_each { |element| index += 1 if element == par }
    else
      index = length
    end
    index
  end

  def my_map(proc = nil)
    new_array = []
    my_each { |element| new_array.push(proc.nil? ? yield(element) : proc.call(element)) }
    new_array
  end

  def my_inject(*par)
    new_array = is_a?(Array) ? self : to_a
    memo = par[0]
    new_array.my_each { |element| memo = memo ? yield(memo, element) : element }
    memo
  end

  def multiply_els
    my_inject { |memo, element| memo * element }
  end
end
