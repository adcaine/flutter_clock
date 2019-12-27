// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';

///
/// This code defines convenient extensions on ClockModel.
///
extension ClockModelExt on ClockModel {
  ///
  /// This property determines the corrects degrees characters to use based
  /// upon the temperature unit of measurement set in the [ClockModel]:  C or F.
  ///
  get degreeSuffix => unit == TemperatureUnit.celsius ? '℃' : '℉';

  ///
  /// This method returns the temperature of [fractional] places after
  /// the decimal point.  Default is 1 place after the decimal point.
  ///
  String getTemperatureToFractionalDigits({int fractional = 1}) {
    return temperature.toStringAsFixed(fractional) + degreeSuffix;
  }

  ///
  /// This method returns the Low forecast temperature.
  ///
  /// i.e. "Low -6.0℃"
  ///
  String getLowTemperatureString({int fractional = 1}) {
    return "Low " + low.toStringAsFixed(fractional) + degreeSuffix;
  }

  ///
  /// This method returns the High forecast temperature.
  ///
  /// i.e. "High 22.0℃"
  ///
  String getHighTemperatureString({int fractional = 1}) {
    return "High " + high.toStringAsFixed(fractional) + degreeSuffix;
  }

  ///
  /// This method returns the weather condition and current temperature.
  ///
  /// i.e "Sunny 26.0℃"
  String getWeatherConditionsAndTemperature({int fractional = 1}) {
    return weatherConditionString() +
        ' ' +
        getTemperatureToFractionalDigits(fractional: fractional);
  }

  ///
  /// This method returns the hour and minutes in either
  /// 24 hour time or 12 hour time depending upon the preference set
  /// in the [ClockModel].
  ///
  String getTimeString({@required DateTime dateTime}) {
    return is24HourFormat
        ? DateFormat.Hm('en_US').format(dateTime)
        : DateFormat.jm('en_US').format(dateTime);
  }

  ///
  /// This method returns the string version of the WeatherCondition enums.
  ///
  String weatherConditionString() {
    switch (weatherCondition) {
      case WeatherCondition.cloudy:
        return "Cloudy";
      case WeatherCondition.foggy:
        return "Foggy";
      case WeatherCondition.rainy:
        return "Rainy";
      case WeatherCondition.snowy:
        return "Snowy";
      case WeatherCondition.sunny:
        return "Sunny";
      case WeatherCondition.thunderstorm:
        return "T-storm";
      case WeatherCondition.windy:
        return "Windy";
      default:
        throw Exception("Must be a valid weather condition"); // boilerplate
    }
  }
}
