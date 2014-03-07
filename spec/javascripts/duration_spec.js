//= require helpers/duration

describe('DurationInterpreter', function() {
  describe('toHHMMSS', function() {
    it('should return the duration in HH:MM:SS format', function(){
      assert.equal("0:34", new DurationInterpreter(34000).toHHMMSS());
      assert.equal("4:09", new DurationInterpreter(249000).toHHMMSS());
      assert.equal("4:12", new DurationInterpreter(252000).toHHMMSS());
      assert.equal("20:00", new DurationInterpreter(1200000).toHHMMSS());
      assert.equal("2:08:45", new DurationInterpreter(7725000).toHHMMSS());
      assert.equal("12:00:00", new DurationInterpreter(43200000).toHHMMSS());
    })
  })

  describe('toHourMin', function() {
    it("should return the duration in 'H hours and M minutes' format", function(){
      assert.equal("4 minutes", new DurationInterpreter(249000).toHourMin());
      assert.equal("4 minutes", new DurationInterpreter(252000).toHourMin());
      assert.equal("20 minutes", new DurationInterpreter(1200000).toHourMin());
      assert.equal("2 hours and 8 minutes", new DurationInterpreter(7725000).toHourMin());
      assert.equal("12 hours", new DurationInterpreter(43200000).toHourMin());
    })
  })
})
