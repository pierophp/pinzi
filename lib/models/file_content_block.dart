import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'file_content_block.flamingo.dart';

class FileContentBlock extends Model {
  FileContentBlock({
    this.c,
    this.p,
    Map<String, dynamic>? values,
  }) : super(values: values);

  @Field(
    isWriteNotNull: false,
  )
  String? c;

  @Field(isWriteNotNull: false)
  String? p;

  @Field(isWriteNotNull: false)
  List<String>? t;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
