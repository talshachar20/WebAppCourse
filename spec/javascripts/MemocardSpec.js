describe("memo_card", function() {
    var refresher;

    beforeEach(function() {
        refresher = new TestFunction();
    });

    it("return refresh", function() {
        window.alert(refresher.theNumber);
        expect(refresher.theNumber).toEqual(5);
    });
});
