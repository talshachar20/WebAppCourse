var song = {
  title: "shit music",
  artist: "shit artist",
  rate: null,
  setRate: function(rate) {
    this.rate = rate
  },
  getRate: function() {
    return this.rate
  },
  getString: function() {
    return "This music called: " + this.title + " by " + this.artist + " your rate is: " + this.getRate() ;
  }
};

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
