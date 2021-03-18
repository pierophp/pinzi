import 'package:flutter/widgets.dart';

class RubyTextData {
  final String text;
  final String? ruby;
  final TextStyle? style;
  final TextStyle? rubyStyle;
  final bool? hideRuby;
  final List<String>? tones;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCallback? onTap;
  final GestureTapCancelCallback? onTapCancel;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;

  RubyTextData(
    this.text, {
    required this.ruby,
    this.style,
    this.rubyStyle,
    this.hideRuby,
    this.tones,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
  });
}
