// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_content.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum FileContentKey {
  type,
  blocks,
}

extension FileContentKeyExtension on FileContentKey {
  String get value {
    switch (this) {
      case FileContentKey.type:
        return 'type';
      case FileContentKey.blocks:
        return 'blocks';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(FileContent doc) {
  final data = <String, dynamic>{};
  Helper.write(data, 'type', doc.type);

  Helper.writeModelListNotNull(data, 'blocks', doc.blocks);

  return data;
}

/// For load data
void _$fromData(FileContent doc, Map<String, dynamic> data) {
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
