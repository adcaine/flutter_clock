// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

/// This provides a periodic stream of repeating ints in a ring of [size].
///
/// If size == 3 for example, then the stream controller will produce an
/// endless stream of ints 0, 1, 2, 0, 1, 2, ... at intervals [duration].
///
/// Generally, where N is the size then the stream is
///
/// 0, 1, ... N - 2, N - 1, 0, 1, ... N - 2, N - 1 and so on indefinitely.
///
///
class RingStream {
  final Duration duration;
  final int size;
  StreamController<int> _streamController;
  int _index = 0;

  ///
  /// Creates a ring stream.
  ///
  /// The [duration] parameter specifies the time between successive ints.
  ///
  /// The [size] parameter specifies the size of the ring.
  ///
  /// The ring is from 0 ... size - 1.
  ///
  RingStream({this.duration = const Duration(seconds: 10), this.size = 5}) {
    _streamController = new StreamController<int>();

    Timer.periodic(duration, _updateStream);

    _streamController.sink.add(_index);
  }

  ///
  /// Every client should dispose of the [RingStream] when no longer in use.
  ///
  void dispose() {
    _streamController.close();
  }

  get stream => _streamController.stream;

  void _updateStream(Timer timer) {
    _index = (++_index) % size;

    _streamController.sink.add(_index);
  }
}
