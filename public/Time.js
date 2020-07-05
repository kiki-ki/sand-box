function int(a) {
  return Math.floor(a);
}
var Time = {
  MILLISECONDS: 1,
  SECONDS: 1e3,
  MINUTES: 6e4,
  HOURS: 36e5,
  DAYS: 864e5,
  daysInMonth: [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
  totalYears: 0,
  remainingYears: 0,
  totalMonths: 0,
  remainingMonths: 0,
  totalDays: 0,
  remainingDays: 0,
  totalHours: 0,
  remainingHours: 0,
  totalMinutes: 0,
  remainingMinutes: 0,
  totalSeconds: 0,
  remainingSeconds: 0,
  totalMilliseconds: 0,
  remainingMilliseconds: 0,
  calcTime: function(startDate, endDate) {
    const c = endDate.getTime() - startDate.getTime();

    Time.totalMilliseconds = c / Time.MILLISECONDS;
    Time.totalSeconds = c / Time.SECONDS;
    Time.totalMinutes = c / Time.MINUTES;
    Time.totalHours = c / Time.HOURS;
    Time.totalDays = c / Time.DAYS;
    Time.totalMonths = Time.calcTotalMonths(Time.totalDays, startDate);
    Time.totalYears = Time.totalMonths / 12;
    Time.remainingYears = int(Time.totalYears);
    Time.remainingMonths = int(Time.totalMonths - 12 * Time.remainingYears);
    Time.remainingDays = int(Time.totalDays - Time.getDaysFromMonths(startDate, Time.totalMonths));
    Time.remainingHours = int(Time.totalHours - 24 * int(Time.totalDays));
    Time.remainingMinutes = int(Time.totalMinutes - 60 * int(Time.totalHours));
    Time.remainingSeconds = int(Time.totalSeconds - 60 * int(Time.totalMinutes));
    Time.remainingMilliseconds = int(Time.totalMilliseconds - 1e3 * int(Time.totalSeconds));
  },
  isLeapYear: function(a) {
    return a > 0 && !(a % 4) && (a % 100 || !(a % 400));
  },
  calcTotalMonths: function(a, b) {
    let c = b.getMonth(),
      d = b.getFullYear(),
      g = 0;
    for (; a > Time.daysInMonth[c]; g++){
      a -= Time.daysInMonth[c];
      2 == c && Time.isLeapYear(d) && (a -= 1);
      c++;
      12 == c && (c = 0, d++);
    }
    return g + a / Time.daysInMonth[c];
  },
  getDaysFromMonths: function(a, b) {
    let c = a.getMonth(),
      d = a.getFullYear(),
      g = 0;
    for (let h = 0; int(b) > h; h++){
      g += Time.daysInMonth[c];
      2 == c && Time.isLeapYear(d) && (g += 1);
      c++;
      12 == c && (c = 0, d++);
    }
    return g;
  }
};
