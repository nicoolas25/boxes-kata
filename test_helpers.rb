require "pry-byebug"
require "minitest/autorun"

require_relative "./box"
require_relative "./pile"

# A bruteforce resolution of the problem
class PileExplorer
  def initialize(available_boxes)
    @available_boxes = available_boxes
  end

  # Create the highest pile from the available boxes.
  def highest_pile
    best_pile = Pile.new
    @available_boxes.permutation.each do |boxes|
      pile = build_from(boxes)
      if pile.height > best_pile.height
        best_pile = pile
      end
    end
    best_pile
  end

  private

  def build_from(boxes)
    pile = Pile.new
    boxes.each do |box|
      new_pile = pile << box
      if new_pile.valid?
        pile = new_pile
      else
        break
      end
    end
    return pile
  end
end

module TestHelpers
  def pile(boxes_str)
    Pile.new(boxes(boxes_str))
  end

  def box(box_str)
    weight, capacity = box_str.scan(/\d+/).map(&:to_i)
    Box.new(weight, capacity)
  end

  def boxes(boxes_str)
    boxes_str.split(" | ").map { |box_str| box(box_str) }
  end
end
