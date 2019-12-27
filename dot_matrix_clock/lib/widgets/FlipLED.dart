// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

///
/// This class models a single light emitting diode which flips over when turned on/off.
///
/// This [isOn] parameter determines which color to use.
///
/// The class uses the [onColor] when [isOn] is true.
/// The class uses the [offColor] when [isOn] is false.
///
/// The class uses the [gradient] to create, for example, a rounded effect,
/// similar to rounded tops of physical light emitting diode hardware.
///
/// The class uses the [diameter] property to determine the size of the diode.
///
/// The class uses the [duration] to determine the length to time to fade
/// between the [onColor] to the [offColor] if the diode is switched off.  It
/// is also used to determine the time to fade between [offColor] and [onColor]
/// when the diode is switched on.
///
///

class FlipLED extends StatefulWidget {
  final bool isOn;
  final Color onColor;
  final Color offColor;
  final Gradient gradient;
  final double diameter;
  final Duration duration;

  FlipLED(
      {@required this.isOn,
      @required this.onColor,
      @required this.offColor,
      @required this.gradient,
      @required this.diameter,
      @required this.duration});

  @override
  _FlipLEDState createState() => _FlipLEDState();
}

class _FlipLEDState extends State<FlipLED> with SingleTickerProviderStateMixin {
  double _angle = 0.0;
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: _getMatrix(),
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isFront ? widget.onColor : widget.offColor,
          gradient: widget.gradient,
        ),
        height: widget.diameter,
        width: widget.diameter,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.slowMiddle));
    _animation.addListener(_setAngle);
  }

  @override
  void didUpdateWidget(FlipLED oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOn) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _setAngle() {
    setState(() {
      _angle = _animation.value;
    });
  }

  Matrix4 _getMatrix() {
    return Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateX(_angle);
  }

  get _isFront => _angle < pi / 2;
}
