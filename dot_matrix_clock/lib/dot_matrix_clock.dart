// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dot_matrix_clock/extensions/clockModel_extension.dart';
import 'package:dot_matrix_clock/widgets/DisplayArray.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/model.dart';

import 'font/glyphs.dart';
import 'themedata/theme_data.dart';

class DotMatrixClock extends StatefulWidget {
  final ClockModel clockModel;

  DotMatrixClock({@required this.clockModel}) : assert(clockModel != null);

  @override
  _DotMatrixClockState createState() => _DotMatrixClockState();
}

class _DotMatrixClockState extends State<DotMatrixClock> {
  Stream<int> _ringStream =
      Stream<int>.periodic(Duration(seconds: 10), (tick) => tick % 5);

  @override
  void initState() {
    super.initState();
    widget.clockModel.addListener(_updateModel);
    _updateModel();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? lightTheme
        : darkTheme;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return AnimatedContainer(
        color: colors[CustomThemeElement.background],
        duration: Duration(milliseconds: 300),
        child: StreamBuilder<DateTime>(
          stream: Stream.periodic(Duration(seconds: 1), (_) => DateTime.now()),
          initialData: DateTime.now(),
          builder: (context, snapshot) {
            DateTime dateTime = snapshot.data;
            var glyphs = Glyphs.fromString(
                widget.clockModel.getTimeString(dateTime: dateTime));
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DisplayArray(
                  displayGlyphs: glyphs,
                  maxCharacters: glyphs.length,
                  diameter: 12.0,
                  padding: EdgeInsets.only(right: 2),
                ),
                StreamBuilder<int>(
                  stream: _ringStream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    int index = snapshot.data;
                    return DisplayArray(
                      displayGlyphs: Glyphs.parseByIndex(
                          index: index,
                          clockModel: widget.clockModel,
                          dateTime: dateTime),
                      diameter: 5,
                      padding: EdgeInsets.only(right: 2),
                      maxCharacters: 17,
                    );
                  },
                )
              ],
            );
          },
        ));
  }

  @override
  void didUpdateWidget(DotMatrixClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.clockModel != oldWidget.clockModel) {
      oldWidget.clockModel.removeListener(_updateModel);
      widget.clockModel.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    widget.clockModel.removeListener(_updateModel);
    widget.clockModel.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // intentionally empty;
    });
  }
}
