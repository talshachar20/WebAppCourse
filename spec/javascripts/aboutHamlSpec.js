describe("aboutHaml", function() {
  describe("when choosing song", function() {
    it ("returns shit music", function() {
      expect(song.title).toContain("shit music");
      expect(typeof song.convertLeangth()).toEqual('number');
    });
  });

  describe("when choosing album", function() {
    var myAlbum = new Album("mani", "janny", "ddd", "shit album");
    it ("returns shit album", function() {
      expect(myAlbum.album_title).toContain("shit album");
      expect(myAlbum.song_title).toContain("mani");
    });
  });
});
