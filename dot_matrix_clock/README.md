# Dot Matrix Clock

Flutter Clock Challenge Submission

## How to Start the Dot Matrix Clock

From the `dot_matrix_clock` directory, run the command

```
flutter run
```

![Dot Matrix Clock](clock.png)


The Dot Matrix Clock supports landscape only.

## How to Configure the Dot Matrix Clock

To configure the Dot Matrix Clock:

1.  Tap on the clock
2.  Tap on the gear appearing in the extreme upper right.
3.  From the menu, change the settings.

![Customization](customization.png)

The Dot Matrix Clock utilizes the `Clock Model` as recommended by the contest rules.

The Dot Matrix Clock uses all properties of the `Clock Model`:

* Weather condition
* Current, low, and high temperatures
* Celsius and Fahrenheit display
* Location
* Light theme and dark theme
* 12-hour and 24-hour clock display

## Dot Matrix Clock Features

### Animation

Individual LEDs appear to flip when switching between the on and off states.  Flutter's `Transform` widget is used.

To see the animation, it may be necessary to slow the animation down.

### Streams

The clock's displays uses streams and Flutter's `StreamBuilder` class to update the display.

### Extension Methods

The clock leverages Flutter's new extension methods. The extension methods on `ClockModel` simplify coding.







