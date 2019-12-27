// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

const Color GREEN_SHADE_800 = const Color(0xFF2E7D32);
const Color GREEN_SHADE_500 = const Color(0xFF4CAF50);
const Color GREEN_SHADE_400 = const Color(0xFF66BB6A);
const Color GREEN_SHADE_900 = const Color(0xFF1B5E20);

const Color RED_SHADE_800 = const Color(0xFFC62828);
const Color RED_SHADE_500 = const Color(0xFFF44336);
const Color RED_SHADE_400 = const Color(0xFFEF5350);
const Color RED_SHADE_900 = const Color(0xFFB71C1C);

const Color WHITE = const Color(0xFFFFFFFF);
const Color WHITE_70 = const Color(0xB3FFFFFF);
const Color WHITE_60 = const Color(0x99FFFFFF);
const Color WHITE_38 = const Color(0x62FFFFFF);

const Color RED = const Color(0xFFFF0000);

///
/// Defines a gradient which gives the LEDs a bubble shape like
/// the shields found on actual LEDs.
///
const Gradient DEFAULT_GRADIENT = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [RED_SHADE_800, RED_SHADE_500, RED_SHADE_400, RED_SHADE_900],
  stops: [0.1, 0.5, 0.7, 0.9],
);
