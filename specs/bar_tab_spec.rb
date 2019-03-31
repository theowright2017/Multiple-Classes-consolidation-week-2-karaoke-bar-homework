require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../venue')
require_relative('../bar_tab')

class BarTabTest < MiniTest::Test

  def setup()
    @bar_tab = BarTab.new({
      drinks: 30,
      entry_fee_total: 100
      }, "Room 1")
  end

  def test_drinks_and_entry_total
    assert_equal(30, @bar_tab.bar_total[:drinks])
    assert_equal(100, @bar_tab.bar_total[:entry_fee_total])
  end

end
