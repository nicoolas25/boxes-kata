require_relative "./pile"

class Heuristic
  def initialize(available_boxes, pile: nil)
    @available_boxes = available_boxes
    @pile = pile || Pile.new
  end

  def highest_pile
    return @pile unless best_box
    new_pile = @pile << best_box
    remaining_boxes = @available_boxes - [best_box]
    Heuristic.new(remaining_boxes, pile: new_pile).highest_pile
  end

  private

  def best_box
    @best_box ||=
      begin
        possible_boxes = @available_boxes.reject do |box|
          box.weight > @pile.capacity
        end

        sorted_boxes = possible_boxes.sort_by do |box|
          [@pile.capacity, box.capacity].min - box.weight * (box.weight / @pile.capacity)
        end

        sorted_boxes.last
      end
  end
end
