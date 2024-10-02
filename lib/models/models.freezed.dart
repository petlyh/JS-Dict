// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FuriganaPart {
  String get text => throw _privateConstructorUsedError;
  String? get furigana => throw _privateConstructorUsedError;

  /// Create a copy of FuriganaPart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FuriganaPartCopyWith<FuriganaPart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FuriganaPartCopyWith<$Res> {
  factory $FuriganaPartCopyWith(
          FuriganaPart value, $Res Function(FuriganaPart) then) =
      _$FuriganaPartCopyWithImpl<$Res, FuriganaPart>;
  @useResult
  $Res call({String text, String? furigana});
}

/// @nodoc
class _$FuriganaPartCopyWithImpl<$Res, $Val extends FuriganaPart>
    implements $FuriganaPartCopyWith<$Res> {
  _$FuriganaPartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FuriganaPart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? furigana = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      furigana: freezed == furigana
          ? _value.furigana
          : furigana // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FuriganaPartImplCopyWith<$Res>
    implements $FuriganaPartCopyWith<$Res> {
  factory _$$FuriganaPartImplCopyWith(
          _$FuriganaPartImpl value, $Res Function(_$FuriganaPartImpl) then) =
      __$$FuriganaPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String? furigana});
}

/// @nodoc
class __$$FuriganaPartImplCopyWithImpl<$Res>
    extends _$FuriganaPartCopyWithImpl<$Res, _$FuriganaPartImpl>
    implements _$$FuriganaPartImplCopyWith<$Res> {
  __$$FuriganaPartImplCopyWithImpl(
      _$FuriganaPartImpl _value, $Res Function(_$FuriganaPartImpl) _then)
      : super(_value, _then);

  /// Create a copy of FuriganaPart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? furigana = freezed,
  }) {
    return _then(_$FuriganaPartImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == furigana
          ? _value.furigana
          : furigana // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FuriganaPartImpl extends _FuriganaPart {
  const _$FuriganaPartImpl(this.text, [this.furigana]) : super._();

  @override
  final String text;
  @override
  final String? furigana;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuriganaPartImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.furigana, furigana) ||
                other.furigana == furigana));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, furigana);

  /// Create a copy of FuriganaPart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FuriganaPartImplCopyWith<_$FuriganaPartImpl> get copyWith =>
      __$$FuriganaPartImplCopyWithImpl<_$FuriganaPartImpl>(this, _$identity);
}

abstract class _FuriganaPart extends FuriganaPart {
  const factory _FuriganaPart(final String text, [final String? furigana]) =
      _$FuriganaPartImpl;
  const _FuriganaPart._() : super._();

  @override
  String get text;
  @override
  String? get furigana;

  /// Create a copy of FuriganaPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FuriganaPartImplCopyWith<_$FuriganaPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Kanji {
  String get kanji => throw _privateConstructorUsedError;
  int get strokeCount => throw _privateConstructorUsedError;
  List<String> get meanings => throw _privateConstructorUsedError;
  List<String> get kunReadings => throw _privateConstructorUsedError;
  List<String> get onReadings => throw _privateConstructorUsedError;
  KanjiType? get type => throw _privateConstructorUsedError;
  JLPTLevel? get jlptLevel => throw _privateConstructorUsedError;
  KanjiDetails? get details => throw _privateConstructorUsedError;

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KanjiCopyWith<Kanji> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KanjiCopyWith<$Res> {
  factory $KanjiCopyWith(Kanji value, $Res Function(Kanji) then) =
      _$KanjiCopyWithImpl<$Res, Kanji>;
  @useResult
  $Res call(
      {String kanji,
      int strokeCount,
      List<String> meanings,
      List<String> kunReadings,
      List<String> onReadings,
      KanjiType? type,
      JLPTLevel? jlptLevel,
      KanjiDetails? details});

  $KanjiDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class _$KanjiCopyWithImpl<$Res, $Val extends Kanji>
    implements $KanjiCopyWith<$Res> {
  _$KanjiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kanji = null,
    Object? strokeCount = null,
    Object? meanings = null,
    Object? kunReadings = null,
    Object? onReadings = null,
    Object? type = freezed,
    Object? jlptLevel = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      kanji: null == kanji
          ? _value.kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as String,
      strokeCount: null == strokeCount
          ? _value.strokeCount
          : strokeCount // ignore: cast_nullable_to_non_nullable
              as int,
      meanings: null == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      kunReadings: null == kunReadings
          ? _value.kunReadings
          : kunReadings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onReadings: null == onReadings
          ? _value.onReadings
          : onReadings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as KanjiType?,
      jlptLevel: freezed == jlptLevel
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as JLPTLevel?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as KanjiDetails?,
    ) as $Val);
  }

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KanjiDetailsCopyWith<$Res>? get details {
    if (_value.details == null) {
      return null;
    }

    return $KanjiDetailsCopyWith<$Res>(_value.details!, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KanjiImplCopyWith<$Res> implements $KanjiCopyWith<$Res> {
  factory _$$KanjiImplCopyWith(
          _$KanjiImpl value, $Res Function(_$KanjiImpl) then) =
      __$$KanjiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String kanji,
      int strokeCount,
      List<String> meanings,
      List<String> kunReadings,
      List<String> onReadings,
      KanjiType? type,
      JLPTLevel? jlptLevel,
      KanjiDetails? details});

  @override
  $KanjiDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class __$$KanjiImplCopyWithImpl<$Res>
    extends _$KanjiCopyWithImpl<$Res, _$KanjiImpl>
    implements _$$KanjiImplCopyWith<$Res> {
  __$$KanjiImplCopyWithImpl(
      _$KanjiImpl _value, $Res Function(_$KanjiImpl) _then)
      : super(_value, _then);

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kanji = null,
    Object? strokeCount = null,
    Object? meanings = null,
    Object? kunReadings = null,
    Object? onReadings = null,
    Object? type = freezed,
    Object? jlptLevel = freezed,
    Object? details = freezed,
  }) {
    return _then(_$KanjiImpl(
      kanji: null == kanji
          ? _value.kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as String,
      strokeCount: null == strokeCount
          ? _value.strokeCount
          : strokeCount // ignore: cast_nullable_to_non_nullable
              as int,
      meanings: null == meanings
          ? _value._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      kunReadings: null == kunReadings
          ? _value._kunReadings
          : kunReadings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onReadings: null == onReadings
          ? _value._onReadings
          : onReadings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as KanjiType?,
      jlptLevel: freezed == jlptLevel
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as JLPTLevel?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as KanjiDetails?,
    ));
  }
}

/// @nodoc

class _$KanjiImpl extends _Kanji {
  const _$KanjiImpl(
      {required this.kanji,
      required this.strokeCount,
      required final List<String> meanings,
      required final List<String> kunReadings,
      required final List<String> onReadings,
      this.type,
      this.jlptLevel,
      this.details})
      : _meanings = meanings,
        _kunReadings = kunReadings,
        _onReadings = onReadings,
        super._();

  @override
  final String kanji;
  @override
  final int strokeCount;
  final List<String> _meanings;
  @override
  List<String> get meanings {
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanings);
  }

  final List<String> _kunReadings;
  @override
  List<String> get kunReadings {
    if (_kunReadings is EqualUnmodifiableListView) return _kunReadings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kunReadings);
  }

  final List<String> _onReadings;
  @override
  List<String> get onReadings {
    if (_onReadings is EqualUnmodifiableListView) return _onReadings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onReadings);
  }

  @override
  final KanjiType? type;
  @override
  final JLPTLevel? jlptLevel;
  @override
  final KanjiDetails? details;

  @override
  String toString() {
    return 'Kanji(kanji: $kanji, strokeCount: $strokeCount, meanings: $meanings, kunReadings: $kunReadings, onReadings: $onReadings, type: $type, jlptLevel: $jlptLevel, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KanjiImpl &&
            (identical(other.kanji, kanji) || other.kanji == kanji) &&
            (identical(other.strokeCount, strokeCount) ||
                other.strokeCount == strokeCount) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings) &&
            const DeepCollectionEquality()
                .equals(other._kunReadings, _kunReadings) &&
            const DeepCollectionEquality()
                .equals(other._onReadings, _onReadings) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.jlptLevel, jlptLevel) ||
                other.jlptLevel == jlptLevel) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      kanji,
      strokeCount,
      const DeepCollectionEquality().hash(_meanings),
      const DeepCollectionEquality().hash(_kunReadings),
      const DeepCollectionEquality().hash(_onReadings),
      type,
      jlptLevel,
      details);

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KanjiImplCopyWith<_$KanjiImpl> get copyWith =>
      __$$KanjiImplCopyWithImpl<_$KanjiImpl>(this, _$identity);
}

abstract class _Kanji extends Kanji {
  const factory _Kanji(
      {required final String kanji,
      required final int strokeCount,
      required final List<String> meanings,
      required final List<String> kunReadings,
      required final List<String> onReadings,
      final KanjiType? type,
      final JLPTLevel? jlptLevel,
      final KanjiDetails? details}) = _$KanjiImpl;
  const _Kanji._() : super._();

  @override
  String get kanji;
  @override
  int get strokeCount;
  @override
  List<String> get meanings;
  @override
  List<String> get kunReadings;
  @override
  List<String> get onReadings;
  @override
  KanjiType? get type;
  @override
  JLPTLevel? get jlptLevel;
  @override
  KanjiDetails? get details;

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KanjiImplCopyWith<_$KanjiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KanjiDetails {
  List<String> get parts => throw _privateConstructorUsedError;
  List<String> get variants => throw _privateConstructorUsedError;
  List<Compound> get onCompounds => throw _privateConstructorUsedError;
  List<Compound> get kunCompounds => throw _privateConstructorUsedError;
  Radical? get radical => throw _privateConstructorUsedError;
  int? get frequency => throw _privateConstructorUsedError;

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KanjiDetailsCopyWith<KanjiDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KanjiDetailsCopyWith<$Res> {
  factory $KanjiDetailsCopyWith(
          KanjiDetails value, $Res Function(KanjiDetails) then) =
      _$KanjiDetailsCopyWithImpl<$Res, KanjiDetails>;
  @useResult
  $Res call(
      {List<String> parts,
      List<String> variants,
      List<Compound> onCompounds,
      List<Compound> kunCompounds,
      Radical? radical,
      int? frequency});

  $RadicalCopyWith<$Res>? get radical;
}

/// @nodoc
class _$KanjiDetailsCopyWithImpl<$Res, $Val extends KanjiDetails>
    implements $KanjiDetailsCopyWith<$Res> {
  _$KanjiDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
    Object? variants = null,
    Object? onCompounds = null,
    Object? kunCompounds = null,
    Object? radical = freezed,
    Object? frequency = freezed,
  }) {
    return _then(_value.copyWith(
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onCompounds: null == onCompounds
          ? _value.onCompounds
          : onCompounds // ignore: cast_nullable_to_non_nullable
              as List<Compound>,
      kunCompounds: null == kunCompounds
          ? _value.kunCompounds
          : kunCompounds // ignore: cast_nullable_to_non_nullable
              as List<Compound>,
      radical: freezed == radical
          ? _value.radical
          : radical // ignore: cast_nullable_to_non_nullable
              as Radical?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RadicalCopyWith<$Res>? get radical {
    if (_value.radical == null) {
      return null;
    }

    return $RadicalCopyWith<$Res>(_value.radical!, (value) {
      return _then(_value.copyWith(radical: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KanjiDetailsImplCopyWith<$Res>
    implements $KanjiDetailsCopyWith<$Res> {
  factory _$$KanjiDetailsImplCopyWith(
          _$KanjiDetailsImpl value, $Res Function(_$KanjiDetailsImpl) then) =
      __$$KanjiDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> parts,
      List<String> variants,
      List<Compound> onCompounds,
      List<Compound> kunCompounds,
      Radical? radical,
      int? frequency});

  @override
  $RadicalCopyWith<$Res>? get radical;
}

/// @nodoc
class __$$KanjiDetailsImplCopyWithImpl<$Res>
    extends _$KanjiDetailsCopyWithImpl<$Res, _$KanjiDetailsImpl>
    implements _$$KanjiDetailsImplCopyWith<$Res> {
  __$$KanjiDetailsImplCopyWithImpl(
      _$KanjiDetailsImpl _value, $Res Function(_$KanjiDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
    Object? variants = null,
    Object? onCompounds = null,
    Object? kunCompounds = null,
    Object? radical = freezed,
    Object? frequency = freezed,
  }) {
    return _then(_$KanjiDetailsImpl(
      parts: null == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onCompounds: null == onCompounds
          ? _value._onCompounds
          : onCompounds // ignore: cast_nullable_to_non_nullable
              as List<Compound>,
      kunCompounds: null == kunCompounds
          ? _value._kunCompounds
          : kunCompounds // ignore: cast_nullable_to_non_nullable
              as List<Compound>,
      radical: freezed == radical
          ? _value.radical
          : radical // ignore: cast_nullable_to_non_nullable
              as Radical?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$KanjiDetailsImpl implements _KanjiDetails {
  const _$KanjiDetailsImpl(
      {required final List<String> parts,
      required final List<String> variants,
      required final List<Compound> onCompounds,
      required final List<Compound> kunCompounds,
      this.radical,
      this.frequency})
      : _parts = parts,
        _variants = variants,
        _onCompounds = onCompounds,
        _kunCompounds = kunCompounds;

  final List<String> _parts;
  @override
  List<String> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

  final List<String> _variants;
  @override
  List<String> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  final List<Compound> _onCompounds;
  @override
  List<Compound> get onCompounds {
    if (_onCompounds is EqualUnmodifiableListView) return _onCompounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onCompounds);
  }

  final List<Compound> _kunCompounds;
  @override
  List<Compound> get kunCompounds {
    if (_kunCompounds is EqualUnmodifiableListView) return _kunCompounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kunCompounds);
  }

  @override
  final Radical? radical;
  @override
  final int? frequency;

  @override
  String toString() {
    return 'KanjiDetails(parts: $parts, variants: $variants, onCompounds: $onCompounds, kunCompounds: $kunCompounds, radical: $radical, frequency: $frequency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KanjiDetailsImpl &&
            const DeepCollectionEquality().equals(other._parts, _parts) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            const DeepCollectionEquality()
                .equals(other._onCompounds, _onCompounds) &&
            const DeepCollectionEquality()
                .equals(other._kunCompounds, _kunCompounds) &&
            (identical(other.radical, radical) || other.radical == radical) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_parts),
      const DeepCollectionEquality().hash(_variants),
      const DeepCollectionEquality().hash(_onCompounds),
      const DeepCollectionEquality().hash(_kunCompounds),
      radical,
      frequency);

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KanjiDetailsImplCopyWith<_$KanjiDetailsImpl> get copyWith =>
      __$$KanjiDetailsImplCopyWithImpl<_$KanjiDetailsImpl>(this, _$identity);
}

abstract class _KanjiDetails implements KanjiDetails {
  const factory _KanjiDetails(
      {required final List<String> parts,
      required final List<String> variants,
      required final List<Compound> onCompounds,
      required final List<Compound> kunCompounds,
      final Radical? radical,
      final int? frequency}) = _$KanjiDetailsImpl;

  @override
  List<String> get parts;
  @override
  List<String> get variants;
  @override
  List<Compound> get onCompounds;
  @override
  List<Compound> get kunCompounds;
  @override
  Radical? get radical;
  @override
  int? get frequency;

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KanjiDetailsImplCopyWith<_$KanjiDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Radical {
  String get character => throw _privateConstructorUsedError;
  List<String> get meanings => throw _privateConstructorUsedError;

  /// Create a copy of Radical
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RadicalCopyWith<Radical> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadicalCopyWith<$Res> {
  factory $RadicalCopyWith(Radical value, $Res Function(Radical) then) =
      _$RadicalCopyWithImpl<$Res, Radical>;
  @useResult
  $Res call({String character, List<String> meanings});
}

/// @nodoc
class _$RadicalCopyWithImpl<$Res, $Val extends Radical>
    implements $RadicalCopyWith<$Res> {
  _$RadicalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Radical
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? meanings = null,
  }) {
    return _then(_value.copyWith(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      meanings: null == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RadicalImplCopyWith<$Res> implements $RadicalCopyWith<$Res> {
  factory _$$RadicalImplCopyWith(
          _$RadicalImpl value, $Res Function(_$RadicalImpl) then) =
      __$$RadicalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String character, List<String> meanings});
}

/// @nodoc
class __$$RadicalImplCopyWithImpl<$Res>
    extends _$RadicalCopyWithImpl<$Res, _$RadicalImpl>
    implements _$$RadicalImplCopyWith<$Res> {
  __$$RadicalImplCopyWithImpl(
      _$RadicalImpl _value, $Res Function(_$RadicalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Radical
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? meanings = null,
  }) {
    return _then(_$RadicalImpl(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      meanings: null == meanings
          ? _value._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$RadicalImpl implements _Radical {
  const _$RadicalImpl(
      {required this.character, required final List<String> meanings})
      : _meanings = meanings;

  @override
  final String character;
  final List<String> _meanings;
  @override
  List<String> get meanings {
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanings);
  }

  @override
  String toString() {
    return 'Radical(character: $character, meanings: $meanings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadicalImpl &&
            (identical(other.character, character) ||
                other.character == character) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, character, const DeepCollectionEquality().hash(_meanings));

  /// Create a copy of Radical
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RadicalImplCopyWith<_$RadicalImpl> get copyWith =>
      __$$RadicalImplCopyWithImpl<_$RadicalImpl>(this, _$identity);
}

abstract class _Radical implements Radical {
  const factory _Radical(
      {required final String character,
      required final List<String> meanings}) = _$RadicalImpl;

  @override
  String get character;
  @override
  List<String> get meanings;

  /// Create a copy of Radical
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RadicalImplCopyWith<_$RadicalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Compound {
  String get compound => throw _privateConstructorUsedError;
  String get reading => throw _privateConstructorUsedError;
  List<String> get meanings => throw _privateConstructorUsedError;

  /// Create a copy of Compound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompoundCopyWith<Compound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompoundCopyWith<$Res> {
  factory $CompoundCopyWith(Compound value, $Res Function(Compound) then) =
      _$CompoundCopyWithImpl<$Res, Compound>;
  @useResult
  $Res call({String compound, String reading, List<String> meanings});
}

/// @nodoc
class _$CompoundCopyWithImpl<$Res, $Val extends Compound>
    implements $CompoundCopyWith<$Res> {
  _$CompoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Compound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compound = null,
    Object? reading = null,
    Object? meanings = null,
  }) {
    return _then(_value.copyWith(
      compound: null == compound
          ? _value.compound
          : compound // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      meanings: null == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompoundImplCopyWith<$Res>
    implements $CompoundCopyWith<$Res> {
  factory _$$CompoundImplCopyWith(
          _$CompoundImpl value, $Res Function(_$CompoundImpl) then) =
      __$$CompoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String compound, String reading, List<String> meanings});
}

/// @nodoc
class __$$CompoundImplCopyWithImpl<$Res>
    extends _$CompoundCopyWithImpl<$Res, _$CompoundImpl>
    implements _$$CompoundImplCopyWith<$Res> {
  __$$CompoundImplCopyWithImpl(
      _$CompoundImpl _value, $Res Function(_$CompoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of Compound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compound = null,
    Object? reading = null,
    Object? meanings = null,
  }) {
    return _then(_$CompoundImpl(
      compound: null == compound
          ? _value.compound
          : compound // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      meanings: null == meanings
          ? _value._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$CompoundImpl implements _Compound {
  const _$CompoundImpl(
      {required this.compound,
      required this.reading,
      required final List<String> meanings})
      : _meanings = meanings;

  @override
  final String compound;
  @override
  final String reading;
  final List<String> _meanings;
  @override
  List<String> get meanings {
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanings);
  }

  @override
  String toString() {
    return 'Compound(compound: $compound, reading: $reading, meanings: $meanings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompoundImpl &&
            (identical(other.compound, compound) ||
                other.compound == compound) &&
            (identical(other.reading, reading) || other.reading == reading) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, compound, reading,
      const DeepCollectionEquality().hash(_meanings));

  /// Create a copy of Compound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompoundImplCopyWith<_$CompoundImpl> get copyWith =>
      __$$CompoundImplCopyWithImpl<_$CompoundImpl>(this, _$identity);
}

abstract class _Compound implements Compound {
  const factory _Compound(
      {required final String compound,
      required final String reading,
      required final List<String> meanings}) = _$CompoundImpl;

  @override
  String get compound;
  @override
  String get reading;
  @override
  List<String> get meanings;

  /// Create a copy of Compound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompoundImplCopyWith<_$CompoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Name {
  String get japanese => throw _privateConstructorUsedError;
  String get english => throw _privateConstructorUsedError;
  String? get reading => throw _privateConstructorUsedError;

  /// null if type is "Unclassified name"
  String? get type => throw _privateConstructorUsedError;

  /// The ID of the corresponding [Word], if available.
  ///
  /// Names seem to only be linked to a [Word] if the word has Wikipedia data.
  String? get wordId => throw _privateConstructorUsedError;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NameCopyWith<Name> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameCopyWith<$Res> {
  factory $NameCopyWith(Name value, $Res Function(Name) then) =
      _$NameCopyWithImpl<$Res, Name>;
  @useResult
  $Res call(
      {String japanese,
      String english,
      String? reading,
      String? type,
      String? wordId});
}

/// @nodoc
class _$NameCopyWithImpl<$Res, $Val extends Name>
    implements $NameCopyWith<$Res> {
  _$NameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? japanese = null,
    Object? english = null,
    Object? reading = freezed,
    Object? type = freezed,
    Object? wordId = freezed,
  }) {
    return _then(_value.copyWith(
      japanese: null == japanese
          ? _value.japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as String,
      english: null == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      reading: freezed == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      wordId: freezed == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NameImplCopyWith<$Res> implements $NameCopyWith<$Res> {
  factory _$$NameImplCopyWith(
          _$NameImpl value, $Res Function(_$NameImpl) then) =
      __$$NameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String japanese,
      String english,
      String? reading,
      String? type,
      String? wordId});
}

/// @nodoc
class __$$NameImplCopyWithImpl<$Res>
    extends _$NameCopyWithImpl<$Res, _$NameImpl>
    implements _$$NameImplCopyWith<$Res> {
  __$$NameImplCopyWithImpl(_$NameImpl _value, $Res Function(_$NameImpl) _then)
      : super(_value, _then);

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? japanese = null,
    Object? english = null,
    Object? reading = freezed,
    Object? type = freezed,
    Object? wordId = freezed,
  }) {
    return _then(_$NameImpl(
      japanese: null == japanese
          ? _value.japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as String,
      english: null == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      reading: freezed == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      wordId: freezed == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NameImpl implements _Name {
  const _$NameImpl(
      {required this.japanese,
      required this.english,
      this.reading,
      this.type,
      this.wordId});

  @override
  final String japanese;
  @override
  final String english;
  @override
  final String? reading;

  /// null if type is "Unclassified name"
  @override
  final String? type;

  /// The ID of the corresponding [Word], if available.
  ///
  /// Names seem to only be linked to a [Word] if the word has Wikipedia data.
  @override
  final String? wordId;

  @override
  String toString() {
    return 'Name(japanese: $japanese, english: $english, reading: $reading, type: $type, wordId: $wordId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameImpl &&
            (identical(other.japanese, japanese) ||
                other.japanese == japanese) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.reading, reading) || other.reading == reading) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.wordId, wordId) || other.wordId == wordId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, japanese, english, reading, type, wordId);

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameImplCopyWith<_$NameImpl> get copyWith =>
      __$$NameImplCopyWithImpl<_$NameImpl>(this, _$identity);
}

abstract class _Name implements Name {
  const factory _Name(
      {required final String japanese,
      required final String english,
      final String? reading,
      final String? type,
      final String? wordId}) = _$NameImpl;

  @override
  String get japanese;
  @override
  String get english;
  @override
  String? get reading;

  /// null if type is "Unclassified name"
  @override
  String? get type;

  /// The ID of the corresponding [Word], if available.
  ///
  /// Names seem to only be linked to a [Word] if the word has Wikipedia data.
  @override
  String? get wordId;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameImplCopyWith<_$NameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchResponse<T extends ResultType> {
  List<T> get results => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  List<String> get zenEntries => throw _privateConstructorUsedError;
  List<String> get noMatchesFor => throw _privateConstructorUsedError;
  Correction? get correction => throw _privateConstructorUsedError;
  GrammarInfo? get grammarInfo => throw _privateConstructorUsedError;
  Conversion? get conversion => throw _privateConstructorUsedError;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchResponseCopyWith<T, SearchResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResponseCopyWith<T extends ResultType, $Res> {
  factory $SearchResponseCopyWith(
          SearchResponse<T> value, $Res Function(SearchResponse<T>) then) =
      _$SearchResponseCopyWithImpl<T, $Res, SearchResponse<T>>;
  @useResult
  $Res call(
      {List<T> results,
      bool hasNextPage,
      List<String> zenEntries,
      List<String> noMatchesFor,
      Correction? correction,
      GrammarInfo? grammarInfo,
      Conversion? conversion});

  $CorrectionCopyWith<$Res>? get correction;
  $GrammarInfoCopyWith<$Res>? get grammarInfo;
  $ConversionCopyWith<$Res>? get conversion;
}

/// @nodoc
class _$SearchResponseCopyWithImpl<T extends ResultType, $Res,
        $Val extends SearchResponse<T>>
    implements $SearchResponseCopyWith<T, $Res> {
  _$SearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? hasNextPage = null,
    Object? zenEntries = null,
    Object? noMatchesFor = null,
    Object? correction = freezed,
    Object? grammarInfo = freezed,
    Object? conversion = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      zenEntries: null == zenEntries
          ? _value.zenEntries
          : zenEntries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      noMatchesFor: null == noMatchesFor
          ? _value.noMatchesFor
          : noMatchesFor // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correction: freezed == correction
          ? _value.correction
          : correction // ignore: cast_nullable_to_non_nullable
              as Correction?,
      grammarInfo: freezed == grammarInfo
          ? _value.grammarInfo
          : grammarInfo // ignore: cast_nullable_to_non_nullable
              as GrammarInfo?,
      conversion: freezed == conversion
          ? _value.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as Conversion?,
    ) as $Val);
  }

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CorrectionCopyWith<$Res>? get correction {
    if (_value.correction == null) {
      return null;
    }

    return $CorrectionCopyWith<$Res>(_value.correction!, (value) {
      return _then(_value.copyWith(correction: value) as $Val);
    });
  }

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GrammarInfoCopyWith<$Res>? get grammarInfo {
    if (_value.grammarInfo == null) {
      return null;
    }

    return $GrammarInfoCopyWith<$Res>(_value.grammarInfo!, (value) {
      return _then(_value.copyWith(grammarInfo: value) as $Val);
    });
  }

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversionCopyWith<$Res>? get conversion {
    if (_value.conversion == null) {
      return null;
    }

    return $ConversionCopyWith<$Res>(_value.conversion!, (value) {
      return _then(_value.copyWith(conversion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchResponseImplCopyWith<T extends ResultType, $Res>
    implements $SearchResponseCopyWith<T, $Res> {
  factory _$$SearchResponseImplCopyWith(_$SearchResponseImpl<T> value,
          $Res Function(_$SearchResponseImpl<T>) then) =
      __$$SearchResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> results,
      bool hasNextPage,
      List<String> zenEntries,
      List<String> noMatchesFor,
      Correction? correction,
      GrammarInfo? grammarInfo,
      Conversion? conversion});

  @override
  $CorrectionCopyWith<$Res>? get correction;
  @override
  $GrammarInfoCopyWith<$Res>? get grammarInfo;
  @override
  $ConversionCopyWith<$Res>? get conversion;
}

/// @nodoc
class __$$SearchResponseImplCopyWithImpl<T extends ResultType, $Res>
    extends _$SearchResponseCopyWithImpl<T, $Res, _$SearchResponseImpl<T>>
    implements _$$SearchResponseImplCopyWith<T, $Res> {
  __$$SearchResponseImplCopyWithImpl(_$SearchResponseImpl<T> _value,
      $Res Function(_$SearchResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? hasNextPage = null,
    Object? zenEntries = null,
    Object? noMatchesFor = null,
    Object? correction = freezed,
    Object? grammarInfo = freezed,
    Object? conversion = freezed,
  }) {
    return _then(_$SearchResponseImpl<T>(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      zenEntries: null == zenEntries
          ? _value._zenEntries
          : zenEntries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      noMatchesFor: null == noMatchesFor
          ? _value._noMatchesFor
          : noMatchesFor // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correction: freezed == correction
          ? _value.correction
          : correction // ignore: cast_nullable_to_non_nullable
              as Correction?,
      grammarInfo: freezed == grammarInfo
          ? _value.grammarInfo
          : grammarInfo // ignore: cast_nullable_to_non_nullable
              as GrammarInfo?,
      conversion: freezed == conversion
          ? _value.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as Conversion?,
    ));
  }
}

/// @nodoc

class _$SearchResponseImpl<T extends ResultType> implements _SearchResponse<T> {
  const _$SearchResponseImpl(
      {required final List<T> results,
      this.hasNextPage = false,
      final List<String> zenEntries = const [],
      final List<String> noMatchesFor = const [],
      this.correction,
      this.grammarInfo,
      this.conversion})
      : _results = results,
        _zenEntries = zenEntries,
        _noMatchesFor = noMatchesFor;

  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  final bool hasNextPage;
  final List<String> _zenEntries;
  @override
  @JsonKey()
  List<String> get zenEntries {
    if (_zenEntries is EqualUnmodifiableListView) return _zenEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_zenEntries);
  }

  final List<String> _noMatchesFor;
  @override
  @JsonKey()
  List<String> get noMatchesFor {
    if (_noMatchesFor is EqualUnmodifiableListView) return _noMatchesFor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noMatchesFor);
  }

  @override
  final Correction? correction;
  @override
  final GrammarInfo? grammarInfo;
  @override
  final Conversion? conversion;

  @override
  String toString() {
    return 'SearchResponse<$T>(results: $results, hasNextPage: $hasNextPage, zenEntries: $zenEntries, noMatchesFor: $noMatchesFor, correction: $correction, grammarInfo: $grammarInfo, conversion: $conversion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            const DeepCollectionEquality()
                .equals(other._zenEntries, _zenEntries) &&
            const DeepCollectionEquality()
                .equals(other._noMatchesFor, _noMatchesFor) &&
            (identical(other.correction, correction) ||
                other.correction == correction) &&
            (identical(other.grammarInfo, grammarInfo) ||
                other.grammarInfo == grammarInfo) &&
            (identical(other.conversion, conversion) ||
                other.conversion == conversion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      hasNextPage,
      const DeepCollectionEquality().hash(_zenEntries),
      const DeepCollectionEquality().hash(_noMatchesFor),
      correction,
      grammarInfo,
      conversion);

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResponseImplCopyWith<T, _$SearchResponseImpl<T>> get copyWith =>
      __$$SearchResponseImplCopyWithImpl<T, _$SearchResponseImpl<T>>(
          this, _$identity);
}

abstract class _SearchResponse<T extends ResultType>
    implements SearchResponse<T> {
  const factory _SearchResponse(
      {required final List<T> results,
      final bool hasNextPage,
      final List<String> zenEntries,
      final List<String> noMatchesFor,
      final Correction? correction,
      final GrammarInfo? grammarInfo,
      final Conversion? conversion}) = _$SearchResponseImpl<T>;

  @override
  List<T> get results;
  @override
  bool get hasNextPage;
  @override
  List<String> get zenEntries;
  @override
  List<String> get noMatchesFor;
  @override
  Correction? get correction;
  @override
  GrammarInfo? get grammarInfo;
  @override
  Conversion? get conversion;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchResponseImplCopyWith<T, _$SearchResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Correction {
  String get effective => throw _privateConstructorUsedError;
  String get original => throw _privateConstructorUsedError;
  bool get noMatchesForOriginal => throw _privateConstructorUsedError;

  /// Create a copy of Correction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CorrectionCopyWith<Correction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CorrectionCopyWith<$Res> {
  factory $CorrectionCopyWith(
          Correction value, $Res Function(Correction) then) =
      _$CorrectionCopyWithImpl<$Res, Correction>;
  @useResult
  $Res call({String effective, String original, bool noMatchesForOriginal});
}

/// @nodoc
class _$CorrectionCopyWithImpl<$Res, $Val extends Correction>
    implements $CorrectionCopyWith<$Res> {
  _$CorrectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Correction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effective = null,
    Object? original = null,
    Object? noMatchesForOriginal = null,
  }) {
    return _then(_value.copyWith(
      effective: null == effective
          ? _value.effective
          : effective // ignore: cast_nullable_to_non_nullable
              as String,
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      noMatchesForOriginal: null == noMatchesForOriginal
          ? _value.noMatchesForOriginal
          : noMatchesForOriginal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CorrectionImplCopyWith<$Res>
    implements $CorrectionCopyWith<$Res> {
  factory _$$CorrectionImplCopyWith(
          _$CorrectionImpl value, $Res Function(_$CorrectionImpl) then) =
      __$$CorrectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String effective, String original, bool noMatchesForOriginal});
}

/// @nodoc
class __$$CorrectionImplCopyWithImpl<$Res>
    extends _$CorrectionCopyWithImpl<$Res, _$CorrectionImpl>
    implements _$$CorrectionImplCopyWith<$Res> {
  __$$CorrectionImplCopyWithImpl(
      _$CorrectionImpl _value, $Res Function(_$CorrectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Correction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effective = null,
    Object? original = null,
    Object? noMatchesForOriginal = null,
  }) {
    return _then(_$CorrectionImpl(
      effective: null == effective
          ? _value.effective
          : effective // ignore: cast_nullable_to_non_nullable
              as String,
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      noMatchesForOriginal: null == noMatchesForOriginal
          ? _value.noMatchesForOriginal
          : noMatchesForOriginal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CorrectionImpl implements _Correction {
  const _$CorrectionImpl(
      {required this.effective,
      required this.original,
      required this.noMatchesForOriginal});

  @override
  final String effective;
  @override
  final String original;
  @override
  final bool noMatchesForOriginal;

  @override
  String toString() {
    return 'Correction(effective: $effective, original: $original, noMatchesForOriginal: $noMatchesForOriginal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CorrectionImpl &&
            (identical(other.effective, effective) ||
                other.effective == effective) &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.noMatchesForOriginal, noMatchesForOriginal) ||
                other.noMatchesForOriginal == noMatchesForOriginal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, effective, original, noMatchesForOriginal);

  /// Create a copy of Correction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CorrectionImplCopyWith<_$CorrectionImpl> get copyWith =>
      __$$CorrectionImplCopyWithImpl<_$CorrectionImpl>(this, _$identity);
}

abstract class _Correction implements Correction {
  const factory _Correction(
      {required final String effective,
      required final String original,
      required final bool noMatchesForOriginal}) = _$CorrectionImpl;

  @override
  String get effective;
  @override
  String get original;
  @override
  bool get noMatchesForOriginal;

  /// Create a copy of Correction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CorrectionImplCopyWith<_$CorrectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GrammarInfo {
  String get word => throw _privateConstructorUsedError;
  String get possibleInflectionOf => throw _privateConstructorUsedError;
  List<String> get formInfos => throw _privateConstructorUsedError;

  /// Create a copy of GrammarInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrammarInfoCopyWith<GrammarInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrammarInfoCopyWith<$Res> {
  factory $GrammarInfoCopyWith(
          GrammarInfo value, $Res Function(GrammarInfo) then) =
      _$GrammarInfoCopyWithImpl<$Res, GrammarInfo>;
  @useResult
  $Res call({String word, String possibleInflectionOf, List<String> formInfos});
}

/// @nodoc
class _$GrammarInfoCopyWithImpl<$Res, $Val extends GrammarInfo>
    implements $GrammarInfoCopyWith<$Res> {
  _$GrammarInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrammarInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? possibleInflectionOf = null,
    Object? formInfos = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      possibleInflectionOf: null == possibleInflectionOf
          ? _value.possibleInflectionOf
          : possibleInflectionOf // ignore: cast_nullable_to_non_nullable
              as String,
      formInfos: null == formInfos
          ? _value.formInfos
          : formInfos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GrammarInfoImplCopyWith<$Res>
    implements $GrammarInfoCopyWith<$Res> {
  factory _$$GrammarInfoImplCopyWith(
          _$GrammarInfoImpl value, $Res Function(_$GrammarInfoImpl) then) =
      __$$GrammarInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String word, String possibleInflectionOf, List<String> formInfos});
}

/// @nodoc
class __$$GrammarInfoImplCopyWithImpl<$Res>
    extends _$GrammarInfoCopyWithImpl<$Res, _$GrammarInfoImpl>
    implements _$$GrammarInfoImplCopyWith<$Res> {
  __$$GrammarInfoImplCopyWithImpl(
      _$GrammarInfoImpl _value, $Res Function(_$GrammarInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GrammarInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? possibleInflectionOf = null,
    Object? formInfos = null,
  }) {
    return _then(_$GrammarInfoImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      possibleInflectionOf: null == possibleInflectionOf
          ? _value.possibleInflectionOf
          : possibleInflectionOf // ignore: cast_nullable_to_non_nullable
              as String,
      formInfos: null == formInfos
          ? _value._formInfos
          : formInfos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$GrammarInfoImpl implements _GrammarInfo {
  const _$GrammarInfoImpl(
      {required this.word,
      required this.possibleInflectionOf,
      required final List<String> formInfos})
      : _formInfos = formInfos;

  @override
  final String word;
  @override
  final String possibleInflectionOf;
  final List<String> _formInfos;
  @override
  List<String> get formInfos {
    if (_formInfos is EqualUnmodifiableListView) return _formInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formInfos);
  }

  @override
  String toString() {
    return 'GrammarInfo(word: $word, possibleInflectionOf: $possibleInflectionOf, formInfos: $formInfos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrammarInfoImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.possibleInflectionOf, possibleInflectionOf) ||
                other.possibleInflectionOf == possibleInflectionOf) &&
            const DeepCollectionEquality()
                .equals(other._formInfos, _formInfos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word, possibleInflectionOf,
      const DeepCollectionEquality().hash(_formInfos));

  /// Create a copy of GrammarInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrammarInfoImplCopyWith<_$GrammarInfoImpl> get copyWith =>
      __$$GrammarInfoImplCopyWithImpl<_$GrammarInfoImpl>(this, _$identity);
}

abstract class _GrammarInfo implements GrammarInfo {
  const factory _GrammarInfo(
      {required final String word,
      required final String possibleInflectionOf,
      required final List<String> formInfos}) = _$GrammarInfoImpl;

  @override
  String get word;
  @override
  String get possibleInflectionOf;
  @override
  List<String> get formInfos;

  /// Create a copy of GrammarInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrammarInfoImplCopyWith<_$GrammarInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Conversion {
  String get original => throw _privateConstructorUsedError;
  String get converted => throw _privateConstructorUsedError;

  /// Create a copy of Conversion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversionCopyWith<Conversion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionCopyWith<$Res> {
  factory $ConversionCopyWith(
          Conversion value, $Res Function(Conversion) then) =
      _$ConversionCopyWithImpl<$Res, Conversion>;
  @useResult
  $Res call({String original, String converted});
}

/// @nodoc
class _$ConversionCopyWithImpl<$Res, $Val extends Conversion>
    implements $ConversionCopyWith<$Res> {
  _$ConversionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Conversion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? converted = null,
  }) {
    return _then(_value.copyWith(
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      converted: null == converted
          ? _value.converted
          : converted // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversionImplCopyWith<$Res>
    implements $ConversionCopyWith<$Res> {
  factory _$$ConversionImplCopyWith(
          _$ConversionImpl value, $Res Function(_$ConversionImpl) then) =
      __$$ConversionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String original, String converted});
}

/// @nodoc
class __$$ConversionImplCopyWithImpl<$Res>
    extends _$ConversionCopyWithImpl<$Res, _$ConversionImpl>
    implements _$$ConversionImplCopyWith<$Res> {
  __$$ConversionImplCopyWithImpl(
      _$ConversionImpl _value, $Res Function(_$ConversionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Conversion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? converted = null,
  }) {
    return _then(_$ConversionImpl(
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      converted: null == converted
          ? _value.converted
          : converted // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConversionImpl implements _Conversion {
  const _$ConversionImpl({required this.original, required this.converted});

  @override
  final String original;
  @override
  final String converted;

  @override
  String toString() {
    return 'Conversion(original: $original, converted: $converted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionImpl &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.converted, converted) ||
                other.converted == converted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, original, converted);

  /// Create a copy of Conversion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionImplCopyWith<_$ConversionImpl> get copyWith =>
      __$$ConversionImplCopyWithImpl<_$ConversionImpl>(this, _$identity);
}

abstract class _Conversion implements Conversion {
  const factory _Conversion(
      {required final String original,
      required final String converted}) = _$ConversionImpl;

  @override
  String get original;
  @override
  String get converted;

  /// Create a copy of Conversion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversionImplCopyWith<_$ConversionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Sentence {
  List<FuriganaPart> get japanese => throw _privateConstructorUsedError;
  String get english => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  SentenceCopyright? get copyright => throw _privateConstructorUsedError;
  List<Kanji>? get kanji => throw _privateConstructorUsedError;

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SentenceCopyWith<Sentence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentenceCopyWith<$Res> {
  factory $SentenceCopyWith(Sentence value, $Res Function(Sentence) then) =
      _$SentenceCopyWithImpl<$Res, Sentence>;
  @useResult
  $Res call(
      {List<FuriganaPart> japanese,
      String english,
      String? id,
      SentenceCopyright? copyright,
      List<Kanji>? kanji});

  $SentenceCopyrightCopyWith<$Res>? get copyright;
}

/// @nodoc
class _$SentenceCopyWithImpl<$Res, $Val extends Sentence>
    implements $SentenceCopyWith<$Res> {
  _$SentenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? japanese = null,
    Object? english = null,
    Object? id = freezed,
    Object? copyright = freezed,
    Object? kanji = freezed,
  }) {
    return _then(_value.copyWith(
      japanese: null == japanese
          ? _value.japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as List<FuriganaPart>,
      english: null == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as SentenceCopyright?,
      kanji: freezed == kanji
          ? _value.kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as List<Kanji>?,
    ) as $Val);
  }

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SentenceCopyrightCopyWith<$Res>? get copyright {
    if (_value.copyright == null) {
      return null;
    }

    return $SentenceCopyrightCopyWith<$Res>(_value.copyright!, (value) {
      return _then(_value.copyWith(copyright: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SentenceImplCopyWith<$Res>
    implements $SentenceCopyWith<$Res> {
  factory _$$SentenceImplCopyWith(
          _$SentenceImpl value, $Res Function(_$SentenceImpl) then) =
      __$$SentenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FuriganaPart> japanese,
      String english,
      String? id,
      SentenceCopyright? copyright,
      List<Kanji>? kanji});

  @override
  $SentenceCopyrightCopyWith<$Res>? get copyright;
}

/// @nodoc
class __$$SentenceImplCopyWithImpl<$Res>
    extends _$SentenceCopyWithImpl<$Res, _$SentenceImpl>
    implements _$$SentenceImplCopyWith<$Res> {
  __$$SentenceImplCopyWithImpl(
      _$SentenceImpl _value, $Res Function(_$SentenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? japanese = null,
    Object? english = null,
    Object? id = freezed,
    Object? copyright = freezed,
    Object? kanji = freezed,
  }) {
    return _then(_$SentenceImpl(
      japanese: null == japanese
          ? _value._japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as List<FuriganaPart>,
      english: null == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as SentenceCopyright?,
      kanji: freezed == kanji
          ? _value._kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as List<Kanji>?,
    ));
  }
}

/// @nodoc

class _$SentenceImpl extends _Sentence {
  const _$SentenceImpl(
      {required final List<FuriganaPart> japanese,
      required this.english,
      this.id,
      this.copyright,
      final List<Kanji>? kanji})
      : _japanese = japanese,
        _kanji = kanji,
        super._();

  final List<FuriganaPart> _japanese;
  @override
  List<FuriganaPart> get japanese {
    if (_japanese is EqualUnmodifiableListView) return _japanese;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_japanese);
  }

  @override
  final String english;
  @override
  final String? id;
  @override
  final SentenceCopyright? copyright;
  final List<Kanji>? _kanji;
  @override
  List<Kanji>? get kanji {
    final value = _kanji;
    if (value == null) return null;
    if (_kanji is EqualUnmodifiableListView) return _kanji;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Sentence(japanese: $japanese, english: $english, id: $id, copyright: $copyright, kanji: $kanji)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SentenceImpl &&
            const DeepCollectionEquality().equals(other._japanese, _japanese) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            const DeepCollectionEquality().equals(other._kanji, _kanji));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_japanese),
      english,
      id,
      copyright,
      const DeepCollectionEquality().hash(_kanji));

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SentenceImplCopyWith<_$SentenceImpl> get copyWith =>
      __$$SentenceImplCopyWithImpl<_$SentenceImpl>(this, _$identity);
}

abstract class _Sentence extends Sentence {
  const factory _Sentence(
      {required final List<FuriganaPart> japanese,
      required final String english,
      final String? id,
      final SentenceCopyright? copyright,
      final List<Kanji>? kanji}) = _$SentenceImpl;
  const _Sentence._() : super._();

  @override
  List<FuriganaPart> get japanese;
  @override
  String get english;
  @override
  String? get id;
  @override
  SentenceCopyright? get copyright;
  @override
  List<Kanji>? get kanji;

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SentenceImplCopyWith<_$SentenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SentenceCopyright {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Create a copy of SentenceCopyright
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SentenceCopyrightCopyWith<SentenceCopyright> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentenceCopyrightCopyWith<$Res> {
  factory $SentenceCopyrightCopyWith(
          SentenceCopyright value, $Res Function(SentenceCopyright) then) =
      _$SentenceCopyrightCopyWithImpl<$Res, SentenceCopyright>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$SentenceCopyrightCopyWithImpl<$Res, $Val extends SentenceCopyright>
    implements $SentenceCopyrightCopyWith<$Res> {
  _$SentenceCopyrightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SentenceCopyright
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SentenceCopyrightImplCopyWith<$Res>
    implements $SentenceCopyrightCopyWith<$Res> {
  factory _$$SentenceCopyrightImplCopyWith(_$SentenceCopyrightImpl value,
          $Res Function(_$SentenceCopyrightImpl) then) =
      __$$SentenceCopyrightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$SentenceCopyrightImplCopyWithImpl<$Res>
    extends _$SentenceCopyrightCopyWithImpl<$Res, _$SentenceCopyrightImpl>
    implements _$$SentenceCopyrightImplCopyWith<$Res> {
  __$$SentenceCopyrightImplCopyWithImpl(_$SentenceCopyrightImpl _value,
      $Res Function(_$SentenceCopyrightImpl) _then)
      : super(_value, _then);

  /// Create a copy of SentenceCopyright
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$SentenceCopyrightImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SentenceCopyrightImpl implements _SentenceCopyright {
  const _$SentenceCopyrightImpl({required this.name, required this.url});

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'SentenceCopyright(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SentenceCopyrightImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of SentenceCopyright
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SentenceCopyrightImplCopyWith<_$SentenceCopyrightImpl> get copyWith =>
      __$$SentenceCopyrightImplCopyWithImpl<_$SentenceCopyrightImpl>(
          this, _$identity);
}

abstract class _SentenceCopyright implements SentenceCopyright {
  const factory _SentenceCopyright(
      {required final String name,
      required final String url}) = _$SentenceCopyrightImpl;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of SentenceCopyright
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SentenceCopyrightImplCopyWith<_$SentenceCopyrightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Word {
  List<FuriganaPart> get word => throw _privateConstructorUsedError;
  List<Definition> get definitions => throw _privateConstructorUsedError;
  List<Collocation> get collocations => throw _privateConstructorUsedError;
  List<OtherForm> get otherForms => throw _privateConstructorUsedError;
  List<Note> get notes => throw _privateConstructorUsedError;
  List<int> get wanikaniLevels => throw _privateConstructorUsedError;
  bool get isCommon => throw _privateConstructorUsedError;
  bool get hasWikipedia => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get inflectionCode => throw _privateConstructorUsedError;
  String? get audioUrl => throw _privateConstructorUsedError;
  JLPTLevel? get jlptLevel => throw _privateConstructorUsedError;
  WordDetails? get details => throw _privateConstructorUsedError;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res, Word>;
  @useResult
  $Res call(
      {List<FuriganaPart> word,
      List<Definition> definitions,
      List<Collocation> collocations,
      List<OtherForm> otherForms,
      List<Note> notes,
      List<int> wanikaniLevels,
      bool isCommon,
      bool hasWikipedia,
      String? id,
      String? inflectionCode,
      String? audioUrl,
      JLPTLevel? jlptLevel,
      WordDetails? details});

  $WordDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class _$WordCopyWithImpl<$Res, $Val extends Word>
    implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? definitions = null,
    Object? collocations = null,
    Object? otherForms = null,
    Object? notes = null,
    Object? wanikaniLevels = null,
    Object? isCommon = null,
    Object? hasWikipedia = null,
    Object? id = freezed,
    Object? inflectionCode = freezed,
    Object? audioUrl = freezed,
    Object? jlptLevel = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as List<FuriganaPart>,
      definitions: null == definitions
          ? _value.definitions
          : definitions // ignore: cast_nullable_to_non_nullable
              as List<Definition>,
      collocations: null == collocations
          ? _value.collocations
          : collocations // ignore: cast_nullable_to_non_nullable
              as List<Collocation>,
      otherForms: null == otherForms
          ? _value.otherForms
          : otherForms // ignore: cast_nullable_to_non_nullable
              as List<OtherForm>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      wanikaniLevels: null == wanikaniLevels
          ? _value.wanikaniLevels
          : wanikaniLevels // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isCommon: null == isCommon
          ? _value.isCommon
          : isCommon // ignore: cast_nullable_to_non_nullable
              as bool,
      hasWikipedia: null == hasWikipedia
          ? _value.hasWikipedia
          : hasWikipedia // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      inflectionCode: freezed == inflectionCode
          ? _value.inflectionCode
          : inflectionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      jlptLevel: freezed == jlptLevel
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as JLPTLevel?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as WordDetails?,
    ) as $Val);
  }

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordDetailsCopyWith<$Res>? get details {
    if (_value.details == null) {
      return null;
    }

    return $WordDetailsCopyWith<$Res>(_value.details!, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WordImplCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$WordImplCopyWith(
          _$WordImpl value, $Res Function(_$WordImpl) then) =
      __$$WordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FuriganaPart> word,
      List<Definition> definitions,
      List<Collocation> collocations,
      List<OtherForm> otherForms,
      List<Note> notes,
      List<int> wanikaniLevels,
      bool isCommon,
      bool hasWikipedia,
      String? id,
      String? inflectionCode,
      String? audioUrl,
      JLPTLevel? jlptLevel,
      WordDetails? details});

  @override
  $WordDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class __$$WordImplCopyWithImpl<$Res>
    extends _$WordCopyWithImpl<$Res, _$WordImpl>
    implements _$$WordImplCopyWith<$Res> {
  __$$WordImplCopyWithImpl(_$WordImpl _value, $Res Function(_$WordImpl) _then)
      : super(_value, _then);

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? definitions = null,
    Object? collocations = null,
    Object? otherForms = null,
    Object? notes = null,
    Object? wanikaniLevels = null,
    Object? isCommon = null,
    Object? hasWikipedia = null,
    Object? id = freezed,
    Object? inflectionCode = freezed,
    Object? audioUrl = freezed,
    Object? jlptLevel = freezed,
    Object? details = freezed,
  }) {
    return _then(_$WordImpl(
      word: null == word
          ? _value._word
          : word // ignore: cast_nullable_to_non_nullable
              as List<FuriganaPart>,
      definitions: null == definitions
          ? _value._definitions
          : definitions // ignore: cast_nullable_to_non_nullable
              as List<Definition>,
      collocations: null == collocations
          ? _value._collocations
          : collocations // ignore: cast_nullable_to_non_nullable
              as List<Collocation>,
      otherForms: null == otherForms
          ? _value._otherForms
          : otherForms // ignore: cast_nullable_to_non_nullable
              as List<OtherForm>,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      wanikaniLevels: null == wanikaniLevels
          ? _value._wanikaniLevels
          : wanikaniLevels // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isCommon: null == isCommon
          ? _value.isCommon
          : isCommon // ignore: cast_nullable_to_non_nullable
              as bool,
      hasWikipedia: null == hasWikipedia
          ? _value.hasWikipedia
          : hasWikipedia // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      inflectionCode: freezed == inflectionCode
          ? _value.inflectionCode
          : inflectionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      jlptLevel: freezed == jlptLevel
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as JLPTLevel?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as WordDetails?,
    ));
  }
}

/// @nodoc

class _$WordImpl extends _Word {
  const _$WordImpl(
      {required final List<FuriganaPart> word,
      required final List<Definition> definitions,
      final List<Collocation> collocations = const [],
      final List<OtherForm> otherForms = const [],
      final List<Note> notes = const [],
      final List<int> wanikaniLevels = const [],
      this.isCommon = false,
      this.hasWikipedia = false,
      this.id,
      this.inflectionCode,
      this.audioUrl,
      this.jlptLevel,
      this.details})
      : _word = word,
        _definitions = definitions,
        _collocations = collocations,
        _otherForms = otherForms,
        _notes = notes,
        _wanikaniLevels = wanikaniLevels,
        super._();

  final List<FuriganaPart> _word;
  @override
  List<FuriganaPart> get word {
    if (_word is EqualUnmodifiableListView) return _word;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_word);
  }

  final List<Definition> _definitions;
  @override
  List<Definition> get definitions {
    if (_definitions is EqualUnmodifiableListView) return _definitions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_definitions);
  }

  final List<Collocation> _collocations;
  @override
  @JsonKey()
  List<Collocation> get collocations {
    if (_collocations is EqualUnmodifiableListView) return _collocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collocations);
  }

  final List<OtherForm> _otherForms;
  @override
  @JsonKey()
  List<OtherForm> get otherForms {
    if (_otherForms is EqualUnmodifiableListView) return _otherForms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherForms);
  }

  final List<Note> _notes;
  @override
  @JsonKey()
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  final List<int> _wanikaniLevels;
  @override
  @JsonKey()
  List<int> get wanikaniLevels {
    if (_wanikaniLevels is EqualUnmodifiableListView) return _wanikaniLevels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wanikaniLevels);
  }

  @override
  @JsonKey()
  final bool isCommon;
  @override
  @JsonKey()
  final bool hasWikipedia;
  @override
  final String? id;
  @override
  final String? inflectionCode;
  @override
  final String? audioUrl;
  @override
  final JLPTLevel? jlptLevel;
  @override
  final WordDetails? details;

  @override
  String toString() {
    return 'Word(word: $word, definitions: $definitions, collocations: $collocations, otherForms: $otherForms, notes: $notes, wanikaniLevels: $wanikaniLevels, isCommon: $isCommon, hasWikipedia: $hasWikipedia, id: $id, inflectionCode: $inflectionCode, audioUrl: $audioUrl, jlptLevel: $jlptLevel, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordImpl &&
            const DeepCollectionEquality().equals(other._word, _word) &&
            const DeepCollectionEquality()
                .equals(other._definitions, _definitions) &&
            const DeepCollectionEquality()
                .equals(other._collocations, _collocations) &&
            const DeepCollectionEquality()
                .equals(other._otherForms, _otherForms) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            const DeepCollectionEquality()
                .equals(other._wanikaniLevels, _wanikaniLevels) &&
            (identical(other.isCommon, isCommon) ||
                other.isCommon == isCommon) &&
            (identical(other.hasWikipedia, hasWikipedia) ||
                other.hasWikipedia == hasWikipedia) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inflectionCode, inflectionCode) ||
                other.inflectionCode == inflectionCode) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.jlptLevel, jlptLevel) ||
                other.jlptLevel == jlptLevel) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_word),
      const DeepCollectionEquality().hash(_definitions),
      const DeepCollectionEquality().hash(_collocations),
      const DeepCollectionEquality().hash(_otherForms),
      const DeepCollectionEquality().hash(_notes),
      const DeepCollectionEquality().hash(_wanikaniLevels),
      isCommon,
      hasWikipedia,
      id,
      inflectionCode,
      audioUrl,
      jlptLevel,
      details);

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordImplCopyWith<_$WordImpl> get copyWith =>
      __$$WordImplCopyWithImpl<_$WordImpl>(this, _$identity);
}

abstract class _Word extends Word {
  const factory _Word(
      {required final List<FuriganaPart> word,
      required final List<Definition> definitions,
      final List<Collocation> collocations,
      final List<OtherForm> otherForms,
      final List<Note> notes,
      final List<int> wanikaniLevels,
      final bool isCommon,
      final bool hasWikipedia,
      final String? id,
      final String? inflectionCode,
      final String? audioUrl,
      final JLPTLevel? jlptLevel,
      final WordDetails? details}) = _$WordImpl;
  const _Word._() : super._();

  @override
  List<FuriganaPart> get word;
  @override
  List<Definition> get definitions;
  @override
  List<Collocation> get collocations;
  @override
  List<OtherForm> get otherForms;
  @override
  List<Note> get notes;
  @override
  List<int> get wanikaniLevels;
  @override
  bool get isCommon;
  @override
  bool get hasWikipedia;
  @override
  String? get id;
  @override
  String? get inflectionCode;
  @override
  String? get audioUrl;
  @override
  JLPTLevel? get jlptLevel;
  @override
  WordDetails? get details;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordImplCopyWith<_$WordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WordDetails {
  List<Kanji> get kanji => throw _privateConstructorUsedError;
  WikipediaInfo? get wikipedia => throw _privateConstructorUsedError;

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordDetailsCopyWith<WordDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordDetailsCopyWith<$Res> {
  factory $WordDetailsCopyWith(
          WordDetails value, $Res Function(WordDetails) then) =
      _$WordDetailsCopyWithImpl<$Res, WordDetails>;
  @useResult
  $Res call({List<Kanji> kanji, WikipediaInfo? wikipedia});

  $WikipediaInfoCopyWith<$Res>? get wikipedia;
}

/// @nodoc
class _$WordDetailsCopyWithImpl<$Res, $Val extends WordDetails>
    implements $WordDetailsCopyWith<$Res> {
  _$WordDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kanji = null,
    Object? wikipedia = freezed,
  }) {
    return _then(_value.copyWith(
      kanji: null == kanji
          ? _value.kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as List<Kanji>,
      wikipedia: freezed == wikipedia
          ? _value.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as WikipediaInfo?,
    ) as $Val);
  }

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaInfoCopyWith<$Res>? get wikipedia {
    if (_value.wikipedia == null) {
      return null;
    }

    return $WikipediaInfoCopyWith<$Res>(_value.wikipedia!, (value) {
      return _then(_value.copyWith(wikipedia: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WordDetailsImplCopyWith<$Res>
    implements $WordDetailsCopyWith<$Res> {
  factory _$$WordDetailsImplCopyWith(
          _$WordDetailsImpl value, $Res Function(_$WordDetailsImpl) then) =
      __$$WordDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Kanji> kanji, WikipediaInfo? wikipedia});

  @override
  $WikipediaInfoCopyWith<$Res>? get wikipedia;
}

/// @nodoc
class __$$WordDetailsImplCopyWithImpl<$Res>
    extends _$WordDetailsCopyWithImpl<$Res, _$WordDetailsImpl>
    implements _$$WordDetailsImplCopyWith<$Res> {
  __$$WordDetailsImplCopyWithImpl(
      _$WordDetailsImpl _value, $Res Function(_$WordDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kanji = null,
    Object? wikipedia = freezed,
  }) {
    return _then(_$WordDetailsImpl(
      kanji: null == kanji
          ? _value._kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as List<Kanji>,
      wikipedia: freezed == wikipedia
          ? _value.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as WikipediaInfo?,
    ));
  }
}

/// @nodoc

class _$WordDetailsImpl implements _WordDetails {
  const _$WordDetailsImpl({final List<Kanji> kanji = const [], this.wikipedia})
      : _kanji = kanji;

  final List<Kanji> _kanji;
  @override
  @JsonKey()
  List<Kanji> get kanji {
    if (_kanji is EqualUnmodifiableListView) return _kanji;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kanji);
  }

  @override
  final WikipediaInfo? wikipedia;

  @override
  String toString() {
    return 'WordDetails(kanji: $kanji, wikipedia: $wikipedia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordDetailsImpl &&
            const DeepCollectionEquality().equals(other._kanji, _kanji) &&
            (identical(other.wikipedia, wikipedia) ||
                other.wikipedia == wikipedia));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_kanji), wikipedia);

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordDetailsImplCopyWith<_$WordDetailsImpl> get copyWith =>
      __$$WordDetailsImplCopyWithImpl<_$WordDetailsImpl>(this, _$identity);
}

abstract class _WordDetails implements WordDetails {
  const factory _WordDetails(
      {final List<Kanji> kanji,
      final WikipediaInfo? wikipedia}) = _$WordDetailsImpl;

  @override
  List<Kanji> get kanji;
  @override
  WikipediaInfo? get wikipedia;

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordDetailsImplCopyWith<_$WordDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Definition {
  List<String> get meanings => throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get seeAlso => throw _privateConstructorUsedError;
  Sentence? get exampleSentence => throw _privateConstructorUsedError;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefinitionCopyWith<Definition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefinitionCopyWith<$Res> {
  factory $DefinitionCopyWith(
          Definition value, $Res Function(Definition) then) =
      _$DefinitionCopyWithImpl<$Res, Definition>;
  @useResult
  $Res call(
      {List<String> meanings,
      List<String> types,
      List<String> tags,
      List<String> seeAlso,
      Sentence? exampleSentence});

  $SentenceCopyWith<$Res>? get exampleSentence;
}

/// @nodoc
class _$DefinitionCopyWithImpl<$Res, $Val extends Definition>
    implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meanings = null,
    Object? types = null,
    Object? tags = null,
    Object? seeAlso = null,
    Object? exampleSentence = freezed,
  }) {
    return _then(_value.copyWith(
      meanings: null == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seeAlso: null == seeAlso
          ? _value.seeAlso
          : seeAlso // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exampleSentence: freezed == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as Sentence?,
    ) as $Val);
  }

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SentenceCopyWith<$Res>? get exampleSentence {
    if (_value.exampleSentence == null) {
      return null;
    }

    return $SentenceCopyWith<$Res>(_value.exampleSentence!, (value) {
      return _then(_value.copyWith(exampleSentence: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DefinitionImplCopyWith<$Res>
    implements $DefinitionCopyWith<$Res> {
  factory _$$DefinitionImplCopyWith(
          _$DefinitionImpl value, $Res Function(_$DefinitionImpl) then) =
      __$$DefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> meanings,
      List<String> types,
      List<String> tags,
      List<String> seeAlso,
      Sentence? exampleSentence});

  @override
  $SentenceCopyWith<$Res>? get exampleSentence;
}

/// @nodoc
class __$$DefinitionImplCopyWithImpl<$Res>
    extends _$DefinitionCopyWithImpl<$Res, _$DefinitionImpl>
    implements _$$DefinitionImplCopyWith<$Res> {
  __$$DefinitionImplCopyWithImpl(
      _$DefinitionImpl _value, $Res Function(_$DefinitionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meanings = null,
    Object? types = null,
    Object? tags = null,
    Object? seeAlso = null,
    Object? exampleSentence = freezed,
  }) {
    return _then(_$DefinitionImpl(
      meanings: null == meanings
          ? _value._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seeAlso: null == seeAlso
          ? _value._seeAlso
          : seeAlso // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exampleSentence: freezed == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as Sentence?,
    ));
  }
}

/// @nodoc

class _$DefinitionImpl implements _Definition {
  const _$DefinitionImpl(
      {required final List<String> meanings,
      final List<String> types = const [],
      final List<String> tags = const [],
      final List<String> seeAlso = const [],
      this.exampleSentence})
      : _meanings = meanings,
        _types = types,
        _tags = tags,
        _seeAlso = seeAlso;

  final List<String> _meanings;
  @override
  List<String> get meanings {
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanings);
  }

  final List<String> _types;
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _seeAlso;
  @override
  @JsonKey()
  List<String> get seeAlso {
    if (_seeAlso is EqualUnmodifiableListView) return _seeAlso;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seeAlso);
  }

  @override
  final Sentence? exampleSentence;

  @override
  String toString() {
    return 'Definition(meanings: $meanings, types: $types, tags: $tags, seeAlso: $seeAlso, exampleSentence: $exampleSentence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefinitionImpl &&
            const DeepCollectionEquality().equals(other._meanings, _meanings) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._seeAlso, _seeAlso) &&
            (identical(other.exampleSentence, exampleSentence) ||
                other.exampleSentence == exampleSentence));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_meanings),
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_seeAlso),
      exampleSentence);

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      __$$DefinitionImplCopyWithImpl<_$DefinitionImpl>(this, _$identity);
}

abstract class _Definition implements Definition {
  const factory _Definition(
      {required final List<String> meanings,
      final List<String> types,
      final List<String> tags,
      final List<String> seeAlso,
      final Sentence? exampleSentence}) = _$DefinitionImpl;

  @override
  List<String> get meanings;
  @override
  List<String> get types;
  @override
  List<String> get tags;
  @override
  List<String> get seeAlso;
  @override
  Sentence? get exampleSentence;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WikipediaInfo {
  String get title => throw _privateConstructorUsedError;
  String? get textAbstract => throw _privateConstructorUsedError;
  WikipediaPage? get wikipediaEnglish => throw _privateConstructorUsedError;
  WikipediaPage? get wikipediaJapanese => throw _privateConstructorUsedError;
  WikipediaPage? get dbpedia => throw _privateConstructorUsedError;

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WikipediaInfoCopyWith<WikipediaInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WikipediaInfoCopyWith<$Res> {
  factory $WikipediaInfoCopyWith(
          WikipediaInfo value, $Res Function(WikipediaInfo) then) =
      _$WikipediaInfoCopyWithImpl<$Res, WikipediaInfo>;
  @useResult
  $Res call(
      {String title,
      String? textAbstract,
      WikipediaPage? wikipediaEnglish,
      WikipediaPage? wikipediaJapanese,
      WikipediaPage? dbpedia});

  $WikipediaPageCopyWith<$Res>? get wikipediaEnglish;
  $WikipediaPageCopyWith<$Res>? get wikipediaJapanese;
  $WikipediaPageCopyWith<$Res>? get dbpedia;
}

/// @nodoc
class _$WikipediaInfoCopyWithImpl<$Res, $Val extends WikipediaInfo>
    implements $WikipediaInfoCopyWith<$Res> {
  _$WikipediaInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? textAbstract = freezed,
    Object? wikipediaEnglish = freezed,
    Object? wikipediaJapanese = freezed,
    Object? dbpedia = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      textAbstract: freezed == textAbstract
          ? _value.textAbstract
          : textAbstract // ignore: cast_nullable_to_non_nullable
              as String?,
      wikipediaEnglish: freezed == wikipediaEnglish
          ? _value.wikipediaEnglish
          : wikipediaEnglish // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
      wikipediaJapanese: freezed == wikipediaJapanese
          ? _value.wikipediaJapanese
          : wikipediaJapanese // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
      dbpedia: freezed == dbpedia
          ? _value.dbpedia
          : dbpedia // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
    ) as $Val);
  }

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaPageCopyWith<$Res>? get wikipediaEnglish {
    if (_value.wikipediaEnglish == null) {
      return null;
    }

    return $WikipediaPageCopyWith<$Res>(_value.wikipediaEnglish!, (value) {
      return _then(_value.copyWith(wikipediaEnglish: value) as $Val);
    });
  }

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaPageCopyWith<$Res>? get wikipediaJapanese {
    if (_value.wikipediaJapanese == null) {
      return null;
    }

    return $WikipediaPageCopyWith<$Res>(_value.wikipediaJapanese!, (value) {
      return _then(_value.copyWith(wikipediaJapanese: value) as $Val);
    });
  }

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaPageCopyWith<$Res>? get dbpedia {
    if (_value.dbpedia == null) {
      return null;
    }

    return $WikipediaPageCopyWith<$Res>(_value.dbpedia!, (value) {
      return _then(_value.copyWith(dbpedia: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WikipediaInfoImplCopyWith<$Res>
    implements $WikipediaInfoCopyWith<$Res> {
  factory _$$WikipediaInfoImplCopyWith(
          _$WikipediaInfoImpl value, $Res Function(_$WikipediaInfoImpl) then) =
      __$$WikipediaInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? textAbstract,
      WikipediaPage? wikipediaEnglish,
      WikipediaPage? wikipediaJapanese,
      WikipediaPage? dbpedia});

  @override
  $WikipediaPageCopyWith<$Res>? get wikipediaEnglish;
  @override
  $WikipediaPageCopyWith<$Res>? get wikipediaJapanese;
  @override
  $WikipediaPageCopyWith<$Res>? get dbpedia;
}

/// @nodoc
class __$$WikipediaInfoImplCopyWithImpl<$Res>
    extends _$WikipediaInfoCopyWithImpl<$Res, _$WikipediaInfoImpl>
    implements _$$WikipediaInfoImplCopyWith<$Res> {
  __$$WikipediaInfoImplCopyWithImpl(
      _$WikipediaInfoImpl _value, $Res Function(_$WikipediaInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? textAbstract = freezed,
    Object? wikipediaEnglish = freezed,
    Object? wikipediaJapanese = freezed,
    Object? dbpedia = freezed,
  }) {
    return _then(_$WikipediaInfoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      textAbstract: freezed == textAbstract
          ? _value.textAbstract
          : textAbstract // ignore: cast_nullable_to_non_nullable
              as String?,
      wikipediaEnglish: freezed == wikipediaEnglish
          ? _value.wikipediaEnglish
          : wikipediaEnglish // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
      wikipediaJapanese: freezed == wikipediaJapanese
          ? _value.wikipediaJapanese
          : wikipediaJapanese // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
      dbpedia: freezed == dbpedia
          ? _value.dbpedia
          : dbpedia // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
    ));
  }
}

/// @nodoc

class _$WikipediaInfoImpl implements _WikipediaInfo {
  const _$WikipediaInfoImpl(
      {required this.title,
      this.textAbstract,
      this.wikipediaEnglish,
      this.wikipediaJapanese,
      this.dbpedia});

  @override
  final String title;
  @override
  final String? textAbstract;
  @override
  final WikipediaPage? wikipediaEnglish;
  @override
  final WikipediaPage? wikipediaJapanese;
  @override
  final WikipediaPage? dbpedia;

  @override
  String toString() {
    return 'WikipediaInfo(title: $title, textAbstract: $textAbstract, wikipediaEnglish: $wikipediaEnglish, wikipediaJapanese: $wikipediaJapanese, dbpedia: $dbpedia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WikipediaInfoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.textAbstract, textAbstract) ||
                other.textAbstract == textAbstract) &&
            (identical(other.wikipediaEnglish, wikipediaEnglish) ||
                other.wikipediaEnglish == wikipediaEnglish) &&
            (identical(other.wikipediaJapanese, wikipediaJapanese) ||
                other.wikipediaJapanese == wikipediaJapanese) &&
            (identical(other.dbpedia, dbpedia) || other.dbpedia == dbpedia));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, textAbstract,
      wikipediaEnglish, wikipediaJapanese, dbpedia);

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WikipediaInfoImplCopyWith<_$WikipediaInfoImpl> get copyWith =>
      __$$WikipediaInfoImplCopyWithImpl<_$WikipediaInfoImpl>(this, _$identity);
}

abstract class _WikipediaInfo implements WikipediaInfo {
  const factory _WikipediaInfo(
      {required final String title,
      final String? textAbstract,
      final WikipediaPage? wikipediaEnglish,
      final WikipediaPage? wikipediaJapanese,
      final WikipediaPage? dbpedia}) = _$WikipediaInfoImpl;

  @override
  String get title;
  @override
  String? get textAbstract;
  @override
  WikipediaPage? get wikipediaEnglish;
  @override
  WikipediaPage? get wikipediaJapanese;
  @override
  WikipediaPage? get dbpedia;

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WikipediaInfoImplCopyWith<_$WikipediaInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WikipediaPage {
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Create a copy of WikipediaPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WikipediaPageCopyWith<WikipediaPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WikipediaPageCopyWith<$Res> {
  factory $WikipediaPageCopyWith(
          WikipediaPage value, $Res Function(WikipediaPage) then) =
      _$WikipediaPageCopyWithImpl<$Res, WikipediaPage>;
  @useResult
  $Res call({String title, String url});
}

/// @nodoc
class _$WikipediaPageCopyWithImpl<$Res, $Val extends WikipediaPage>
    implements $WikipediaPageCopyWith<$Res> {
  _$WikipediaPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WikipediaPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WikipediaPageImplCopyWith<$Res>
    implements $WikipediaPageCopyWith<$Res> {
  factory _$$WikipediaPageImplCopyWith(
          _$WikipediaPageImpl value, $Res Function(_$WikipediaPageImpl) then) =
      __$$WikipediaPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String url});
}

/// @nodoc
class __$$WikipediaPageImplCopyWithImpl<$Res>
    extends _$WikipediaPageCopyWithImpl<$Res, _$WikipediaPageImpl>
    implements _$$WikipediaPageImplCopyWith<$Res> {
  __$$WikipediaPageImplCopyWithImpl(
      _$WikipediaPageImpl _value, $Res Function(_$WikipediaPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of WikipediaPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_$WikipediaPageImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WikipediaPageImpl implements _WikipediaPage {
  const _$WikipediaPageImpl({required this.title, required this.url});

  @override
  final String title;
  @override
  final String url;

  @override
  String toString() {
    return 'WikipediaPage(title: $title, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WikipediaPageImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, url);

  /// Create a copy of WikipediaPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WikipediaPageImplCopyWith<_$WikipediaPageImpl> get copyWith =>
      __$$WikipediaPageImplCopyWithImpl<_$WikipediaPageImpl>(this, _$identity);
}

abstract class _WikipediaPage implements WikipediaPage {
  const factory _WikipediaPage(
      {required final String title,
      required final String url}) = _$WikipediaPageImpl;

  @override
  String get title;
  @override
  String get url;

  /// Create a copy of WikipediaPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WikipediaPageImplCopyWith<_$WikipediaPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OtherForm {
  String get form => throw _privateConstructorUsedError;
  String get reading => throw _privateConstructorUsedError;

  /// Create a copy of OtherForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtherFormCopyWith<OtherForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherFormCopyWith<$Res> {
  factory $OtherFormCopyWith(OtherForm value, $Res Function(OtherForm) then) =
      _$OtherFormCopyWithImpl<$Res, OtherForm>;
  @useResult
  $Res call({String form, String reading});
}

/// @nodoc
class _$OtherFormCopyWithImpl<$Res, $Val extends OtherForm>
    implements $OtherFormCopyWith<$Res> {
  _$OtherFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtherForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? reading = null,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtherFormImplCopyWith<$Res>
    implements $OtherFormCopyWith<$Res> {
  factory _$$OtherFormImplCopyWith(
          _$OtherFormImpl value, $Res Function(_$OtherFormImpl) then) =
      __$$OtherFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String form, String reading});
}

/// @nodoc
class __$$OtherFormImplCopyWithImpl<$Res>
    extends _$OtherFormCopyWithImpl<$Res, _$OtherFormImpl>
    implements _$$OtherFormImplCopyWith<$Res> {
  __$$OtherFormImplCopyWithImpl(
      _$OtherFormImpl _value, $Res Function(_$OtherFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtherForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? reading = null,
  }) {
    return _then(_$OtherFormImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtherFormImpl implements _OtherForm {
  const _$OtherFormImpl({required this.form, required this.reading});

  @override
  final String form;
  @override
  final String reading;

  @override
  String toString() {
    return 'OtherForm(form: $form, reading: $reading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherFormImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.reading, reading) || other.reading == reading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, reading);

  /// Create a copy of OtherForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherFormImplCopyWith<_$OtherFormImpl> get copyWith =>
      __$$OtherFormImplCopyWithImpl<_$OtherFormImpl>(this, _$identity);
}

abstract class _OtherForm implements OtherForm {
  const factory _OtherForm(
      {required final String form,
      required final String reading}) = _$OtherFormImpl;

  @override
  String get form;
  @override
  String get reading;

  /// Create a copy of OtherForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtherFormImplCopyWith<_$OtherFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Collocation {
  String get word => throw _privateConstructorUsedError;
  String get meaning => throw _privateConstructorUsedError;

  /// Create a copy of Collocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollocationCopyWith<Collocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollocationCopyWith<$Res> {
  factory $CollocationCopyWith(
          Collocation value, $Res Function(Collocation) then) =
      _$CollocationCopyWithImpl<$Res, Collocation>;
  @useResult
  $Res call({String word, String meaning});
}

/// @nodoc
class _$CollocationCopyWithImpl<$Res, $Val extends Collocation>
    implements $CollocationCopyWith<$Res> {
  _$CollocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Collocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? meaning = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollocationImplCopyWith<$Res>
    implements $CollocationCopyWith<$Res> {
  factory _$$CollocationImplCopyWith(
          _$CollocationImpl value, $Res Function(_$CollocationImpl) then) =
      __$$CollocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String word, String meaning});
}

/// @nodoc
class __$$CollocationImplCopyWithImpl<$Res>
    extends _$CollocationCopyWithImpl<$Res, _$CollocationImpl>
    implements _$$CollocationImplCopyWith<$Res> {
  __$$CollocationImplCopyWithImpl(
      _$CollocationImpl _value, $Res Function(_$CollocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Collocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? meaning = null,
  }) {
    return _then(_$CollocationImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CollocationImpl implements _Collocation {
  const _$CollocationImpl({required this.word, required this.meaning});

  @override
  final String word;
  @override
  final String meaning;

  @override
  String toString() {
    return 'Collocation(word: $word, meaning: $meaning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollocationImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.meaning, meaning) || other.meaning == meaning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word, meaning);

  /// Create a copy of Collocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollocationImplCopyWith<_$CollocationImpl> get copyWith =>
      __$$CollocationImplCopyWithImpl<_$CollocationImpl>(this, _$identity);
}

abstract class _Collocation implements Collocation {
  const factory _Collocation(
      {required final String word,
      required final String meaning}) = _$CollocationImpl;

  @override
  String get word;
  @override
  String get meaning;

  /// Create a copy of Collocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollocationImplCopyWith<_$CollocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Note {
  String get form => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res, Note>;
  @useResult
  $Res call({String form, String note});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res, $Val extends Note>
    implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteImplCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$NoteImplCopyWith(
          _$NoteImpl value, $Res Function(_$NoteImpl) then) =
      __$$NoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String form, String note});
}

/// @nodoc
class __$$NoteImplCopyWithImpl<$Res>
    extends _$NoteCopyWithImpl<$Res, _$NoteImpl>
    implements _$$NoteImplCopyWith<$Res> {
  __$$NoteImplCopyWithImpl(_$NoteImpl _value, $Res Function(_$NoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? note = null,
  }) {
    return _then(_$NoteImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoteImpl implements _Note {
  const _$NoteImpl({required this.form, required this.note});

  @override
  final String form;
  @override
  final String note;

  @override
  String toString() {
    return 'Note(form: $form, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, note);

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      __$$NoteImplCopyWithImpl<_$NoteImpl>(this, _$identity);
}

abstract class _Note implements Note {
  const factory _Note(
      {required final String form, required final String note}) = _$NoteImpl;

  @override
  String get form;
  @override
  String get note;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
