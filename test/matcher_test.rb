require 'minitest/autorun'
require 'minitest/pride'
require './lib/matcher'

class MatcherTest < Minitest::Test
  def test_it_exists
    assert MatcherTest
  end

  def test_it_knows_a_full_match
    secret = 'bbgb'
    guess  = 'bbgb'

    matcher = Matcher.new(secret, guess)

    assert matcher.full_match?
  end

  def test_it_knows_no_matches
    secret = 'bgbg'
    guess = 'yryr'

    matcher = Matcher.new(secret, guess)

    refute matcher.full_match?
  end

  def test_it_counts_correct_positions
    secret = 'bbgb'
    guess = 'byyy'

    guess2 = 'bbgg'
    guess3 = 'ggbg'

    matcher = Matcher.new(secret, guess)
    matcher2 = Matcher.new(secret, guess2)
    matcher3 = Matcher.new(secret, guess3)

    assert_equal 1, matcher.correct_positions
    assert_equal 3, matcher2.correct_positions
    assert_equal 0, matcher3.correct_positions
  end

  def test_it_counts_correct_colors
    skip
    secret = 'bbbg'
    guess = 'bggg'

    matcher = Matcher.new(secret, guess)

    assert_equal 2, matcher.correct_colors
  end

  def test_it_knows_how_many_colors_match
  end

  def test_it_wins
    skip
    mm = Mastermind.new
    secret = "bbgb"
    result = mm.execute("bbgb")
    # require 'pry'; binding.pry
    assert result.message.downcase.include?("congratulations")
  end
end
