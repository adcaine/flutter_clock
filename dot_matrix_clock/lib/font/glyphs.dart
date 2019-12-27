// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:dot_matrix_clock/extensions/clockModel_extension.dart';
import 'package:dot_matrix_clock/extensions/string_extension.dart';

///
/// A container class for a List<List<bool>>.
///
/// The 2-D array models the display pattern for a character.
///
class Glyph {
  final List<List<bool>> pattern;

  ///
  /// Constructor of a Glyph.
  ///
  /// The [pattern] is required.
  ///
  const Glyph({@required this.pattern});

  ///
  /// A convenience method which returns the row of the pattern at [index].
  ///
  List<bool> operator [](int index) => pattern[index];
}

///
/// A class of helper methods and character pattern definitions.
///
class Glyphs {
  ///
  /// Private Constructor.
  ///
  /// This class cannot be instantiated.
  ///
  Glyphs._();

  ///
  /// Converts [text] to a [List<Glyph>].
  ///
  static List<Glyph> fromString(String text) {
    assert(!text.isNullOrEmpty);
    return List<Glyph>()..addAll(Runes(text).map((index) => _glyphMap[index]));
  }

  ///
  /// This method returns today's Date.
  ///
  /// For example, "Thu, Dec 19, 2019"
  ///
  /// The [dateTime] parameter is mandatory.
  ///
  static List<Glyph> parseDateToday(DateTime dateTime) {
    assert(dateTime != null);
    return fromString(DateFormat.yMMMEd('en_US').format(dateTime));
  }

  ///
  /// Returns time, weather and location information by index.
  ///
  /// When [index] == 0, today's date is returned; i.e. Dec 20, 2019
  /// When [index] == 1, the conditions are returned;  i.e. Sunny -5.0℃
  /// When [index] == 2, the low temp; i.e. Low -7℃
  /// When [index] == 3, the high temp; i.e. High -2℃
  /// When [index] == 4, the location is returned; i.e. Waterloo, ON
  ///
  /// An exception will be thrown if the index is not 0, 1, 2, 3 or 4.
  ///
  /// The [clockModel] and [datetime] parameters are required.
  ///
  static List<Glyph> parseByIndex(
      {@required int index,
      @required ClockModel clockModel,
      @required DateTime dateTime}) {
    assert(index >= 0 && index <= 4);
    assert(clockModel != null);
    assert(dateTime != null);
    switch (index) {
      case 0:
        return parseDateToday(dateTime);
      case 1:
        return fromString(clockModel.getWeatherConditionsAndTemperature());
      case 2:
        return fromString(clockModel.getLowTemperatureString());
      case 3:
        return fromString(clockModel.getHighTemperatureString());
      case 4:
        return fromString(clockModel.location);
      default:
        throw Exception("Index must be 0, 1, 2, 3, or 4.  Found $index");
    }
  }

  ///
  /// This Map relates unicode to their corresponding Glyph.
  ///

  static Map<int, Glyph> _glyphMap = <int, Glyph>{
    // Digits
    Runes('1').first: Glyphs.ONE,
    Runes('2').first: Glyphs.TWO,
    Runes('3').first: Glyphs.THREE,
    Runes('4').first: Glyphs.FOUR,
    Runes('5').first: Glyphs.FIVE,
    Runes('6').first: Glyphs.SIX,
    Runes('7').first: Glyphs.SEVEN,
    Runes('8').first: Glyphs.EIGHT,
    Runes('9').first: Glyphs.NINE,
    Runes('0').first: Glyphs.ZERO,

    // Upper case letters
    Runes('A').first: Glyphs.A,
    Runes('B').first: Glyphs.B,
    Runes('C').first: Glyphs.C,
    Runes('D').first: Glyphs.D,
    Runes('E').first: Glyphs.E,
    Runes('F').first: Glyphs.F,
    Runes('G').first: Glyphs.G,
    Runes('H').first: Glyphs.H,
    Runes('I').first: Glyphs.I,
    Runes('J').first: Glyphs.J,
    Runes('K').first: Glyphs.K,
    Runes('L').first: Glyphs.L,
    Runes('M').first: Glyphs.M,
    Runes('N').first: Glyphs.N,
    Runes('O').first: Glyphs.O,
    Runes('P').first: Glyphs.P,
    Runes('Q').first: Glyphs.Q,
    Runes('R').first: Glyphs.R,
    Runes('S').first: Glyphs.S,
    Runes('T').first: Glyphs.T,
    Runes('U').first: Glyphs.U,
    Runes('V').first: Glyphs.V,
    Runes('W').first: Glyphs.W,
    Runes('X').first: Glyphs.X,
    Runes('Y').first: Glyphs.Y,
    Runes('Z').first: Glyphs.Z,

    // Lower case letters
    Runes('a').first: Glyphs.a,
    Runes('b').first: Glyphs.b,
    Runes('c').first: Glyphs.c,
    Runes('d').first: Glyphs.d,
    Runes('e').first: Glyphs.e,
    Runes('f').first: Glyphs.f,
    Runes('g').first: Glyphs.g,
    Runes('h').first: Glyphs.h,
    Runes('i').first: Glyphs.i,
    Runes('j').first: Glyphs.j,
    Runes('k').first: Glyphs.k,
    Runes('l').first: Glyphs.l,
    Runes('m').first: Glyphs.m,
    Runes('n').first: Glyphs.n,
    Runes('o').first: Glyphs.o,
    Runes('p').first: Glyphs.p,
    Runes('q').first: Glyphs.q,
    Runes('r').first: Glyphs.r,
    Runes('s').first: Glyphs.s,
    Runes('t').first: Glyphs.t,
    Runes('u').first: Glyphs.u,
    Runes('v').first: Glyphs.v,
    Runes('w').first: Glyphs.w,
    Runes('x').first: Glyphs.x,
    Runes('y').first: Glyphs.y,
    Runes('z').first: Glyphs.z,

    // Punctuation marks

    Runes(' ').first: Glyphs.BLANK,
    Runes(':').first: Glyphs.COLON,
    Runes('-').first: Glyphs.DASH,
    Runes('.').first: Glyphs.PERIOD,
    Runes(',').first: Glyphs.COMMA,
    Runes('℃').first: Glyphs.DEGREES_C,
    Runes('℉').first: Glyphs.DEGREES_F
  };

  ///
  /// These static consts defined the on-off patters for 7x5
  /// display matrices.
  ///

  static const Glyph ZERO = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, true, true],
    <bool>[true, false, true, false, true],
    <bool>[true, true, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph ONE = Glyph(pattern: <List<bool>>[
    <bool>[false, false, true, false, false],
    <bool>[false, true, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph TWO = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[false, false, false, false, true],
    <bool>[false, false, false, true, false],
    <bool>[false, false, true, false, false],
    <bool>[false, true, false, false, false],
    <bool>[true, true, true, true, true],
  ]);

  static const Glyph THREE = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, true],
    <bool>[false, false, false, true, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, false, true, false],
    <bool>[false, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph FOUR = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, true, false],
    <bool>[false, false, true, true, false],
    <bool>[false, true, false, true, false],
    <bool>[true, false, false, true, false],
    <bool>[true, true, true, true, true],
    <bool>[false, false, false, true, false],
    <bool>[false, false, false, true, false],
  ]);

  static const Glyph FIVE = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, true],
    <bool>[true, false, false, false, false],
    <bool>[true, true, true, true, false],
    <bool>[false, false, false, false, true],
    <bool>[false, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph SIX = Glyph(pattern: <List<bool>>[
    <bool>[false, false, true, true, false],
    <bool>[false, true, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph SEVEN = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, true],
    <bool>[false, false, false, false, true],
    <bool>[false, false, false, true, false],
    <bool>[false, false, true, false, false],
    <bool>[false, true, false, false, false],
    <bool>[false, true, false, false, false],
    <bool>[false, true, false, false, false],
  ]);

  static const Glyph EIGHT = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph NINE = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, true],
    <bool>[false, false, false, false, true],
    <bool>[false, false, false, true, false],
    <bool>[false, true, true, false, false],
  ]);

  static const Glyph COLON = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, false, false],
    <bool>[false, true, true, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, false, false],
    <bool>[false, true, true, false, false],
    <bool>[false, false, false, false, false],
  ]);

  static const Glyph BLANK = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
  ]);

  static const Glyph PERIOD = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, false, false],
    <bool>[false, true, true, false, false],
  ]);

  static const Glyph COMMA = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, true, false, false, false],
  ]);

  static const Glyph A = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, true, true, true, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph B = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, true, true, true, false],
  ]);

  static const Glyph C = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph D = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, true, true, true, false],
  ]);

  static const Glyph E = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, true],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, true, true, true, true],
  ]);

  static const Glyph F = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, true],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
  ]);

  static const Glyph G = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, false],
    <bool>[true, false, true, true, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, true],
  ]);

  static const Glyph H = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, true, true, true, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph I = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph J = Glyph(pattern: <List<bool>>[
    <bool>[false, false, true, true, true],
    <bool>[false, false, false, true, false],
    <bool>[false, false, false, true, false],
    <bool>[false, false, false, true, false],
    <bool>[false, false, false, true, false],
    <bool>[true, false, false, true, false],
    <bool>[false, true, true, false, false],
  ]);

  static const Glyph K = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, true, false],
    <bool>[true, false, true, false, false],
    <bool>[true, true, false, false, false],
    <bool>[true, false, true, false, false],
    <bool>[true, false, false, true, false],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph L = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, true, true, true, true],
  ]);

  static const Glyph M = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, true],
    <bool>[true, true, false, true, true],
    <bool>[true, false, true, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph N = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, true, false, false, true],
    <bool>[true, false, true, false, true],
    <bool>[true, false, false, true, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph O = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph P = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
  ]);

  static const Glyph Q = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, true, false, true],
    <bool>[true, false, false, true, false],
    <bool>[false, true, true, false, true],
  ]);

  static const Glyph R = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, true, true, true, false],
    <bool>[true, false, true, false, false],
    <bool>[true, false, false, true, false],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph S = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, true, true],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[false, true, true, true, false],
    <bool>[false, false, false, false, true],
    <bool>[false, false, false, false, true],
    <bool>[true, true, true, true, false],
  ]);

  static const Glyph T = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, true],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
  ]);

  static const Glyph U = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph V = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, false, true, false],
    <bool>[false, false, true, false, false],
  ]);

  static const Glyph W = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, true, false, true],
    <bool>[true, false, true, false, true],
    <bool>[false, true, false, true, false],
  ]);

  static const Glyph X = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, false, true, false],
    <bool>[false, false, true, false, false],
    <bool>[false, true, false, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph Y = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, false, true, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
  ]);

  static const Glyph Z = Glyph(pattern: <List<bool>>[
    <bool>[true, true, true, true, true],
    <bool>[false, false, false, false, true],
    <bool>[false, false, false, true, false],
    <bool>[false, false, true, false, false],
    <bool>[false, true, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, true, true, true, true],
  ]);

  static const Glyph a = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, true, false],
    <bool>[false, false, false, false, true],
    <bool>[false, true, true, true, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, true],
  ]);

  static const Glyph b = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, true, true, false],
    <bool>[true, true, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, true, true, true, false],
  ]);

  static const Glyph c = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph d = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, true],
    <bool>[false, false, false, false, true],
    <bool>[false, false, false, false, true],
    <bool>[false, true, true, false, true],
    <bool>[true, false, false, true, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, true],
  ]);

  static const Glyph e = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, true, true, true, true],
    <bool>[true, false, false, false, false],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph f = Glyph(pattern: <List<bool>>[
    <bool>[false, false, true, true, false],
    <bool>[false, true, false, false, true],
    <bool>[false, true, false, false, false],
    <bool>[true, true, true, false, false],
    <bool>[false, true, false, false, false],
    <bool>[false, true, false, false, false],
    <bool>[false, true, false, false, false],
  ]);

  static const Glyph g = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, true, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, true],
    <bool>[false, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph h = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, true, true, false],
    <bool>[true, true, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph i = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
  ]);

  static const Glyph j = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, true, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, true, true, false],
    <bool>[false, false, false, true, false],
    <bool>[false, false, false, true, false],
    <bool>[true, false, false, true, false],
    <bool>[false, true, true, false, false],
  ]);

  static const Glyph k = Glyph(pattern: <List<bool>>[
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, true, false],
    <bool>[true, false, true, false, false],
    <bool>[true, true, false, false, false],
    <bool>[true, false, true, false, false],
    <bool>[true, false, false, true, false],
  ]);

  static const Glyph l = Glyph(pattern: <List<bool>>[
    <bool>[false, true, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, false, true, false, false],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph m = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[true, true, false, true, false],
    <bool>[true, false, true, false, true],
    <bool>[true, false, true, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph n = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[true, false, true, true, false],
    <bool>[true, true, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph o = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph p = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, true],
    <bool>[true, true, true, true, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
  ]);

  static const Glyph q = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, false, true],
    <bool>[true, false, false, true, true],
    <bool>[false, true, true, true, true],
    <bool>[false, false, false, false, true],
    <bool>[false, false, false, false, true],
  ]);

  static const Glyph r = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[true, false, true, true, false],
    <bool>[true, true, false, false, true],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
    <bool>[true, false, false, false, false],
  ]);

  static const Glyph s = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, true, false],
    <bool>[true, false, false, false, false],
    <bool>[false, true, true, true, false],
    <bool>[false, false, false, false, true],
    <bool>[true, true, true, true, false],
  ]);

  static const Glyph t = Glyph(pattern: <List<bool>>[
    <bool>[false, true, false, false, false],
    <bool>[false, true, false, false, false],
    <bool>[true, true, true, false, false],
    <bool>[false, true, false, false, false],
    <bool>[false, true, false, false, false],
    <bool>[false, true, false, false, true],
    <bool>[false, false, true, true, false],
  ]);

  static const Glyph u = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, true, true],
    <bool>[false, true, true, false, true],
  ]);

  static const Glyph v = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, false, true, false],
    <bool>[false, false, true, false, false],
  ]);

  static const Glyph w = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[true, false, true, false, true],
    <bool>[true, false, true, false, true],
    <bool>[false, true, false, true, false],
  ]);

  static const Glyph x = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[true, false, false, false, true],
    <bool>[false, true, false, true, false],
    <bool>[false, false, true, false, false],
    <bool>[false, true, false, true, false],
    <bool>[true, false, false, false, true],
  ]);

  static const Glyph y = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[true, false, false, false, true],
    <bool>[true, false, false, false, true],
    <bool>[false, true, true, true, true],
    <bool>[false, false, false, false, true],
    <bool>[false, true, true, true, false],
  ]);

  static const Glyph z = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[true, true, true, true, true],
    <bool>[false, false, false, true, false],
    <bool>[false, false, true, false, false],
    <bool>[false, true, false, false, false],
    <bool>[true, true, true, true, true],
  ]);

  static const Glyph DEGREES_F = Glyph(pattern: <List<bool>>[
    <bool>[true, true, false, false, false],
    <bool>[true, true, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, true, true],
    <bool>[false, true, false, false, false],
    <bool>[false, true, true, true, false],
    <bool>[false, true, false, false, false],
  ]);

  static const Glyph DEGREES_C = Glyph(pattern: <List<bool>>[
    <bool>[true, true, false, false, false],
    <bool>[true, true, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, true, true, true],
    <bool>[false, true, false, false, false],
    <bool>[false, true, false, false, false],
    <bool>[false, false, true, true, true],
  ]);

  static const Glyph DASH = Glyph(pattern: <List<bool>>[
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, true, true, true, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
    <bool>[false, false, false, false, false],
  ]);
}
