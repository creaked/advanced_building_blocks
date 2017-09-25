require "my_enumerable"

describe Enumerable do
  let(:array) {[1, 2, 3]}
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
end