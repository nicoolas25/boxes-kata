require_relative "./test_helpers"
require_relative "./pile"

class PileTest < Minitest::Test
  include TestHelpers

  def test_valid_pile
    valid_examples.each do |valid_example|
      assert valid_example.valid?, "#{valid_example} should be valid"
    end
  end

  def test_invalid_pile
    invalid_examples.each do |invalid_example|
      refute invalid_example.valid?, "#{invalid_example} should be invalid"
    end
  end

  private

  def valid_examples
    [
      "",
      "1/2 | 1/2",
      "1/2 | 1/2 | 1/1",
    ].map { |pile_str| pile(pile_str) }
  end

  def invalid_examples
    [
      "1/2 | 3/2",
      "1/2 | 1/2 | 2/1",
    ].map { |pile_str| pile(pile_str) }
  end
end
