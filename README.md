# ms_dart

[![Build Status](https://travis-ci.org/chrisvasquez/ms_dart.svg?branch=master)](https://travis-ci.org/chrisvasquez/ms_dart)
[![Join the community on Spectrum](https://withspectrum.github.io/badge/badge.svg)](https://spectrum.chat/users/chrisvasquez)

Use this package to easily convert various time formats to milliseconds.

## Install

Add in `pubspec.yaml`

```yaml
dependencies:
  ms_dart: 1.0.1
```

## Examples

```dart
MS.toMs('2 days')  // 172800000
MS.toMs('1d')      // 86400000
MS.toMs('10h')     // 36000000
MS.toMs('2.5 hrs') // 9000000
MS.toMs('2h')      // 7200000
MS.toMs('1m')      // 60000
MS.toMs('5s')      // 5000
MS.toMs('1y')      // 31557600000
MS.toMs('100')     // 100
MS.toMs('-3 days') // -259200000
MS.toMs('-1h')     // -3600000
MS.toMs('-200')    // -200
```

### Convert from Milliseconds

```dart
MS.fromMs(60000)             // "1m"
MS.fromMs(2 * 60000)         // "2m"
MS.fromMs(-3 * 60000)        // "-3m"
MS.fromMs(ms('10 hours'))    // "10h"
```

### Time Format Written-Out

```dart
MS.fromMs(60000, { long: true })                // "1 minute"
MS.fromMs(2 * 60000, { long: true })            // "2 minutes"
MS.fromMs(-3 * 60000, { long: true })           // "-3 minutes"
MS.fromMs(MS.toMs('10 hours'), { long: true })  // "10 hours"
```

## Features

- Works both in dart vm, flutter, and in the browser
- If a number is supplied to `MS.fromMS()`, a string with a unit is returned
- If a string that contains the number is supplied to `MS.toMs()`, it returns it as a number (e.g.: it returns `100` for `'100'`)
- If you pass a string with a number and a valid unit to `MS.toMs()`, the number of equivalent milliseconds is returned

## Related Packages

- [ms](https://https://github.com/zeit/ms) - Based on the `ms` javascript package.

## Caught a Bug?

1. [Fork](https://help.github.com/articles/fork-a-repo/) this repository to your own GitHub account and then [clone](https://help.github.com/articles/cloning-a-repository/) it to your local device
2. You can run the tests using: `dart test/ms_dart_test_dart`
