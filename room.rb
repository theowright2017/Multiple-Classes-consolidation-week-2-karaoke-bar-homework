require('pry')
class Room

  attr_accessor :name,  :song_list, :room_count

def initialize(name, room_count, song_list)
  @name = name
  @room_count = room_count
  @song_list = song_list
end

def add_guest(room, guest)
  # binding.pry
  if room.room_count <= 9
    then
    room.room_count +=1
    "Welcome to your karaoke room"
  else
    return "Sorry, this room is full"
  end
end

def add_song_to_playlist(song)
  song_list.push(song)
end
###pushes song input into song_list, auto confirms its an array by using push




end
