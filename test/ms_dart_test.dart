import 'package:ms_dart/ms_dart.dart';
import 'package:test/test.dart';

void main() {
  // strings

  group('MS.toMs(string)', () {
    test('should not throw an error', () {
      expect(() {
        MS.toMs('1m');
      }, returnsNormally);
    });

    test('should preserve ms', () {
      expect(MS.toMs('100'), 100);
    });

    test('should convert from m to ms', () {
      expect(MS.toMs('1m'), 60000);
    });

    test('should convert from h to ms', () {
      expect(MS.toMs('1h'), 3600000);
    });

    test('should convert d to ms', () {
      expect(MS.toMs('2d'), 172800000);
    });

    test('should convert w to ms', () {
      expect(MS.toMs('3w'), 1814400000);
    });

    test('should convert s to ms', () {
      expect(MS.toMs('1s'), 1000);
    });

    test('should convert ms to ms', () {
      expect(MS.toMs('100ms'), 100);
    });

    test('should work with decimals', () {
      expect(MS.toMs('1.5h'), 5400000);
    });

    test('should work with multiple spaces', () {
      expect(MS.toMs('1   s'), 1000);
    });

    test('should return NaN if invalid', () {
      expect(MS.toMs('☃').isNaN, true);
      expect(MS.toMs('10-.5').isNaN, true);
    });

    test('should be case-insensitive', () {
      expect(MS.toMs('1.5H'), 5400000);
    });

    test('should work with numbers starting with .', () {
      expect(MS.toMs('.5ms'), 0.5);
    });

    test('should work with negative integers', () {
      expect(MS.toMs('-100ms'), -100);
    });

    test('should work with negative decimals', () {
      expect(MS.toMs('-1.5h'), -5400000);
      expect(MS.toMs('-10.5h'), -37800000);
    });

    test('should work with negative decimals starting with "."', () {
      expect(MS.toMs('-.5h'), -1800000);
    });
  });

  // long strings

  group('MS.toMs(long string)', () {
    test('should not throw an error', () {
      expect(() {
        MS.toMs('53 milliseconds');
      }, returnsNormally);
    });

    test('should convert milliseconds to ms', () {
      expect(MS.toMs('53 milliseconds'), 53);
    });

    test('should convert msecs to ms', () {
      expect(MS.toMs('17 msecs'), 17);
    });

    test('should convert sec to ms', () {
      expect(MS.toMs('1 sec'), 1000);
    });

    test('should convert from min to ms', () {
      expect(MS.toMs('1 min'), 60000);
    });

    test('should convert from hr to ms', () {
      expect(MS.toMs('1 hr'), 3600000);
    });

    test('should convert days to ms', () {
      expect(MS.toMs('2 days'), 172800000);
    });

    test('should work with decimals', () {
      expect(MS.toMs('1.5 hours'), 5400000);
    });

    test('should work with negative integers', () {
      expect(MS.toMs('-100 milliseconds'), -100);
    });

    test('should work with negative decimals', () {
      expect(MS.toMs('-1.5 hours'), -5400000);
    });

    test('should work with negative decimals starting with "."', () {
      expect(MS.toMs('-.5 hr'), -1800000);
    });
  });
  group('MS.fromMs(number, long : true)', () {
    test('should not throw an error', () {
      expect(() {
        MS.fromMs(500.0, long: true);
      }, returnsNormally);
    });

    test('should support milliseconds', () {
      expect(MS.fromMs(500.0, long: true), '500 ms');

      expect(MS.fromMs(-500.0, long: true), '-500 ms');
    });

    test('should support seconds', () {
      expect(MS.fromMs(1000.0, long: true), '1 second');
      expect(MS.fromMs(1200.0, long: true), '1 second');
      expect(MS.fromMs(10000.0, long: true), '10 seconds');

      expect(MS.fromMs(-1000.0, long: true), '-1 second');
      expect(MS.fromMs(-1200.0, long: true), '-1 second');
      expect(MS.fromMs(-10000.0, long: true), '-10 seconds');
    });

    test('should support minutes', () {
      expect(MS.fromMs(60 * 1000.0, long: true), '1 minute');
      expect(MS.fromMs(60 * 1200.0, long: true), '1 minute');
      expect(MS.fromMs(60 * 10000.0, long: true), '10 minutes');

      expect(MS.fromMs(-1 * 60 * 1000.0, long: true), '-1 minute');
      expect(MS.fromMs(-1 * 60 * 1200.0, long: true), '-1 minute');
      expect(MS.fromMs(-1 * 60 * 10000.0, long: true), '-10 minutes');
    });

    test('should support hours', () {
      expect(MS.fromMs(60 * 60 * 1000.0, long: true), '1 hour');
      expect(MS.fromMs(60 * 60 * 1200.0, long: true), '1 hour');
      expect(MS.fromMs(60 * 60 * 10000.0, long: true), '10 hours');

      expect(MS.fromMs(-1 * 60 * 60 * 1000.0, long: true), '-1 hour');
      expect(MS.fromMs(-1 * 60 * 60 * 1200.0, long: true), '-1 hour');
      expect(MS.fromMs(-1 * 60 * 60 * 10000.0, long: true), '-10 hours');
    });

    test('should support days', () {
      expect(MS.fromMs(24 * 60 * 60 * 1000.0, long: true), '1 day');
      expect(MS.fromMs(24 * 60 * 60 * 1200.0, long: true), '1 day');
      expect(MS.fromMs(24 * 60 * 60 * 10000.0, long: true), '10 days');

      expect(MS.fromMs(-1 * 24 * 60 * 60 * 1000.0, long: true), '-1 day');
      expect(MS.fromMs(-1 * 24 * 60 * 60 * 1200.0, long: true), '-1 day');
      expect(MS.fromMs(-1 * 24 * 60 * 60 * 10000.0, long: true), '-10 days');
    });

    test('should round', () {
      expect(MS.fromMs(234234234, long: true), '3 days');

      expect(MS.fromMs(-234234234, long: true), '-3 days');
    });
  });

  group('MS.fromMs(number)', () {
    test('should not throw an exception', () {
      expect(() => MS.fromMs(500), returnsNormally);
    });
    test('should support milliseconds', () {
      expect(MS.fromMs(500), '500ms');

      expect(MS.fromMs(-500), '-500ms');
    });
    test('should support seconds', () {
      expect(MS.fromMs(1000), '1s');
      expect(MS.fromMs(10000), '10s');

      expect(MS.fromMs(-1000), '-1s');
      expect(MS.fromMs(-10000), '-10s');
    });

    test('should support minutes', () {
      expect(MS.fromMs(60 * 1000.0), '1m');
      expect(MS.fromMs(60 * 10000.0), '10m');

      expect(MS.fromMs(-1 * 60 * 1000.0), '-1m');
      expect(MS.fromMs(-1 * 60 * 10000.0), '-10m');
    });

    test('should support hours', () {
      expect(MS.fromMs(60 * 60 * 1000.0), '1h');
      expect(MS.fromMs(60 * 60 * 10000.0), '10h');

      expect(MS.fromMs(-1 * 60 * 60 * 1000.0), '-1h');
      expect(MS.fromMs(-1 * 60 * 60 * 10000.0), '-10h');
    });

    test('should support days', () {
      expect(MS.fromMs(24 * 60 * 60 * 1000.0), '1d');
      expect(MS.fromMs(24 * 60 * 60 * 10000.0), '10d');

      expect(MS.fromMs(-1 * 24 * 60 * 60 * 1000.0), '-1d');
      expect(MS.fromMs(-1 * 24 * 60 * 60 * 10000.0), '-10d');
    });

    test('should round', () {
      expect(MS.fromMs(234234234), '3d');

      expect(MS.fromMs(-234234234), '-3d');
    });
  });
}
