// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

///
/// Custom themes used in the contest.
///

enum CustomThemeElement {
  background,
  text,
  shadow,
}

final lightTheme = {
  CustomThemeElement.background: Color(0xFF81B3FE),
  CustomThemeElement.text: Colors.white,
  CustomThemeElement.shadow: Colors.black,
};

final darkTheme = {
  CustomThemeElement.background: Colors.black,
  CustomThemeElement.text: Colors.white,
  CustomThemeElement.shadow: Color(0xFF174EA6),
};
