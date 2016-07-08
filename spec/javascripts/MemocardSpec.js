describe("memo_card", function() {
    var refresher;

  beforeEach(function() {
      json = {};
  });

  describe ("when we have more right answers then wrong ones", function() {
    it("returns good Kooshkoosh", function() {
        json = {right_answers: 5, wrong_answers: 3};
        userDailyInfoVar = new user_daily_info(json);
        expect(userDailyInfoVar.therun).toContain("Good KooshKoosh ");
    });
  });

  describe ("when we have more wrong answers then correct ones", function() {
    it("returns bad Kooshkoosh", function() {
        json = {right_answers: 3, wrong_answers: 5};
        userDailyInfoVar = new user_daily_info(json);
        expect(userDailyInfoVar.therun).toContain("Bad Kooshkoosh");
    });
  });

  describe ("when we have same amount of wrong and write answers", function() {
    it("returns bad Kooshkoosh", function() {
        json = {right_answers: 5, wrong_answers: 5};
        userDailyInfoVar = new user_daily_info(json);
        expect(userDailyInfoVar.therun).toContain("Bad Kooshkoosh");
    });
  });
});
