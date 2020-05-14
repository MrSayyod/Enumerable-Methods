require '../enumerables'
describe Enumerable do
  let(:array_with_numbers) { [1, 2, 3, 4, 5] }
  let(:array_with_strings) { ['one', 'two', 'three', 'four', 'five'] }
  let(:array_with_numbers_and_nil) { [1, 2, 3, 4, nil] }
  let(:array_with_strings_and_numbers) { ['one', 2, 'three', 4, 'five'] }
  let(:empty_array) { [] }

  describe '#my_each' do
    context 'when no block given' do
      it 'should return to Enumerator' do
        expect(array_with_numbers.my_each).to be_a(Enumerator)
      end
    end
    
    context 'if block given, checks my_each method' do
      it 'should pass the test if results of my_each and each methods are equal' do
        actual = empty_array
        array_with_numbers.my_each {|x| actual.push(x + 1)}
        expected = empty_array
        array_with_numbers.each {|x| expected.push(x + 1)}
        expect(actual).to eql(expected)
      end
      
      it 'should return each item as requested' do
        actual = empty_array
        array_with_numbers.my_each {|x| actual.push(x + 1)}
        expected = [2, 3, 4, 5, 6]
        expect(actual).to eql(expected)
      end
    end
  end
  
  describe '#my_each_with_index' do
    context 'when no block given' do
      it 'should return to Enumerator' do
        expect(array_with_strings.my_each_with_index).to be_a(Enumerator)
      end
    end
    
    context 'if block given, checks my_each method' do
      it 'should pass the test if results of my_each_with_index and each_with_index methods are equal' do
        actual = empty_array
        array_with_strings.my_each_with_index {|element, index| actual.push("[#{element}]'s index is #{index}")}
        expected = empty_array
        array_with_strings.each_with_index {|element, index| expected.push("#{element}'s index is #{index}")}
        expect(actual).to eql(expected)
      end
      it 'should return each item as requested with indexes' do
        actual = empty_array
        array_with_strings.my_each_with_index {|element, index| actual.push("[#{element}]'s index is #{index}")}
        expect(actual).to eql(["[one]'s index is 0", "[two]'s index is 1", "[three]'s index is 2", "[four]'s index is 3", "[five]'s index is 4"])
      end
    end
  end
  
  describe '#my_select' do
    context 'when no block given' do
      it 'should return to Enumerator' do
        expect(array_with_numbers.my_select).to be_a(Enumerator)
      end
    end
    
    context 'if block given ' do
      it 'should return selected items' do
        expect(array_with_numbers.my_select {|x| x>=3}).to eql([3, 4, 5])
      end
      it 'should pass the test if results of my_select and select methods are equal' do
        actual = array_with_numbers.my_select {|x| x>=3}
        expected = array_with_numbers.select {|x| x>=3} 
        expect(actual).to eql(expected)
      end
    end
  end

  describe '#my_all' do
    context 'when passed block with condition met' do
      it 'returns true when all items met the condition' do
        expect(array_with_numbers.my_all? { |num| num < 6 }).to eql(true)
      end
    end

    it 'returns true when an empty array is given' do
      expect([].my_all?).to be true
    end

    it 'return false when any item is false' do
      expect(array_with_numbers.my_all? { |num| num < 5 }).to eql(false)
    end
  end

  describe '#my_any?' do
    context "When passed block with atleast one condition met" do
      it 'returns true' do
        expect(array_with_strings_and_numbers.my_any?(Integer)).to be true
      end

      it 'returns true' do
        expect(array_with_numbers_and_nil.my_any?(nil)).to be true
      end
    end

    it 'returns true' do
      expect(array_with_strings.my_any? { |item| item.length >=3}).to be true 
    end
  end
  
  it 'returns false' do
    expect(array_with_strings.my_any? { |item| item.length >=6}).to be false
  end

  describe '#my_none?' do
    context "When passed block with none of the condition met" do
      it 'returns false if none of the class element is given' do
        expect(array_with_strings_and_numbers.my_none?(Integer)).to be false
      end

      it 'returns false if none of the element is given' do
        expect(array_with_numbers_and_nil.my_none?(nil)).to be false
      end
    end

    it 'returns false' do
      expect(array_with_strings.my_none? { |item| item.length >=3}).to be false 
    end
  end
  
  it 'returns true' do
    expect(array_with_strings.my_none? { |item| item.length >=6}).to be true
  end

  

  describe '#my_count' do
    it 'Count all the elements when no parameter is given' do
      expect(array_with_numbers.my_count).to be 5
    end

    it 'should count result of the given condition when block given' do
      expect(array_with_numbers.my_count(&:even?)).to eql 2
    end

    it 'should count arguments when argument is given' do
    expect(array_with_numbers.my_count(2)).to eql 1
    end

  end

  describe '#my_map' do
    context 'when passed with block' do
      it 'returns array with each element squared' do
        expect(array_with_numbers.my_map {|num| num**2}).to eql([1,4,9,16,25])
      end
    end

    context 'when passed without a block' do
      it 'returns Enumerator #my_map' do
        expect(array_with_numbers.my_map).to be_a(Enumerator)
      end
    end
  end
  
  
  describe '#my_inject' do
    it 'checks inject method' do
      
    end
  end
end
