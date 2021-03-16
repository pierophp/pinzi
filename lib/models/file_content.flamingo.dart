// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_content.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum FileContentKey {
  lines,
}

extension FileContentKeyExtension on FileContentKey {
  String get value {
    switch (this) {
      case FileContentKey.lines:
        return 'lines';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(FileContent doc) {
  final data = <String, dynamic>{};

  Helper.writeModelListNotNull(data, 'lines', doc.lines);

  return data;
}

/// For load data
void _$fromData(FileContent doc, Map<String, dynamic> data) {
  final _lines = Helper.valueMapListFromKey<String, dynamic>(data, 'lines');
  if (_lines != null) {
    doc.lines = _lines
        .where((d) => d != null)
        .map((d) => FileContentLine(values: d))
        .toList();
  } else {
    doc.lines = null;
  }
}
