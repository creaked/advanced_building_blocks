require "my_enumerable"

describe Enumerable do
  let(:array) {[1, 2, 3]}
  let(:word_array) {["ant", "bear", "cat"]}
  before :each {@test = []}
  
  describe "#my_each" do
    it "applies a block to each element of an array" do
      array.my_each { |element| @test << element }
      expect(@test).to eql(array)
    end
  end
  
  describe "#my_each_with_index" do
    it "applies a block to each element of an array" do
      array.my_each_with_index { |element, index| @test << element }
      expect(@test).to eql(array)
    end
    
    it "passes the index of each element" do
      array.my_each_with_index { |element, index| @test << element if index == 0..3 }
      expect(@test).to eql(array)
    end
  end
  
  describe "#my_select" do
    it "select all even elements in an array" do
      array.my_select { |element| @test << element if element%2 == 0 }
      expect(@test).to eql([2])
    end
  end
  
  describe "#my_all?" do
    it "returns true" do
      expect(word_array.my_all? { |word| word.length >= 3 }).to eql(true)
    end
    
    it "returns false" do
      expect(word_array.my_all? { |word| word.length >= 4 }).to eql(false)
    end
  end
  
  describe "#my_any?" do
    it "returns true" do
      expect(word_array.my_any? { |word| word.length >= 3 }).to eql(true)
    end
    
    it "returns false" do
      expect(word_array.my_any? { |word| word.length >= 5 }).to eql(false)
    end
  end
  
  describe "#my_none?" do   
    it "returns true" do
      expect(word_array.my_none? { |word| word.length >= 5 }).to eql(true)
    end
    
    it "returns false" do
      expect(word_array.my_none? { |word| word.length >= 3 }).to eql(false)
    end
  end
  
  describe "#my_count" do
    it "returns length of array" do
      expect(array.my_count).to eql(3)
    end
    
    it "takes an argument" do
      expect(array.my_count(2)).to eql(1)
    end
    
    it "takes a block" do
      expect(array.my_count{ |x| x%2 == 0 }).to eql(1)
    end
  end
  
  describe "#my_map" do
    it "appends string to element of an array" do
      @test = word_array.my_map { |x| x + "!" }
      expect(@test).to eql(["ant!", "bear!", "cat!"])
    end
  end
  
  describe "#my_inject" do
    it "returns sum of numbers in array" do
      expect(array.my_inject { |sum, n| sum + n }).to eql(6)
    end
  end
end