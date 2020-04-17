module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?
    if is_a? Hash
      length.times { |element| yield(keys[element], self[keys[element]]) }
    else
      length.times { |element| yield(self[element]) }
    end
  end

  def my_each_with_index
    return to_enum(:my_each) unless block_given?
    length.times { |element| yield(self[element], element) }
  end

  def my_select
    return to_enum(:my_select) unless block_given?
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
    else
      my_each { |element| condition = false unless yield(element) }
    end
    condition
  end

  def my_any?(*par)
    condition = false
    if !par[0].nil?
      my_each { |element| condition = true if par[0] === element } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |element| condition = true if element }
    else
      my_each { |element| condition = true if yield(element) }
    end
    condition
  end

  def my_none?(*par)
    condition = true
    if !par[0].nil?
      my_each { |element| condition = false if par[0] === element } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |element| condition = false if element }
    else
      my_each { |element| condition = false if yield(element) }
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
    return to_enum(:my_map) unless block_given?
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
