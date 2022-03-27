// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dashboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DashboardStateTearOff {
  const _$DashboardStateTearOff();

  _DashboardState call(
      {List<LearningModel> learnings = const [],
      List<LearningModel> mostRecentLearnings = const [],
      bool isLoading = false,
      int learningsPastSevenDays = 0,
      int learningsPastMonth = 0}) {
    return _DashboardState(
      learnings: learnings,
      mostRecentLearnings: mostRecentLearnings,
      isLoading: isLoading,
      learningsPastSevenDays: learningsPastSevenDays,
      learningsPastMonth: learningsPastMonth,
    );
  }
}

/// @nodoc
const $DashboardState = _$DashboardStateTearOff();

/// @nodoc
mixin _$DashboardState {
  List<LearningModel> get learnings => throw _privateConstructorUsedError;
  List<LearningModel> get mostRecentLearnings =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  int get learningsPastSevenDays => throw _privateConstructorUsedError;
  int get learningsPastMonth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res>;
  $Res call(
      {List<LearningModel> learnings,
      List<LearningModel> mostRecentLearnings,
      bool isLoading,
      int learningsPastSevenDays,
      int learningsPastMonth});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  final DashboardState _value;
  // ignore: unused_field
  final $Res Function(DashboardState) _then;

  @override
  $Res call({
    Object? learnings = freezed,
    Object? mostRecentLearnings = freezed,
    Object? isLoading = freezed,
    Object? learningsPastSevenDays = freezed,
    Object? learningsPastMonth = freezed,
  }) {
    return _then(_value.copyWith(
      learnings: learnings == freezed
          ? _value.learnings
          : learnings // ignore: cast_nullable_to_non_nullable
              as List<LearningModel>,
      mostRecentLearnings: mostRecentLearnings == freezed
          ? _value.mostRecentLearnings
          : mostRecentLearnings // ignore: cast_nullable_to_non_nullable
              as List<LearningModel>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      learningsPastSevenDays: learningsPastSevenDays == freezed
          ? _value.learningsPastSevenDays
          : learningsPastSevenDays // ignore: cast_nullable_to_non_nullable
              as int,
      learningsPastMonth: learningsPastMonth == freezed
          ? _value.learningsPastMonth
          : learningsPastMonth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DashboardStateCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(
          _DashboardState value, $Res Function(_DashboardState) then) =
      __$DashboardStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<LearningModel> learnings,
      List<LearningModel> mostRecentLearnings,
      bool isLoading,
      int learningsPastSevenDays,
      int learningsPastMonth});
}

/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(
      _DashboardState _value, $Res Function(_DashboardState) _then)
      : super(_value, (v) => _then(v as _DashboardState));

  @override
  _DashboardState get _value => super._value as _DashboardState;

  @override
  $Res call({
    Object? learnings = freezed,
    Object? mostRecentLearnings = freezed,
    Object? isLoading = freezed,
    Object? learningsPastSevenDays = freezed,
    Object? learningsPastMonth = freezed,
  }) {
    return _then(_DashboardState(
      learnings: learnings == freezed
          ? _value.learnings
          : learnings // ignore: cast_nullable_to_non_nullable
              as List<LearningModel>,
      mostRecentLearnings: mostRecentLearnings == freezed
          ? _value.mostRecentLearnings
          : mostRecentLearnings // ignore: cast_nullable_to_non_nullable
              as List<LearningModel>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      learningsPastSevenDays: learningsPastSevenDays == freezed
          ? _value.learningsPastSevenDays
          : learningsPastSevenDays // ignore: cast_nullable_to_non_nullable
              as int,
      learningsPastMonth: learningsPastMonth == freezed
          ? _value.learningsPastMonth
          : learningsPastMonth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DashboardState implements _DashboardState {
  const _$_DashboardState(
      {this.learnings = const [],
      this.mostRecentLearnings = const [],
      this.isLoading = false,
      this.learningsPastSevenDays = 0,
      this.learningsPastMonth = 0});

  @JsonKey()
  @override
  final List<LearningModel> learnings;
  @JsonKey()
  @override
  final List<LearningModel> mostRecentLearnings;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final int learningsPastSevenDays;
  @JsonKey()
  @override
  final int learningsPastMonth;

  @override
  String toString() {
    return 'DashboardState(learnings: $learnings, mostRecentLearnings: $mostRecentLearnings, isLoading: $isLoading, learningsPastSevenDays: $learningsPastSevenDays, learningsPastMonth: $learningsPastMonth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardState &&
            const DeepCollectionEquality().equals(other.learnings, learnings) &&
            const DeepCollectionEquality()
                .equals(other.mostRecentLearnings, mostRecentLearnings) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.learningsPastSevenDays, learningsPastSevenDays) &&
            const DeepCollectionEquality()
                .equals(other.learningsPastMonth, learningsPastMonth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(learnings),
      const DeepCollectionEquality().hash(mostRecentLearnings),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(learningsPastSevenDays),
      const DeepCollectionEquality().hash(learningsPastMonth));

  @JsonKey(ignore: true)
  @override
  _$DashboardStateCopyWith<_DashboardState> get copyWith =>
      __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState(
      {List<LearningModel> learnings,
      List<LearningModel> mostRecentLearnings,
      bool isLoading,
      int learningsPastSevenDays,
      int learningsPastMonth}) = _$_DashboardState;

  @override
  List<LearningModel> get learnings;
  @override
  List<LearningModel> get mostRecentLearnings;
  @override
  bool get isLoading;
  @override
  int get learningsPastSevenDays;
  @override
  int get learningsPastMonth;
  @override
  @JsonKey(ignore: true)
  _$DashboardStateCopyWith<_DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
