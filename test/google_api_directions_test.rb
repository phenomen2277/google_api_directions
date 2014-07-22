require "test_helper"

class GoogleApiDirectionsTest < Test::Unit::TestCase
  def test_if_argument_error_exception_is_thrown_when_getting_directions
    g = GoogleApiDirections::GoogleDirections.new

    assert_raise ArgumentError do
      g.directions("", "", "en")
    end
  end

  def test_if_runtime_error_exception_is_thrown_when_getting_directions
    g = GoogleApiDirections::GoogleDirections.new

    assert_raise RuntimeError do
      g.directions("?", "2", "en")
    end
  end

  def test_if_directions_are_valid_after_successful_calling_of_directions_method
    g = GoogleApiDirections::GoogleDirections.new
    result = g.directions("Fittjavägen 1 Norsborg", "Slottsbacken 1 Stockholm", "sv")
    assert result[:directions].any?
  end

  def test_if_distance_is_present_after_successful_calling_of_directions_method
    g = GoogleApiDirections::GoogleDirections.new
    result = g.directions("Fittjavägen 1 Norsborg", "Slottsbacken 1 Stockholm", "sv")
    assert !result[:directions].nil?
  end

  def test_if_duration_is_present_after_successful_calling_of_directions_method
    g = GoogleApiDirections::GoogleDirections.new
    result = g.directions("Fittjavägen 1 Norsborg", "Slottsbacken 1 Stockholm", "sv")
    assert !result[:duration].nil?
  end

end