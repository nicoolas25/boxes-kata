require_relative "./test_helpers"
require_relative "./heuristic"

class HeuristicTest < Minitest::Test
  include TestHelpers

  def test_highest_pile
    pile = Heuristic.new(available_boxes).highest_pile
    assert pile.valid?, "Heuristic#highest_pile should be valid (#{pile})"
    assert_equal 6, pile.height, "#{pile} should have the best height"
  end

  private

  def available_boxes
    boxes("6/3 | 1/2 | 1/1 | 3/4 | 1/3 | 1/1 | 2/4 | 2/7 | 1/1")
  end
end
