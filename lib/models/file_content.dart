import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';
import 'package:pinzi/models/file_content_line.dart';

part 'file_content.flamingo.dart';

class FileContent extends Document<FileContent> {
  FileContent({
    String? id,
    DocumentSnapshot? snapshot,
    Map<String, dynamic>? values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @ModelField()
  List<FileContentLine>? lines;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
