// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_learning_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreateLearningStateTearOff {
  const _$CreateLearningStateTearOff();

  _CreateLearningState call(
      {String title = '',
      String description = '',
      bool isLoading = false,
      LearningModel? learning}) {
    return _CreateLearningState(
      title: title,
      description: description,
      isLoading: isLoading,
      learning: learning,
    );
  }
}

/// @nodoc
const $CreateLearningState = _$CreateLearningStateTearOff();

/// @nodoc
mixin _$CreateLearningState {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  LearningModel? get learning => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateLearningStateCopyWith<CreateLearningState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateLearningStateCopyWith<$Res> {
  factory $CreateLearningStateCopyWith(
          CreateLearningState value, $Res Function(CreateLearningState) then) =
      _$CreateLearningStateCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String description,
      bool isLoading,
      LearningModel? learning});

  $LearningModelCopyWith<$Res>? get learning;
}

/// @nodoc
class _$CreateLearningStateCopyWithImpl<$Res>
    implements $CreateLearningStateCopyWith<$Res> {
  _$CreateLearningStateCopyWithImpl(this._value, this._then);

  final CreateLearningState _value;
  // ignore: unused_field
  final $Res Function(CreateLearningState) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? isLoading = freezed,
    Object? learning = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      learning: learning == freezed
          ? _value.learning
          : learning // ignore: cast_nullable_to_non_nullable
              as LearningModel?,
    ));
  }

  @override
  $LearningModelCopyWith<$Res>? get learning {
    if (_value.learning == null) {
      return null;
    }

    return $LearningModelCopyWith<$Res>(_value.learning!, (value) {
      return _then(_value.copyWith(learning: value));
    });
  }
}

/// @nodoc
abstract class _$CreateLearningStateCopyWith<$Res>
    implements $CreateLearningStateCopyWith<$Res> {
  factory _$CreateLearningStateCopyWith(_CreateLearningState value,
          $Res Function(_CreateLearningState) then) =
      __$CreateLearningStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String description,
      bool isLoading,
      LearningModel? learning});

  @override
  $LearningModelCopyWith<$Res>? get learning;
}

/// @nodoc
class __$CreateLearningStateCopyWithImpl<$Res>
    extends _$CreateLearningStateCopyWithImpl<$Res>
    implements _$CreateLearningStateCopyWith<$Res> {
  __$CreateLearningStateCopyWithImpl(
      _CreateLearningState _value, $Res Function(_CreateLearningState) _then)
      : super(_value, (v) => _then(v as _CreateLearningState));

  @override
  _CreateLearningState get _value => super._value as _CreateLearningState;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? isLoading = freezed,
    Object? learning = freezed,
  }) {
    return _then(_CreateLearningState(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      learning: learning == freezed
          ? _value.learning
          : learning // ignore: cast_nullable_to_non_nullable
              as LearningModel?,
    ));
  }
}

/// @nodoc

class _$_CreateLearningState implements _CreateLearningState {
  const _$_CreateLearningState(
      {this.title = '',
      this.description = '',
      this.isLoading = false,
      this.learning});

  @JsonKey()
  @override
  final String title;
  @JsonKey()
  @override
  final String description;
  @JsonKey()
  @override
  final bool isLoading;
  @override
  final LearningModel? learning;

  @override
  String toString() {
    return 'CreateLearningState(title: $title, description: $description, isLoading: $isLoading, learning: $learning)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateLearningState &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.learning, learning));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(learning));

  @JsonKey(ignore: true)
  @override
  _$CreateLearningStateCopyWith<_CreateLearningState> get copyWith =>
      __$CreateLearningStateCopyWithImpl<_CreateLearningState>(
          this, _$identity);
}

abstract class _CreateLearningState implements CreateLearningState {
  const factory _CreateLearningState(
      {String title,
      String description,
      bool isLoading,
      LearningModel? learning}) = _$_CreateLearningState;

  @override
  String get title;
  @override
  String get description;
  @override
  bool get isLoading;
  @override
  LearningModel? get learning;
  @override
  @JsonKey(ignore: true)
  _$CreateLearningStateCopyWith<_CreateLearningState> get copyWith =>
      throw _privateConstructorUsedError;
}
