module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    if is_a? Hash
      length.times { |element| yield(keys[element], self[keys[element]]) }
    else
      element = 0
      while element < length
        yield(self[element])
        element += 1
      end
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

  def my_any?(par = nil, &block)
    condition = false
    if !par.nil?
      my_each { |element| condition = true if par === element } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |element| condition = true if element }
    else
      my_each { |element| condition = true if block.call(element) }
    end
    condition
  end

  def my_none?(par = nil, &block)
    !my_any?(par, &block)
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

  def my_inject(*par) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    new_array = is_a?(Array) ? self : to_a
    memo = par[0] if par[0].is_a? Integer
    if par[0].is_a?(Symbol) || par[0].is_a?(String)
      sym = par[0]
    elsif par[0].is_a?(Integer)
      sym = par[1] if par[1].is_a?(Symbol) || par[1].is_a?(String)
    end
    if sym
      new_array.my_each { |element| memo = memo ? memo.send(sym, element) : element }
      memo
    else
      new_array.my_each { |element| memo = memo ? yield(memo, element) : element }
    end
    memo
  end
end
def multiply_els
  my_inject { |memo, element| memo * element }
end
a = [1, 2, 3, 4, 5]
# q = ['one', 'two', 'three', 'four', 'five']
# b = []
# # c = a.each { |x| b.push(x + 2) }
# p q
# q.my_each_with_index {|element, index| b.push("[#{element}]'s index is #{index}")}
# p b
b = a.select {|x| x>2}
p b