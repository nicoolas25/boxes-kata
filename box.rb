# Problem:
#
# There are given n boxes, each one has fixed weight and strength (both given in kg).
# Box's strength tells us what is the maximum weight it can bear. We have to form the
# highest pile of given boxes (each of them has the same height).
#
# You should propose an algorithm that will always give an optimal solution,
# which is the longest sequence of k boxes (k <= n).

class Box
  attr_reader :weight
  attr_reader :capacity

  # Create a new box with the following properties:
  #
  #   box = Box.new(1, 5)
  #   box.weight == 1
  #   box.capacity == 5
  def initialize(weight, capacity)
    @weight, @capacity = weight, capacity
  end

  def to_s
    "#{weight}/#{capacity}"
  end
end

