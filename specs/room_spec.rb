require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../venue')
require_relative('../bar_tab')

class RoomTest < MiniTest::Test

  def setup()

    @song1 = Song.new("Around the World")
    @song2 = Song.new("Champagne Supernova")
    @song3 = Song.new("Don't look back")

    @songs = [@song1, @song2, @song3]

    @room  = Room.new("Room 1", 0, @songs)

    @room1 = Room.new("Room 2", 0, [])
    # @song_list = [@song1, @song2, @song3]
    @room2 = Room.new("Room 3", 10, [])

    @guest1 = Guest.new("Harry", "Wonderwall", 100, 30)
    @guest2 = Guest.new("Tony", "Morning Glory", 50, 20)
    @guest3 = Guest.new("Mary", "Slide Away", 20, 21)
    # @guests = [@guest1, @guest2, @guest3]
    @guests10 = [@guest1, @guest2, @guest3,@guest1, @guest2, @guest3, @guest1]
  end

def test_room_capacity
  assert_equal(10, @room2.room_count)
end

def test_song_list
  assert_equal(@songs, @room.song_list)
end

# def test_add_guest_to_capacity
#   @room.add_guest(@guest1)
#   @room.add_guest(@guest1)
#   assert_equal(2, @room.capacity)
# end

def test_enough_space_in_room
  @room.add_guest(@room1, @guest1)
  assert_equal("Welcome to your karaoke room", @room1.add_guest(@room1, @guest1))
  assert_equal(1, @room1.room_count)
end
###had an issue with using @room1.add_guest, as it was adding guest to both @room1, inout included, meaning actual was 2
###line 54, need to use @room1 for comparison as this is the room that we have added guest to

def test_room_is_full
  @room2.add_guest(@room2, @guest1)
  assert_equal("Sorry, this room is full", @room2.add_guest(@room2, @guest1))
  assert_equal(10, @room2.room_count)
end

def test_add_song_to_playlist
  @room1.add_song_to_playlist(@song1.name)
  assert_equal(["Around the World"], @room1.song_list )
end
##line 45 means the instance of room 1, has name, capacity, tab, and empty array for song_list.  call method with input being new instance of song, called with .name method.  assert that output is array with the name, compared to the instance of room, and the reader of song_list called on it








end
