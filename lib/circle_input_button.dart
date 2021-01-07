import 'package:flutter/material.dart';

class CircleInputButtonConfig {
  // final double fontSize;
  /// default `MediaQuery.of(context).size.width * 0.095`
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color highlightColor;
  final Color splashColor;
  final double highlightElevation;
  final double backgroundOpacity;
  final ShapeBorder shape;

  const CircleInputButtonConfig({
    this.textStyle,
    this.backgroundColor = const Color(0xFF757575),
    this.highlightColor,
    this.splashColor,
    this.highlightElevation,
    this.backgroundOpacity = 0.4,
    this.shape,
  });
}

class CircleInputButton extends StatelessWidget {
  final CircleInputButtonConfig config;

  final String text;
  final Sink<String> enteredSink;
  final GestureTapCallback callback;

  CircleInputButton({
    @required this.text,
    @required this.enteredSink,
    this.config = const CircleInputButtonConfig(),
    @required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = config.textStyle ??
        TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.095,
        );

    return RaisedButton(
      highlightColor: config.highlightColor,
      splashColor: config.splashColor,
      highlightElevation: config.highlightElevation,
      child: Text(
        text,
        style: textStyle,
      ),
      onPressed: () {
        enteredSink.add(text);
        if (callback != null) callback();
      },
      shape: config.shape ??
          CircleBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 0,
              style: BorderStyle.solid,
            ),
          ),
      color: config.backgroundColor.withOpacity(config.backgroundOpacity),
      elevation: 0,
    );
  }
}
