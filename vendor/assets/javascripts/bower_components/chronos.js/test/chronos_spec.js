(function() {

  module('Chronos');

  test('toHHMMSS', function() {
    equal("0:34", new Chronos(34000).toHHMMSS());
    equal("4:09", new Chronos(249000).toHHMMSS());
    equal("4:12", new Chronos(252000).toHHMMSS());
    equal("20:00", new Chronos(1200000).toHHMMSS());
    equal("2:08:45", new Chronos(7725000).toHHMMSS());
    equal("12:00:00", new Chronos(43200000).toHHMMSS());
  })

  test('toHourMin', function() {
    equal("4 minutes", new Chronos(249000).toHourMin());
    equal("4 minutes", new Chronos(252000).toHourMin());
    equal("20 minutes", new Chronos(1200000).toHourMin());
    equal("2 hours and 8 minutes", new Chronos(7725000).toHourMin());
    equal("12 hours", new Chronos(43200000).toHourMin());
  })

})();
