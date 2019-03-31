require('pry')
class Guest

  attr_accessor :name, :favourite_song, :wallet, :age

  def initialize(name, favourite_song, wallet, age)
    @name = name
    @favourite_song = favourite_song
    @wallet = wallet
    @age = age
  end

  def favourite_song_in_room(guest, room)
    room.song_list.each do |song_name|
      if song_name == guest.favourite_song
      end
      return "Whoooo!"
    end
##### couldn't figure out how to get it to p to console instead of just return??
  end

###########################

  # def pay_entry_fee(guest, venue, bar_tab, room)
    # if guest.wallet >= venue.entry_fee
    #   then
    #   guest.wallet -= venue.entry_fee
    #   p  "Welcome, let's find you a room"
    #   venue.rooms.each do |each_room|
    #     if venue.rooms.room_count <= 9
    #       bar_tab.bar_total[:entry_fee_total] += venue.entry_fee
    #     else
    #       return "Sorry, you can't come in tonight"
    #     end
    #   end
  #     end
  # end

  # def pay_fee_and_add_to_room(guest, venue, bar_tab, room)
    # if guest.wallet >= venue.entry_fee
    #   guest.wallet -= venue.entry_fee
    #   "Lets find your room"
    # else
    #   p  "Sorry, you can't come in"

      # return guest.wallet -= venue.entry_fee if         guest.wallet >= venue.entry_fee
      # binding.pry
      # return "Lets find your room"   if guest.wallet >= venue.entry_fee
  #     p "Sorry, you can't come in" if guest.wallet < venue.entry_fee
  #
  #
  #     if room.room_count <= 9
  #     room.room_count += 1
  #     bar_tab.entry_fee_total += venue.entry_fee
  #     p  "Welcome to #{room.name}"
  #   else
  #     p "Please choose another room"
  #     end
  # end

#######################

  def pay_entry_fee(guest, venue)
    if guest.wallet >= venue.entry_fee && guest.age > 17
      guest.wallet -= venue.entry_fee
    else
      p "Sorry, you can't come in"
    end
  end

  def add_fee_to_tab_and_guest_to_room(guest, room, bar_tab, venue)
    if room.room_count <= 9
        room.room_count += 1
        ####for some reason couldn't use .add_guest method?
        bar_tab.entry_fee_total += venue.entry_fee
        bar_tab.room_number = room.name
        p "Welcome to your room"
        guest.favourite_song_in_room(guest, room)
    else
        p "Please choose another room"
    end
  end








end
