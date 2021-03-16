// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_line.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum FileLineKey {
  type,
}

extension FileLineKeyExtension on FileLineKey {
  String get value {
    switch (this) {
      case FileLineKey.type:
        return 'type';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(FileLine doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'type', doc.type);

  return data;
}

/// For load data
void _$fromData(FileLine doc, Map<String, dynamic> data) {
  doc.type = Helper.valueFromKey<String>(data, 'type');
}
