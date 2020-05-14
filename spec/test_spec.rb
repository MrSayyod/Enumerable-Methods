require './enumerables'
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
    it 'checks select method' do
      
    end
  end

  describe '#my_all' do
    it 'checks all method' do
      
    end
  end

  describe '#my_any' do
    it 'checks any method' do
      
    end
  end

  describe '#my_none' do
    it 'checks none method' do
      
    end
  end

  describe '#my_count' do
    it 'checks count method' do
      
    end
  end

  describe '#my_map' do
    it 'checks map method' do
      
    end
  end
  
  describe '#my_inject' do
    it 'checks inject method' do
      
    end
  end
end
