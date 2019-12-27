// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:dot_matrix_clock/font/glyphs.dart';
import 'package:dot_matrix_clock/widgets/FlipLED.dart';

///
/// This class models a 2D array of light emitting diodes (LED).
///
/// The [rows] property is the number of rows of the array.
/// The [cols] property is the number of columns of the array.
///
/// The [onColor] sets the on color for the LEDs.
/// The [offColor] sets the off color for the  LED.
///
/// The [gradient] sets the gradient for the LEDs.
/// The [diameter] sets the size for the LEDs.
/// The [duration] sets the time to fade between the [onColor] and [offColor].
///
/// The [glyph] is the character to be displayed by the LEDMatrix.  The [glyph] is
/// a wrapper for a 2D bool array.  The dimensions of the [glyph] must be at least
/// as great as the [rows] and [cols] of the LEDMatrix.
///

class LEDMatrix extends StatelessWidget {
  final int rows;
  final int cols;
  final Color onColor;
  final Color offColor;
  final Gradient gradient;
  final double diameter;
  final Duration duration;
  final Glyph glyph;

  LEDMatrix(
      {@required this.rows,
      @required this.cols,
      @required this.onColor,
      @required this.offColor,
      @required this.gradient,
      @required this.diameter,
      @required this.duration,
      @required this.glyph});

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: FixedColumnWidth(diameter + 1),
      children: _getTableRows(),
    );
  }

  List<TableRow> _getTableRows() {
    return List.generate(rows, (index) {
      return _getRow(glyph[index]);
    });
  }

  TableRow _getRow(List<bool> pattern) {
    return TableRow(
        children: List.generate(
            cols,
            (index) => FlipLED(
                  isOn: pattern[index],
                  onColor: onColor,
                  offColor: offColor,
                  gradient: gradient,
                  diameter: diameter,
                  duration: duration,
                )));
  }
}
