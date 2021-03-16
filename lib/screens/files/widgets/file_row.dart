import 'package:flutter/material.dart';
import 'package:pinzi/models/file_content_line.dart';
import 'package:pinzi/widgets/ruby_text/ruby_text.dart';
import 'package:pinzi/widgets/ruby_text/ruby_text_data.dart';

class FileRow extends StatelessWidget {
  final FileContentLine line;

  FileRow({
    Key? key,
    required this.line,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blocks = line.blocks!;

    final style = TextStyle(
      fontSize: 20,
    );
    final rubyStyle = TextStyle();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: RubyText(
        blocks
            .map<RubyTextData>(
              (block) => RubyTextData(
                block.c!,
                ruby: block.p,
                hideRuby: this._hideRuby(block.c!),
                style: style,
                rubyStyle: rubyStyle,
                tones: block.t,
                onTap: () {
                  print("Selected " + block.c!);
                },
              ),
            )
            .toList(),
      ),
    );
  }

  // @todo implement this
  bool _hideRuby(String word) {
    final words = {'為什麼': true};

    if (words[word] == true) {
      return true;
    }

    return false;
  }
}
