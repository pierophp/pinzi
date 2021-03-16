import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinzi/widgets/ruby_text/build_ruby_span.dart';
import 'package:pinzi/widgets/ruby_text/ruby_text_data.dart';

// Based on:
// https://pub.dev/packages/ruby_text
class RubyText extends StatelessWidget {
  final List<RubyTextData> data;
  final TextStyle? style;
  final TextStyle? rubyStyle;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCallback? onTap;
  final GestureTapCancelCallback? onTapCancel;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;

  RubyText(
    this.data, {
    this.style,
    this.rubyStyle,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: data
            .map<InlineSpan>(
              (data) => buildRubySpan(
                data.text,
                ruby: data.ruby,
                context: context,
                style: data.style,
                rubyStyle: data.rubyStyle,
                onTapDown: data.onTapDown,
                onTapUp: data.onTapUp,
                onTap: data.onTap,
                onTapCancel: data.onTapCancel,
              ),
            )
            .toList(),
      ),
      textAlign: this.textAlign,
      textDirection: this.textDirection,
      softWrap: this.softWrap,
      overflow: this.overflow,
      maxLines: this.maxLines,
    );
  }
}
