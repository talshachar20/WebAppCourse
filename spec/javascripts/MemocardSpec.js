describe("memo_card", function() {
    var refresher;
    var foo, bar = null;

  beforeEach(function() {
    json = {};
    jasmine.Ajax.install();
  });

  afterEach(function() {
    jasmine.Ajax.uninstall();
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

  describe ("when usrt didnt reply on any answers", function() {
    it("returns alert", function() {
        json = {right_answers: 0, wrong_answers: 0};
        userDailyInfoVar = new user_daily_info(json);
        expect(userDailyInfoVar.therun).toContain("You havent replied any questions yet");
    });
  });

  describe ("when we getting null from answers", function() {
    it("returns error", function() {
        json = {right_answers: null, wrong_answers: null};
        userDailyInfoVar = new user_daily_info(json);
        expect(userDailyInfoVar.therun).toContain("Error occured");
    });
  });

  describe ("success_click_from_user", function() {
    it("returns test", function() {
      clicked_answer = "test"
      json2 = {answer: "true", nextid: 2}; //todo need to create memo card
      spyOn(self, "next_one").and.returnValue(null);
      spyOn(self, "same_page").and.returnValue(null);
      spyOn(self, "success_click_from_user");
      self.success_click_from_user(json2);
      expect(self.success_click_from_user).toHaveBeenCalled();
      expect(self.success_click_from_user).toHaveBeenCalledWith(json2);
    });
  });
});
