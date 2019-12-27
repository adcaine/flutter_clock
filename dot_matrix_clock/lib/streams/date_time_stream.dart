// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

///
/// Creates a stream of DateTime objects.
///
/// By default, a new DateTime is emitted each second.
class DateTimeStream {
  StreamController<DateTime> _streamController;

  ///
  /// Constructs a DataTimeStream with a optional [duration].
  ///
  DateTimeStream({Duration duration = const Duration(seconds: 1)}) {
    _streamController = StreamController<DateTime>();

    Timer.periodic(duration, _updateTime);
  }

  ///
  /// All owners of this stream should dispose of it after use.
  ///
  void dispose() {
    _streamController.close();
  }

  Stream<DateTime> get stream => _streamController.stream;

  void _updateTime(Timer timer) {
    _streamController.sink.add(DateTime.now());
  }
}
