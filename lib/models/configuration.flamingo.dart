// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ConfigurationKey {
  characterType,
}

extension ConfigurationKeyExtension on ConfigurationKey {
  String get value {
    switch (this) {
      case ConfigurationKey.characterType:
        return 'characterType';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Configuration doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'characterType', doc.characterType);

  return data;
}

/// For load data
void _$fromData(Configuration doc, Map<String, dynamic> data) {
  doc.characterType = Helper.valueFromKey<String>(data, 'characterType');
}
