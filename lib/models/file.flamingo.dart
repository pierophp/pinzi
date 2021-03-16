// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum FileKey {
  path,
  title,
  type,
}

extension FileKeyExtension on FileKey {
  String get value {
    switch (this) {
      case FileKey.path:
        return 'path';
      case FileKey.title:
        return 'title';
      case FileKey.type:
        return 'type';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(File doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'path', doc.path);
  Helper.writeNotNull(data, 'title', doc.title);
  Helper.writeNotNull(data, 'type', doc.type);

  return data;
}

/// For load data
void _$fromData(File doc, Map<String, dynamic> data) {
  doc.path = Helper.valueFromKey<String>(data, 'path');
  doc.title = Helper.valueFromKey<String>(data, 'title');
  doc.type = Helper.valueFromKey<String>(data, 'type');
}
