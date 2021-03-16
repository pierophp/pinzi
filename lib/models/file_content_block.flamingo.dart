// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_content_block.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum FileContentBlockKey {
  c,
  p,
}

extension FileContentBlockKeyExtension on FileContentBlockKey {
  String get value {
    switch (this) {
      case FileContentBlockKey.c:
        return 'c';
      case FileContentBlockKey.p:
        return 'p';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(FileContentBlock doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'c', doc.c);
  Helper.writeNotNull(data, 'p', doc.p);

  return data;
}

/// For load data
void _$fromData(FileContentBlock doc, Map<String, dynamic> data) {
  doc.c = Helper.valueFromKey<String>(data, 'c');
  doc.p = Helper.valueFromKey<String>(data, 'p');
}
