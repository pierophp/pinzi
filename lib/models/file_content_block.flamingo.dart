// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_content_block.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum FileContentBlockKey {
  c,
  p,
  t,
}

extension FileContentBlockKeyExtension on FileContentBlockKey {
  String get value {
    switch (this) {
      case FileContentBlockKey.c:
        return 'c';
      case FileContentBlockKey.p:
        return 'p';
      case FileContentBlockKey.t:
        return 't';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(FileContentBlock doc) {
  final data = <String, dynamic>{};
  Helper.write(data, 'c', doc.c);
  Helper.write(data, 'p', doc.p);
  Helper.write(data, 't', doc.t);

  return data;
}

/// For load data
void _$fromData(FileContentBlock doc, Map<String, dynamic> data) {
  doc.c = Helper.valueFromKey<String>(data, 'c');
  doc.p = Helper.valueFromKey<String>(data, 'p');
  doc.t = Helper.valueListFromKey<String>(data, 't');
}
