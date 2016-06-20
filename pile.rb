require_relative "./box"

class Pile
  # Create a pile using the given boxes.
  def initialize(boxes = [])
    @boxes = boxes
  end

  # Returns true if the boxes form a valid pile. See the problem for the
  # definition of a valid pile.
  def valid?
    capacity >= 0
  end

  # Returns the height of the Pile.
  def height
    @boxes.size
  end

  def capacity
    @capacity ||=
      if @boxes.empty?
        Float::INFINITY
      else
        first, *rest = @boxes
        rest.reduce(first.capacity) do |max_capacity, box|
          [max_capacity - box.weight, box.capacity].min
        end.to_f
      end
  end

  # Return a new Pile composed by the current pile + the given box on top of it.
  def <<(box)
    Pile.new(@boxes + [box])
  end

  def to_s
    "[" + @boxes.map(&:to_s).join(" | ") + "]"
  end
end
