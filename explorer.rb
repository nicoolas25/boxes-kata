require_relative "./pile"

class Explorer
  def initialize(available_boxes)
    @available_boxes = available_boxes
  end

  def highest_pile
    boxes = boxes_permutations(@available_boxes).sort_by(&:size).last
    Pile.new(boxes)
  end

  private

  def boxes_permutations(boxes)
    if boxes.empty?
      []
    elsif boxes.size == 1
      [boxes]
    else
      head, *rest = boxes
      boxes_permutations(rest).each_with_object([]) do |boxes, result|
        additions = false
        0.upto(boxes.size) do |index|
          new_boxes = boxes.clone.insert(index, head)
          if valid_pile?(new_boxes)
            additions = true
            result << new_boxes
          end
        end
        result << boxes unless additions
      end
    end
  end

  def valid_pile?(boxes)
    first, *rest = boxes
    rest.reduce(first.capacity) do |max_capacity, box|
      [max_capacity - box.weight, box.capacity].min
    end >= 0
  end
end
