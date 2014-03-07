var DurationInterpreter = function(milliseconds) {
  var MILLISECONDS_IN_AN_HOUR     = 60 * 60 * 1000;
  var MILLISECONDS_IN_A_MINUTE    =      60 * 1000;
  var MILLISECONDS_IN_A_SECOND    =           1000;

  this.fullHours = Math.floor(milliseconds / MILLISECONDS_IN_AN_HOUR);
  this.fullMinutes = Math.floor((milliseconds - this.fullHours * MILLISECONDS_IN_AN_HOUR) / MILLISECONDS_IN_A_MINUTE);
  this.fullSeconds = Math.floor((milliseconds - this.fullHours * MILLISECONDS_IN_AN_HOUR - this.fullMinutes * MILLISECONDS_IN_A_MINUTE) / 1000);

  this.toHHMMSS = function() {
    var output;
    var secondsString;
    var minutesString;
    var hoursString;

    // Define and set the 3 string components

    if (this.fullHours > 0) {
      hoursString = this.fullHours.toString();
    }

    if (this.fullMinutes > 0) {
      if (this.fullMinutes < 10 && this.fullHours > 0) {
        minutesString = "0" + this.fullMinutes.toString();;
      } else {
        minutesString = this.fullMinutes.toString();
      }
    } else {
      minutesString = "00";
    }
    
    if (this.fullSeconds > 0) {
      if (this.fullSeconds < 10 && (this.fullMinutes > 0 || this.fullHours > 0)) {
        secondsString = "0" + this.fullSeconds.toString();;
      } else {
        secondsString = this.fullSeconds.toString();
      }
    } else {
      secondsString = "00";
    }

    // Concatenate them

    if (this.fullHours > 0) {
      output = hoursString + ":" + minutesString + ":" + secondsString;
    } else if (this.fullMinutes > 0) {
      output = minutesString + ":" + secondsString;
    } else {
      output = "0:" + secondsString;
    }

    return output;
  };

  this.toHourMin = function() {
    var output;

    if (this.fullHours > 0) {
      output = this.fullHours.toString() + " hours";
      if (this.fullMinutes > 0) {
        output += " and " + this.fullMinutes.toString() + " minutes";
      }
    } else {
      output = this.fullMinutes.toString() + " minutes";
    }

    return output;
  };
};
