import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

WidgetSpan buildRubySpan(
  String text, {
  required BuildContext context,
  String? ruby,
  TextStyle? style,
  TextStyle? rubyStyle,
  bool? hideRuby,
  List<String>? tones,
  GestureTapDownCallback? onTapDown,
  GestureTapUpCallback? onTapUp,
  GestureTapCallback? onTap,
  GestureTapCancelCallback? onTapCancel,
}) {
  final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);

  TextStyle? effectiveTextStyle = style;
  if (style == null || style.inherit) {
    effectiveTextStyle = defaultTextStyle.style.merge(style);
  }

  if (MediaQuery.boldTextOverride(context)) {
    effectiveTextStyle = effectiveTextStyle!.merge(
      const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  final TextStyle defaultRubyTextStyle = effectiveTextStyle!.merge(
    TextStyle(
      fontSize: effectiveTextStyle.fontSize! / 1.5,
    ),
  );

  TextStyle? effectiveRubyTextStyle = rubyStyle;
  if (rubyStyle == null || rubyStyle.inherit) {
    effectiveRubyTextStyle = defaultRubyTextStyle.merge(rubyStyle);
  }

  if (MediaQuery.boldTextOverride(context)) {
    effectiveRubyTextStyle = effectiveRubyTextStyle!.merge(const TextStyle(
      fontWeight: FontWeight.bold,
    ));
  }

  var texts = <Widget>[];
  if (ruby != null && hideRuby != true) {
    texts.add(
      Text(
        ruby,
        textAlign: TextAlign.center,
        style: effectiveRubyTextStyle,
      ),
    );
  }

  final characters = text.split('');

  texts.add(
    RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: effectiveTextStyle,
        children: characters
            .asMap()
            .map(
              (i, character) => MapEntry(
                i,
                TextSpan(
                  text: character,
                  style: TextStyle(
                      color: getToneColor(
                    (tones?.length ?? 0) > i ? tones![i] : '0',
                  )),
                ),
              ),
            )
            .values
            .toList(),
      ),
    ),
  );

  return WidgetSpan(
    child: GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: 6),
        child: Column(
          children: texts,
        ),
      ),
    ),
  );
}

Color getToneColor(String tone) {
  const defaultColors = {
    '0': Colors.black,
    '1': Colors.blue,
    '2': Colors.purple,
    '3': Colors.green,
    '4': Colors.red,
  };

  if (defaultColors[tone] != null) {
    return defaultColors[tone]!;
  }

  return Colors.black;
}
