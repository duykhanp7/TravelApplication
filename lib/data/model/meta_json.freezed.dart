// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MetaJson _$MetaJsonFromJson(Map<String, dynamic> json) {
  return _MetaJson.fromJson(json);
}

/// @nodoc
mixin _$MetaJson {
  PaginationJson? get pagination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaJsonCopyWith<MetaJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaJsonCopyWith<$Res> {
  factory $MetaJsonCopyWith(MetaJson value, $Res Function(MetaJson) then) =
      _$MetaJsonCopyWithImpl<$Res, MetaJson>;
  @useResult
  $Res call({PaginationJson? pagination});

  $PaginationJsonCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$MetaJsonCopyWithImpl<$Res, $Val extends MetaJson>
    implements $MetaJsonCopyWith<$Res> {
  _$MetaJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationJson?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationJsonCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationJsonCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MetaJsonCopyWith<$Res> implements $MetaJsonCopyWith<$Res> {
  factory _$$_MetaJsonCopyWith(
          _$_MetaJson value, $Res Function(_$_MetaJson) then) =
      __$$_MetaJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginationJson? pagination});

  @override
  $PaginationJsonCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$_MetaJsonCopyWithImpl<$Res>
    extends _$MetaJsonCopyWithImpl<$Res, _$_MetaJson>
    implements _$$_MetaJsonCopyWith<$Res> {
  __$$_MetaJsonCopyWithImpl(
      _$_MetaJson _value, $Res Function(_$_MetaJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = freezed,
  }) {
    return _then(_$_MetaJson(
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationJson?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MetaJson with DiagnosticableTreeMixin implements _MetaJson {
  const _$_MetaJson({this.pagination});

  factory _$_MetaJson.fromJson(Map<String, dynamic> json) =>
      _$$_MetaJsonFromJson(json);

  @override
  final PaginationJson? pagination;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MetaJson(pagination: $pagination)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MetaJson'))
      ..add(DiagnosticsProperty('pagination', pagination));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MetaJson &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetaJsonCopyWith<_$_MetaJson> get copyWith =>
      __$$_MetaJsonCopyWithImpl<_$_MetaJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetaJsonToJson(
      this,
    );
  }
}

abstract class _MetaJson implements MetaJson {
  const factory _MetaJson({final PaginationJson? pagination}) = _$_MetaJson;

  factory _MetaJson.fromJson(Map<String, dynamic> json) = _$_MetaJson.fromJson;

  @override
  PaginationJson? get pagination;
  @override
  @JsonKey(ignore: true)
  _$$_MetaJsonCopyWith<_$_MetaJson> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationJson _$PaginationJsonFromJson(Map<String, dynamic> json) {
  return _PaginationJson.fromJson(json);
}

/// @nodoc
mixin _$PaginationJson {
  int? get page => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  int? get pageCount => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationJsonCopyWith<PaginationJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationJsonCopyWith<$Res> {
  factory $PaginationJsonCopyWith(
          PaginationJson value, $Res Function(PaginationJson) then) =
      _$PaginationJsonCopyWithImpl<$Res, PaginationJson>;
  @useResult
  $Res call({int? page, int? pageSize, int? pageCount, int? total});
}

/// @nodoc
class _$PaginationJsonCopyWithImpl<$Res, $Val extends PaginationJson>
    implements $PaginationJsonCopyWith<$Res> {
  _$PaginationJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? pageCount = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationJsonCopyWith<$Res>
    implements $PaginationJsonCopyWith<$Res> {
  factory _$$_PaginationJsonCopyWith(
          _$_PaginationJson value, $Res Function(_$_PaginationJson) then) =
      __$$_PaginationJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? page, int? pageSize, int? pageCount, int? total});
}

/// @nodoc
class __$$_PaginationJsonCopyWithImpl<$Res>
    extends _$PaginationJsonCopyWithImpl<$Res, _$_PaginationJson>
    implements _$$_PaginationJsonCopyWith<$Res> {
  __$$_PaginationJsonCopyWithImpl(
      _$_PaginationJson _value, $Res Function(_$_PaginationJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? pageCount = freezed,
    Object? total = freezed,
  }) {
    return _then(_$_PaginationJson(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationJson
    with DiagnosticableTreeMixin
    implements _PaginationJson {
  const _$_PaginationJson(
      {this.page, this.pageSize, this.pageCount, this.total});

  factory _$_PaginationJson.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationJsonFromJson(json);

  @override
  final int? page;
  @override
  final int? pageSize;
  @override
  final int? pageCount;
  @override
  final int? total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginationJson(page: $page, pageSize: $pageSize, pageCount: $pageCount, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginationJson'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('pageSize', pageSize))
      ..add(DiagnosticsProperty('pageCount', pageCount))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationJson &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, pageSize, pageCount, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationJsonCopyWith<_$_PaginationJson> get copyWith =>
      __$$_PaginationJsonCopyWithImpl<_$_PaginationJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationJsonToJson(
      this,
    );
  }
}

abstract class _PaginationJson implements PaginationJson {
  const factory _PaginationJson(
      {final int? page,
      final int? pageSize,
      final int? pageCount,
      final int? total}) = _$_PaginationJson;

  factory _PaginationJson.fromJson(Map<String, dynamic> json) =
      _$_PaginationJson.fromJson;

  @override
  int? get page;
  @override
  int? get pageSize;
  @override
  int? get pageCount;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationJsonCopyWith<_$_PaginationJson> get copyWith =>
      throw _privateConstructorUsedError;
}
