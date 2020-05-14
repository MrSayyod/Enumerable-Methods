require './enumerables'
describe Enumerable do
  let(:array_with_numbers) { [1, 2, 3, 4, 5] }
  let(:array_with_strings) { ['one', 'two', 'three', 'four', 'five'] }
  let(:array_with_numbers_and_nil) { [1, 2, 3, 4, nil] }
  let(:array_with_strings_and_numbers) { ['one', 2, 'three', 4, 'five'] }
  let(:empty_array) { [] }

  describe '#my_each' do
    it 'checks each method' do
      actual = empty_array
      array_with_numbers.my_each {|x| actual.push(x + 1)}
      expected = empty_array
      array_with_numbers.each {|x| actual.push(x + 1)}
      expect(actual).to eql(expected)
    end
  end

  describe '#my_each_with_index' do
    it 'checks each with index method' do
      
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
