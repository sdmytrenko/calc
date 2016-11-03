require "minitest/autorun"
require "./calc"

describe :calculate do
  it " 40 + 2 = 42" do
    assert_equal 42, calculate('40 + 2')
  end

  it " 40 + 3 = 43" do
    assert_equal 43, calculate('40 + 3')
  end

  it " 50 - 10 = 40" do
    assert_equal 40, calculate('50 - 10')
  end

  it " 2 * 2 = 4" do
    assert_equal 4, calculate('2 * 2')
  end

  it " 2 * 2 + 2 = 6" do
    assert_equal 6, calculate('2 * 2 + 2')
  end

  it " 2 * (2 + 2) = 8" do
    assert_equal 8, calculate('2 * (2 + 2)')
  end

  it " 2 * (2 + 2) - 8 = 0" do
    assert_equal 0, calculate('2 * (2 + 2) - 8')
  end

  it " 4 / (1 + 1) = 2" do
    assert_equal 2, calculate('4 / (1 + 1)')
  end

  it " 1 + (-2) = -1" do
    assert_equal (-1), calculate('1 + (-2)')
  end

  it " -1 - 1 = -2" do
    assert_equal (-2), calculate('-1 - 1')
  end

# My own tests:

  it "  ( 2 + 3   ) * ( 4 - 1)" do
    assert_equal (15), calculate('  ( 2 + 3   ) * ( 4 - 1)')
  end

  it "  ( 2 + 3   ) * ( 1 - 4)" do
    assert_equal (-15), calculate('  ( 2 + 3   ) * ( 1 - 4)')
  end

  it "    1 - 2 + ( 8 - 5 + 2 * 3 ) * 4 " do
    assert_equal (35), calculate('    1 - 2 + ( 8 - 5 + 2 * 3 ) * 4 ')
  end

  it "          5 - 10 " do
    assert_equal (-5), calculate('          5 - 10 ')
  end

  it " 5 + 2 -10 " do
    assert_equal (-3), calculate(' 5 + 2 -10 ')
  end

  it " -1 - 1 + 4 " do
    assert_equal (2), calculate(' -1 - 1 + 4 ')
  end

  it " (-4) * 3 + 4 " do
    assert_equal (-8), calculate(' (-4) * 3 + 4 ')
  end

  it " 1 + 2 + 3 + 4 + 5 * 6" do
    assert_equal (40), calculate(' 1 + 2 + 3 + 4 + 5 * 6')
  end

  it "-5 * 2 /5" do
    assert_equal (-2), calculate('-5 * 2 /5')
  end

  it "( -1 - 1) * (5 - (8 - 3) = 0" do
    assert_equal (0), calculate('( -1 - 1) * (5 - (8 - 3)')
  end

end
