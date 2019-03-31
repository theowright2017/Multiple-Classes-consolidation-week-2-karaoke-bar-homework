require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../venue')
require_relative('../bar_tab')

class SongTest < MiniTest::Test

def setup()
  @song = Song.new("Slide Away")

end

def test_song
  assert_equal("Slide Away", @song.name)
end

end
