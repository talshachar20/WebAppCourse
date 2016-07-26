var aboutZone = {
  title: "About",
  write: "Tal Shachar"

}

var song = {
  title: "shit music",
  artist: "shit artist",
  leangth: '3:45',
  rate: null,
  setRate: function(rate) {
    this.rate = rate
  },
  getRate: function() {
    return this.rate
  },
  getString: function() {
    return "This music called: " + this.title + " by " + this.artist + " your rate is: " + this.getRate() ;
  },
  convertLeangth: function() {
    return parseFloat(this.leangth);
  }
};

var Album = function(song, leangth, artist, album_title) {
  this.album_title = album_title;
  this.song_title = song;
  function albumDetails() {
    console.log("Album name: " + this.album_title + " with the song: " + this.song_title);
  }
 }

 var SongList = function() {
   this.song_list = [];
   this.add_song = function() {
     return this.song_list.push(song);
   };
 }

var myModule = (function() {
  var myVar = "myVarosh";
  return {
    taltest: function(overrider) {
      $("#email_field").html(overrider)
    },
    takeFromJson: function() {
      $("#email_field").html(this.myVar)
    },
  }
}());
