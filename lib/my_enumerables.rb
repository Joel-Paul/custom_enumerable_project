module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each { |elem| yield elem }
  end
end

module Enumerable
  def my_each_with_index
    index = 0
    self.each do |elem|
      yield(elem, index)
      index += 1
    end
  end

  def my_select
    selection = []
    self.each do |elem|
      selection << elem if yield elem
    end
    selection
  end

  def my_all?
    self.each { |elem| return false unless yield elem }
    true
  end

  def my_any?
    self.each { |elem| return true if yield elem }
    false
  end

  def my_none?
    self.each { |elem| return false if yield elem }
    true
  end
end
