require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../venue')
require_relative('../bar_tab')

class VenueTest < MiniTest::Test

def setup()
  @venue = Venue.new("Bob's Disco", 25.0, @rooms)

  @room1 = Room.new("Room 1", 0, [])
  @room2 = Room.new("Room 2", 0, [])
  @room3 = Room.new("Room 3", 0, [])
end

def test_entry_fee
  assert_equal(25, @venue.entry_fee)
end



end
