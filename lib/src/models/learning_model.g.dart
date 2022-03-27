// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LearningModel _$$_LearningModelFromJson(Map<String, dynamic> json) =>
    _$_LearningModel(
      uid: json['uid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$$_LearningModelToJson(_$_LearningModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'description': instance.description,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
