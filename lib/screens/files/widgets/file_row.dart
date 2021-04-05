import 'package:flutter/material.dart';
import 'package:pinzi/models/file_content.dart';
import 'package:pinzi/models/file_content_block.dart';
import 'package:pinzi/screens/files/modals/dictionary_modal.dart';
import 'package:pinzi/widgets/ruby_text/ruby_text.dart';
import 'package:pinzi/widgets/ruby_text/ruby_text_data.dart';

class FileRow extends StatelessWidget {
  final FileContent fileContent;

  FileRow({
    Key? key,
    required this.fileContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blocks = fileContent.blocks!;

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
                onLongPress: () {
                  _openDictionaryModal(context, block);
                },
                onDoubleTap: () {
                  _openDictionaryModal(context, block);
                },
              ),
            )
            .toList(),
      ),
    );
  }

  _openDictionaryModal(
    BuildContext context,
    FileContentBlock block,
  ) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: DictionaryModal(
            ideograms: block.c!,
            pinyin: block.p!,
          ),
        );
      },
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
