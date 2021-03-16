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

    // @todo remove this
    blocks.add(blocks[0]);
    blocks.add(blocks[1]);
    blocks.add(blocks[0]);
    blocks.add(blocks[1]);
    blocks.add(blocks[0]);
    blocks.add(blocks[1]);
    blocks.add(blocks[0]);
    blocks.add(blocks[1]);
    blocks.add(blocks[0]);
    blocks.add(blocks[1]);
    blocks.add(blocks[0]);
    blocks.add(blocks[1]);
    blocks.add(blocks[0]);
    blocks.add(blocks[1]);

    return RubyText(
      blocks
          .map<RubyTextData>(
            (block) => RubyTextData(
              block.c!,
              ruby: block.p!,
            ),
          )
          .toList(),
    );
  }
}
