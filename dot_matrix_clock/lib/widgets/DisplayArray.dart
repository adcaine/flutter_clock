// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dot_matrix_clock/font/glyphs.dart';
import 'package:dot_matrix_clock/themedata/default_gradient.dart';
import 'package:dot_matrix_clock/widgets/LEDMatrix.dart';
import 'package:flutter/material.dart';

///
/// This class models a row of LED matrices.  See [LEDMatrix].
///
/// The [displayGlyphs] is the characters to be displayed by the array.  The parameter is required.
///
/// The [maxCharacters] is the number of LED matrices in the array.  The parameter is required.
///
/// If there are fewer [displayGlyphs] that the [maxCharacters] then trailing [Glyphs.BLANK]
/// fill up the balance of the [displayGlyphs].
///
/// If there are more [displayGlyphs] than the array will permit, then the
/// list [displayGlyphs] are truncated.
///
/// [rows] sets the number of rows in each [LEDMatrix].  Defaults to 7.
/// [cols] sets the number of columns in each [LEDMatrix].  Defaults to 5.
///
/// [onColor] sets the on color for the [LightEmittingDiode]s.  Defaults to RED
/// [offColor] sets the off color of the [LightEmittingDiode]s.  Defaults to Color.fromARGB(40, 200, 200, 187)
/// [gradient] sets the gradient of the [LightEmittingDiode]s.  Defaults to [DEFAULT_GRADIENT].
/// [diameter] sets the diameter of the [LightEmittingDiode]s.  Defaults to 4.
/// [duration] sets the time for fading between the [onColor] and [offColor]  Defaults to 300 ms.
/// [padding] sets padding outside each [LEDMatrix].  It is intended to provide
/// a small amount of spacing between adjacent LED matrices.  Defaults to left/right 1.0
/// [boxDecoration] sets the decoration to appear surrounding the LED display
///

class DisplayArray extends StatelessWidget {
  final List<Glyph> displayGlyphs;
  final int maxCharacters;
  final int rows;
  final int cols;
  final Color onColor;
  final Color offColor;
  final Gradient gradient;
  final double diameter;
  final Duration duration;
  final EdgeInsetsGeometry padding;
  final BoxDecoration boxDecoration;

  DisplayArray(
      {@required this.displayGlyphs,
      @required this.maxCharacters,
      this.rows = 7,
      this.cols = 5,
      this.onColor = Colors.red,
      this.offColor = const Color.fromARGB(40, 200, 200, 187),
      this.duration = const Duration(milliseconds: 300),
      this.diameter = 4.0,
      this.gradient = DEFAULT_GRADIENT,
      this.padding = const EdgeInsets.only(right: 30.0),
      this.boxDecoration = const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        border: Border.fromBorderSide(BorderSide(
          color: Color(0xFFB71C1C), // Colors.red.shade900
          width: 6.0,
        )),
      )});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      padding: EdgeInsets.all(16.0),
      child: Table(
          defaultColumnWidth: IntrinsicColumnWidth(),
          children: <TableRow>[_getTableRow()]),
    );
  }

  TableRow _getTableRow() {
    return TableRow(
        children: List.generate(
            maxCharacters,
            (index) => Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: LEDMatrix(
                    glyph: index < displayGlyphs.length
                        ? displayGlyphs[index]
                        : Glyphs.BLANK,
                    rows: rows,
                    cols: cols,
                    onColor: onColor,
                    offColor: offColor,
                    gradient: gradient,
                    duration: duration,
                    diameter: diameter,
                  ),
                )));
  }
}
