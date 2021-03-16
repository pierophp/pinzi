import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';
import 'package:pinzi/models/file_content_block.dart';

part 'file_content_line.flamingo.dart';

class FileContentLine extends Model {
  FileContentLine({
    this.type,
    this.blocks,
    Map<String, dynamic>? values,
  }) : super(values: values);

  @Field()
  String? type;

  @ModelField()
  List<FileContentBlock>? blocks;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
