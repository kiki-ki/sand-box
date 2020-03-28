
function getSModifier(e) {
  return 0 == e ? "" : 1 == e ? " " : "s ";
}

function padTimeText(e) {
  return 10 > e ? "0" + e : "" + e;
}

function getTimeText(e, g) {
  return e > 0 ? (e + " " + g + getSModifier(e)) : "";
}

function windowResize() {
  Pitch.staticArea.width($(window).width() - 20);
  Pitch.staticArea.height($(window).height() - 20);
  Pitch.updateText(Pitch.defaultText);
}

var Pitch = {
  name: "PitchTimer",
  defaultText: "",
  expiredMessage: "",
  progress: 0,
  startTime: 0,
  endTime: 0,
  totalTime: 0,
  parseError: "",
  progressText: null,
  staticArea: null,
  beep: null,
  currDate: null,
  endDate: null,
  ticker: null,
  startButton: null,
  sequence: [],
  canAlert: true,
  start: function() {
    if ("" !== Pitch.parseError && "none" !== Pitch.parseError) {
      return void Pitch.updateText("Exists parse error: " + Pitch.parseError);
    }
    if (0 === Pitch.sequence.length) {
      Pitch.initializeTimer(Pitch.startTime, Pitch.endTime);
    } else {
      const e = Pitch.sequence.shift();
      Pitch.initializeTimer(0, 1e3 * e);
    }
  },
  initializeTimer: function(e, g) {
    Pitch.endTime = g;
    Pitch.startTime = e;
    Pitch.totalTime = Pitch.endTime - Pitch.startTime;
    Pitch.currDate = new Date;
    Pitch.endDate = new Date(Pitch.currDate.getTime() + Pitch.totalTime);
    Pitch.expiredMessage = Pitch.expiredMessage || "Time Expired!";
    Pitch.update();
    Pitch.ticker || (Pitch.ticker = setInterval(Pitch.update, 250));
  },
  update: function() {
    Time.calcTime(Pitch.currDate, Pitch.endDate);
    Pitch.updateParts(Time);
  },
  updateParts: function(e) {
    if (e.totalSeconds < 0){ return void Pitch.onTimeComplete(); }

    let g, t, i, a, r, n, s = [];

    g = t = i = a = r = n = "";
    e.remainingYears > 0 && (s.push(padTimeText(e.remainingYears) + "y"),
      g = getTimeText(e.remainingYears, "year"));
    e.remainingMonths > 0 && (s.push(padTimeText(e.remainingMonths) + "m"),
      t = getTimeText(e.remainingMonths, "month"));
    e.remainingDays > 0 && (s.push(padTimeText(e.remainingDays) + "d"),
      i = getTimeText(e.remainingDays, "day"));
    e.remainingHours > 0 && (s.push(padTimeText(e.remainingHours) + "h"),
      a = getTimeText(e.remainingHours, "hour"));
    e.remainingMinutes > 0 ? (s.push(padTimeText(e.remainingMinutes)),
      r = getTimeText(e.remainingMinutes, "minute")) : s.push(padTimeText(0));
    e.remainingSeconds > 0 ? (s.push(padTimeText(e.remainingSeconds)),
      n = getTimeText(e.remainingSeconds, "second")) : s.push(padTimeText(0));

    const o = g + t + i + a + r + n;

    Pitch.updateTitle(s.join(":"));
    Pitch.updateText(o);
    Pitch.progress = (Pitch.totalTime - e.totalMilliseconds) / Pitch.totalTime;
    Pitch.currDate = new Date;
  },
  updateTitle: function(e) {
    document.title = e + " - Pitchtimer";
  },
  updateText: function(e) {
    e && Pitch.progressText.html(e);
  },
  onTimeComplete: function() {
    if (Pitch.progress = 1,
        0 === Pitch.sequence.length){
      clearInterval(Pitch.ticker);
      Pitch.alert();
    } else {
      const e = Pitch.sequence.shift();
      Pitch.initializeTimer(0, 1e3 * e);
    }
  },
  alert: function() {
    Pitch.canAlert ? Pitch.beep.volume = 1 : Pitch.beep.volume = 0;
    Pitch.beep.play();
    Pitch.updateText(Pitch.expiredMessage);
  }
};

$(function() {
  Pitch.staticArea = $("#static");
  Pitch.startButton = $("#textWrapper");
  Pitch.progressText = $("#progressText");
  Pitch.beep = document.getElementById("alarm");
  $(window).bind("resize", windowResize);
  windowResize();
  Pitch.startButton.click(function() {
    Pitch.beep && Pitch.beep.load && Pitch.beep.load();
    Pitch.start();
    Pitch.startButton.unbind("click");
  });
  Pitch.startButton.show();
  Pitch.start();
});