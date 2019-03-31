require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../venue')
require_relative('../bar_tab')

class GuestTest < MiniTest::Test

  def setup()
    @guest = Guest.new("Mike", "Wonderwall", 20, 25)
    @guest1 = Guest.new("Tom", "Slide Away", 100, 30)
    @guest2 = Guest.new("Luke", "Wonderwall", 80, 17)

    @favourite_song = Song.new("Wonderwall")

    @bar_tab = BarTab.new(0, 0, "Room 1")

    @venue = Venue.new("Bob's Disco", 25.0)

    @venue_new = Venue.new("The Club", 25.0)

    @room1 = Room.new("Room 1", 10, ["Wonderwall", "Live Forever"])
    @room2 = Room.new("Room 2", 0, ["Don't Look Back in Anger", "Live Forever"] )

    @rooms = [@room1, @room2]
  end

  def test_favourite_song
    assert_equal("Wonderwall", @guest.favourite_song)
  end

  def test_check_wallet_amount
    assert_equal(20, @guest.wallet)
  end

  # def test_pay_entry_fee_enough
  #   @guest1.pay_entry_fee(@guest1, @venue)
  #   # assert_equal(125, #@bar_tab.bar_total[:entry_fee_total])
  #   assert_equal(75, @guest1.wallet)
  # end
  #
  # def test_pay_entry_fee_insufficient
  #   @guest.pay_entry_fee(@guest, @venue)
  #   assert_equal(100, #@bar_tab.bar_total[:entry_fee_total])
  #   assert_equal(20, @guest.wallet)
  # end

def test_guest_has_favourite_song
  @guest.favourite_song_in_room(@guest1, @room1)
  assert_equal("Whoooo!", @guest.favourite_song_in_room(@guest1, @room1))
end


# def test_pay_entry_fee_and_add_to_room
#   @guest.pay_fee_and_add_to_room(@guest1, @venue, @bar_tab, @room)
#   assert_equal(75, @guest1.wallet)
#   # assert_equal()
# end

# def test_pay_entry_fee_insufficient
#   @guest.pay_entry_fee(@guest, @venue, @bar_tab, @room1)
#   assert_equal(100, @bar_tab.bar_total[:entry_fee_total])
#   assert_equal(20, @guest.wallet)
# end

#####attempted to write method that would include, checking guest's wallet, if sufficient funds, can enter venue and entry fee would be removed.  then would check which room has capacity and guest would enter room, and entry fee would be paid to that rooms tab.  Can we discuss further????

######################

def test_pay_entry_fee
  @guest1.pay_entry_fee(@guest1, @venue)
  assert_equal(75, @guest1.wallet)
end

def test_guest_is_old_enough
  @guest1.pay_entry_fee(@guest2, @venue)
  assert_equal(80, @guest2.wallet)
end

def test_cant_afford_entry_fee
  @guest.pay_entry_fee(@guest, @venue)
  assert_equal(20, @guest.wallet)
end

def test_add_entry_fee_to_room_tab_room_has_space
  @guest.add_fee_to_tab_and_guest_to_room(@guest1, @room2, @bar_tab, @venue)
  assert_equal(1, @room2.room_count)
  assert_equal(25, @bar_tab.entry_fee_total)
  assert_equal("Room 2", @bar_tab.room_number)
end

def test_room_is_full
    @guest.add_fee_to_tab_and_guest_to_room(@guest1, @room1, @bar_tab, @venue)
    assert_equal(10, @room1.room_count)
    assert_equal(0, @bar_tab.entry_fee_total)
    assert_equal("Room 1", @bar_tab.room_number)
end





















end
