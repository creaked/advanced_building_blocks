def bubble_sort(array)
  array.length.times do
    (0..array.size-2).each do |x|
      array[x], array[x+1] = array[x+1], array[x] if array[x] > array[x+1]
    end
  end
  p array
end

bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(array)
  (array.length).times do
    (0..array.size-2).each do |x|
      array[x], array[x+1] = array[x+1], array[x] if yield(array[x],array[x+1]) > 0 
    end
  end
  p array
end

bubble_sort_by(["hi","hello","hey"]) do |left, right|
  left.length - right.length
end