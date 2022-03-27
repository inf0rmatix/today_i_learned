// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'learning_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LearningModel _$LearningModelFromJson(Map<String, dynamic> json) {
  return _LearningModel.fromJson(json);
}

/// @nodoc
class _$LearningModelTearOff {
  const _$LearningModelTearOff();

  _LearningModel call(
      {required String uid,
      required String title,
      required String description,
      required DateTime created,
      DateTime? updated}) {
    return _LearningModel(
      uid: uid,
      title: title,
      description: description,
      created: created,
      updated: updated,
    );
  }

  LearningModel fromJson(Map<String, Object?> json) {
    return LearningModel.fromJson(json);
  }
}

/// @nodoc
const $LearningModel = _$LearningModelTearOff();

/// @nodoc
mixin _$LearningModel {
  String get uid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearningModelCopyWith<LearningModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningModelCopyWith<$Res> {
  factory $LearningModelCopyWith(
          LearningModel value, $Res Function(LearningModel) then) =
      _$LearningModelCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String title,
      String description,
      DateTime created,
      DateTime? updated});
}

/// @nodoc
class _$LearningModelCopyWithImpl<$Res>
    implements $LearningModelCopyWith<$Res> {
  _$LearningModelCopyWithImpl(this._value, this._then);

  final LearningModel _value;
  // ignore: unused_field
  final $Res Function(LearningModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$LearningModelCopyWith<$Res>
    implements $LearningModelCopyWith<$Res> {
  factory _$LearningModelCopyWith(
          _LearningModel value, $Res Function(_LearningModel) then) =
      __$LearningModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String title,
      String description,
      DateTime created,
      DateTime? updated});
}

/// @nodoc
class __$LearningModelCopyWithImpl<$Res>
    extends _$LearningModelCopyWithImpl<$Res>
    implements _$LearningModelCopyWith<$Res> {
  __$LearningModelCopyWithImpl(
      _LearningModel _value, $Res Function(_LearningModel) _then)
      : super(_value, (v) => _then(v as _LearningModel));

  @override
  _LearningModel get _value => super._value as _LearningModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_LearningModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LearningModel implements _LearningModel {
  _$_LearningModel(
      {required this.uid,
      required this.title,
      required this.description,
      required this.created,
      this.updated});

  factory _$_LearningModel.fromJson(Map<String, dynamic> json) =>
      _$$_LearningModelFromJson(json);

  @override
  final String uid;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime created;
  @override
  final DateTime? updated;

  @override
  String toString() {
    return 'LearningModel(uid: $uid, title: $title, description: $description, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LearningModel &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.updated, updated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(updated));

  @JsonKey(ignore: true)
  @override
  _$LearningModelCopyWith<_LearningModel> get copyWith =>
      __$LearningModelCopyWithImpl<_LearningModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LearningModelToJson(this);
  }
}

abstract class _LearningModel implements LearningModel {
  factory _LearningModel(
      {required String uid,
      required String title,
      required String description,
      required DateTime created,
      DateTime? updated}) = _$_LearningModel;

  factory _LearningModel.fromJson(Map<String, dynamic> json) =
      _$_LearningModel.fromJson;

  @override
  String get uid;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get created;
  @override
  DateTime? get updated;
  @override
  @JsonKey(ignore: true)
  _$LearningModelCopyWith<_LearningModel> get copyWith =>
      throw _privateConstructorUsedError;
}
