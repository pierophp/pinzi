import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'file_line.flamingo.dart';

class FileLine extends Model {
  FileLine({
    this.type,
    Map<String, dynamic>? values,
  }) : super(values: values);

  @Field()
  String? type;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
