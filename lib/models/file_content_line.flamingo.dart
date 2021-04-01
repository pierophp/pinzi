// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_content_line.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum FileContentLineKey {
  type,
  blocks,
}

extension FileContentLineKeyExtension on FileContentLineKey {
  String get value {
    switch (this) {
      case FileContentLineKey.type:
        return 'type';
      case FileContentLineKey.blocks:
        return 'blocks';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(FileContentLine doc) {
  final data = <String, dynamic>{};
  Helper.write(data, 'type', doc.type);

  Helper.writeModelListNotNull(data, 'blocks', doc.blocks);

  return data;
}

/// For load data
void _$fromData(FileContentLine doc, Map<String, dynamic> data) {
  doc.type = Helper.valueFromKey<String?>(data, 'type');

  final _blocks = Helper.valueMapListFromKey<String, dynamic>(data, 'blocks');
  if (_blocks != null) {
    doc.blocks = _blocks
        .where((d) => d != null)
        .map((d) => FileContentBlock(values: d))
        .toList();
  } else {
    doc.blocks = null;
  }
}
