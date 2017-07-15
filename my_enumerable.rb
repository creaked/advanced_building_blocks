module Enumerable
  def my_each
    x = 0
    self.length.times do
      yield(self[x])
      x += 1
    end
  end
  
  def my_each_with_index
    x = 0
    self.length.times do
      yield(self[x], x)
      x += 1
    end   
  end
  
  def my_select
    new_array = Array.new
    self.my_each {|x| new_array << x if yield(x)}
    return new_array
  end
  
  def my_all?
    self.my_each do |x|
      true_false = yield(x)
      return false unless true_false
    end
    return true
  end
  
  def my_any?
    self.my_each do |x|
      true_false = yield(x)
      return true if true_false
    end
    return false
  end
  
  def my_none?
    self.my_each do |x|
      true_false = yield(x)
      return false if true_false
    end
    return true
  end
  
  def my_count(*n)
    count=0
    self.my_each do |x|
      if block_given?
        count+=1 if yield(x)
      elsif !n.empty?
        count+=1 if x==n[0]
      else
        count+=1
      end
    end
    count
  end
  
  def my_map
    new_array = Array.new
    if block_given?
      self.my_each {|x| new_array << yield(x)}
    else
      self.my_each {|x| new_array << x}
    end
    return new_array
  end
    
  def my_inject
    inject = self
    if inject == nil
      inject = 0
    else
      inject = 1
    end
    
    self.my_each {|x| inject = yield(inject, x)}
    return inject
  end

end

def multiply_els(array)
  array.my_inject{|x, y| x * y }
end