/// Helpers.
const double _s = 1000;
const double _m = _s * 60;
const double _h = _m * 60;
const double _d = _h * 24;
const double _w = _d * 7;
const double _y = _d * 365.25;

/// Class that exposes static methoids [fromMs()] and [toMs()].
class MS {
  /// Convert from milliseconds to string representation of time
  ///
  /// Converts [ms], the number of milliseconds to a string representation
  /// rounded to the closes smallest measure of time.
  /// example:
  /// ```dart
  /// MS.fromMs(6499); // '6s'
  /// MS.fromMs(6500); // '7s'
  /// MS.fromMs(6501); // '7s'
  /// MS.fromMs(6999); // '7s'
  /// ```
  /// [long] determines the representation of time measure, if [long] is `true`
  /// the value above will be '6 seconds'.
  static String fromMs(double ms, {bool long = false}) {
    if (_isFinite(ms)) {
      return long ? _fmtLong(ms) : _fmtShort(ms);
    } else {
      throw Exception('val is not a valid number. val=${ms}');
    }
  }

  /// Convert a string representation fo time to the number of milliseconds
  ///
  /// example:
  /// ```dart
  /// MS.toMs('2 days'); // 172800000
  /// ```
  static double toMs(String val) {
    return _parse(val);
  }
}

/// Check if [s] if not `infinite` or `double.nan`.
bool _isFinite(double s) {
  return (s == s) && ((s == 0) || (s != 2 * s));
}

/// Parse the given `str` and return its value in milliseconds.
double _parse(String str) {
  if (str.length > 100) {
    throw Exception(
      'Too long an argument (> 100 string length ) : len=${str.length}',
    );
  }
  final exp = RegExp(
    r'^(-?(?:\d+)?\.?\d+) *(milliseconds?|msecs?|ms|seconds?|secs?|s|minutes?|mins?|m|hours?|hrs?|h|days?|d|weeks?|w|years?|yrs?|y)?$',
    caseSensitive: false,
    unicode: true,
    dotAll: true,
    multiLine: true,
  );
  final matches = exp.allMatches(str);
  if (matches.isEmpty) {
    return double.nan;
  }
  final n = double.parse(matches.first.group(1));
  final type = (matches.first.group(2) ?? 'ms').toLowerCase();
  switch (type) {
    case 'years':
    case 'year':
    case 'yrs':
    case 'yr':
    case 'y':
      return (n * _y);
    case 'weeks':
    case 'week':
    case 'w':
      return (n * _w);
    case 'days':
    case 'day':
    case 'd':
      return (n * _d);
    case 'hours':
    case 'hour':
    case 'hrs':
    case 'hr':
    case 'h':
      return (n * _h);
    case 'minutes':
    case 'minute':
    case 'mins':
    case 'min':
    case 'm':
      return (n * _m);
    case 'seconds':
    case 'second':
    case 'secs':
    case 'sec':
    case 's':
      return (n * _s);
    case 'milliseconds':
    case 'millisecond':
    case 'msecs':
    case 'msec':
    case 'ms':
      return n;
    default:
      return 0.0;
  }
}

/// Short format for `MS.fromMs()`.
String _fmtShort(double ms) {
  final msAbs = ms.abs();
  if (msAbs >= _d) {
    final result = ms / _d;
    return '${result.round().toInt()}d';
  }
  if (msAbs >= _h) {
    final result = ms / _h;
    return '${result.round().toInt()}h';
  }
  if (msAbs >= _m) {
    final result = ms / _m;
    return '${result.round().toInt()}m';
  }
  if (msAbs >= _s) {
    final result = ms / _s;
    return '${result.round().toInt()}s';
  }
  return '${ms.toInt()}ms';
}

/// Long format for `MS.fromMs()`.
String _fmtLong(double ms) {
  final msAbs = ms.abs();
  if (msAbs >= _d) {
    return _plural(ms, msAbs, _d, 'day');
  }
  if (msAbs >= _h) {
    return _plural(ms, msAbs, _h, 'hour');
  }
  if (msAbs >= _m) {
    return _plural(ms, msAbs, _m, 'minute');
  }
  if (msAbs >= _s) {
    return _plural(ms, msAbs, _s, 'second');
  }
  return '${ms.toInt()} ms';
}

/// Pluralization helper.
String _plural(double ms, double msAbs, double n, String name) {
  final isPlural = msAbs >= n * 1.5;
  final time = ms / n;
  final suffix = isPlural ? 's' : '';
  return '${time.round().toInt()} $name$suffix';
}
