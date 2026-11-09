// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FuriganaPart {
  String get text;
  String? get furigana;

  /// Create a copy of FuriganaPart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FuriganaPartCopyWith<FuriganaPart> get copyWith =>
      _$FuriganaPartCopyWithImpl<FuriganaPart>(
          this as FuriganaPart, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as FuriganaPart;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FuriganaPart &&
            (identical(other.text, _this.text) || other.text == _this.text) &&
            (identical(other.furigana, _this.furigana) ||
                other.furigana == _this.furigana));
  }

  @override
  int get hashCode {
    final _this = this as FuriganaPart;
    return Object.hash(runtimeType, _this.text, _this.furigana);
  }
}

/// @nodoc
abstract mixin class $FuriganaPartCopyWith<$Res> {
  factory $FuriganaPartCopyWith(
          FuriganaPart value, $Res Function(FuriganaPart) _then) =
      _$FuriganaPartCopyWithImpl;
  @useResult
  $Res call({String text, String? furigana});
}

/// @nodoc
class _$FuriganaPartCopyWithImpl<$Res> implements $FuriganaPartCopyWith<$Res> {
  _$FuriganaPartCopyWithImpl(this._self, this._then);

  final FuriganaPart _self;
  final $Res Function(FuriganaPart) _then;

  /// Create a copy of FuriganaPart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? furigana = freezed,
  }) {
    return _then(FuriganaPart(
      null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == furigana
          ? _self.furigana
          : furigana // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FuriganaPart].
extension FuriganaPartPatterns on FuriganaPart {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FuriganaPart value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FuriganaPart() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FuriganaPart value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FuriganaPart():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FuriganaPart value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FuriganaPart() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String text, String? furigana)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FuriganaPart() when $default != null:
        return $default(_that.text, _that.furigana);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String text, String? furigana) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FuriganaPart():
        return $default(_that.text, _that.furigana);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String text, String? furigana)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FuriganaPart() when $default != null:
        return $default(_that.text, _that.furigana);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FuriganaPart extends FuriganaPart {
  const _FuriganaPart(this.text, [this.furigana]) : super._();

  @override
  final String text;
  @override
  final String? furigana;

  /// Create a copy of FuriganaPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FuriganaPartCopyWith<_FuriganaPart> get copyWith =>
      __$FuriganaPartCopyWithImpl<_FuriganaPart>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FuriganaPart &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.furigana, furigana) ||
                other.furigana == furigana));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, text, furigana);
  }
}

/// @nodoc
abstract mixin class _$FuriganaPartCopyWith<$Res>
    implements $FuriganaPartCopyWith<$Res> {
  factory _$FuriganaPartCopyWith(
          _FuriganaPart value, $Res Function(_FuriganaPart) _then) =
      __$FuriganaPartCopyWithImpl;
  @override
  @useResult
  $Res call({String text, String? furigana});
}

/// @nodoc
class __$FuriganaPartCopyWithImpl<$Res>
    implements _$FuriganaPartCopyWith<$Res> {
  __$FuriganaPartCopyWithImpl(this._self, this._then);

  final _FuriganaPart _self;
  final $Res Function(_FuriganaPart) _then;

  /// Create a copy of FuriganaPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? furigana = freezed,
  }) {
    return _then(_FuriganaPart(
      null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == furigana
          ? _self.furigana
          : furigana // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Kanji {
  String get kanji;
  int get strokeCount;
  List<String> get meanings;
  List<String> get kunReadings;
  List<String> get onReadings;
  KanjiType? get type;
  JLPTLevel? get jlptLevel;
  KanjiDetails? get details;

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KanjiCopyWith<Kanji> get copyWith =>
      _$KanjiCopyWithImpl<Kanji>(this as Kanji, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Kanji;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Kanji &&
            (identical(other.kanji, _this.kanji) ||
                other.kanji == _this.kanji) &&
            (identical(other.strokeCount, _this.strokeCount) ||
                other.strokeCount == _this.strokeCount) &&
            const DeepCollectionEquality()
                .equals(other.meanings, _this.meanings) &&
            const DeepCollectionEquality()
                .equals(other.kunReadings, _this.kunReadings) &&
            const DeepCollectionEquality()
                .equals(other.onReadings, _this.onReadings) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.jlptLevel, _this.jlptLevel) ||
                other.jlptLevel == _this.jlptLevel) &&
            (identical(other.details, _this.details) ||
                other.details == _this.details));
  }

  @override
  int get hashCode {
    final _this = this as Kanji;
    return Object.hash(
        runtimeType,
        _this.kanji,
        _this.strokeCount,
        const DeepCollectionEquality().hash(_this.meanings),
        const DeepCollectionEquality().hash(_this.kunReadings),
        const DeepCollectionEquality().hash(_this.onReadings),
        _this.type,
        _this.jlptLevel,
        _this.details);
  }

  @override
  String toString() {
    final _this = this as Kanji;
    return 'Kanji(kanji: ${_this.kanji}, strokeCount: ${_this.strokeCount}, meanings: ${_this.meanings}, kunReadings: ${_this.kunReadings}, onReadings: ${_this.onReadings}, type: ${_this.type}, jlptLevel: ${_this.jlptLevel}, details: ${_this.details})';
  }
}

/// @nodoc
abstract mixin class $KanjiCopyWith<$Res> {
  factory $KanjiCopyWith(Kanji value, $Res Function(Kanji) _then) =
      _$KanjiCopyWithImpl;
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
class _$KanjiCopyWithImpl<$Res> implements $KanjiCopyWith<$Res> {
  _$KanjiCopyWithImpl(this._self, this._then);

  final Kanji _self;
  final $Res Function(Kanji) _then;

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
    return _then(Kanji(
      kanji: null == kanji
          ? _self.kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as String,
      strokeCount: null == strokeCount
          ? _self.strokeCount
          : strokeCount // ignore: cast_nullable_to_non_nullable
              as int,
      meanings: null == meanings
          ? _self.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      kunReadings: null == kunReadings
          ? _self.kunReadings
          : kunReadings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onReadings: null == onReadings
          ? _self.onReadings
          : onReadings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as KanjiType?,
      jlptLevel: freezed == jlptLevel
          ? _self.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as JLPTLevel?,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as KanjiDetails?,
    ));
  }

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KanjiDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
      return null;
    }

    return $KanjiDetailsCopyWith<$Res>(_self.details!, (value) {
      return _then(_self.copyWith(details: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Kanji].
extension KanjiPatterns on Kanji {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Kanji value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Kanji() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Kanji value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Kanji():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Kanji value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Kanji() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String kanji,
            int strokeCount,
            List<String> meanings,
            List<String> kunReadings,
            List<String> onReadings,
            KanjiType? type,
            JLPTLevel? jlptLevel,
            KanjiDetails? details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Kanji() when $default != null:
        return $default(
            _that.kanji,
            _that.strokeCount,
            _that.meanings,
            _that.kunReadings,
            _that.onReadings,
            _that.type,
            _that.jlptLevel,
            _that.details);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String kanji,
            int strokeCount,
            List<String> meanings,
            List<String> kunReadings,
            List<String> onReadings,
            KanjiType? type,
            JLPTLevel? jlptLevel,
            KanjiDetails? details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Kanji():
        return $default(
            _that.kanji,
            _that.strokeCount,
            _that.meanings,
            _that.kunReadings,
            _that.onReadings,
            _that.type,
            _that.jlptLevel,
            _that.details);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String kanji,
            int strokeCount,
            List<String> meanings,
            List<String> kunReadings,
            List<String> onReadings,
            KanjiType? type,
            JLPTLevel? jlptLevel,
            KanjiDetails? details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Kanji() when $default != null:
        return $default(
            _that.kanji,
            _that.strokeCount,
            _that.meanings,
            _that.kunReadings,
            _that.onReadings,
            _that.type,
            _that.jlptLevel,
            _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Kanji extends Kanji {
  const _Kanji(
      {required this.kanji,
      required this.strokeCount,
      required List<String> meanings,
      required List<String> kunReadings,
      required List<String> onReadings,
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

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KanjiCopyWith<_Kanji> get copyWith =>
      __$KanjiCopyWithImpl<_Kanji>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Kanji &&
            (identical(other.kanji, kanji) || other.kanji == kanji) &&
            (identical(other.strokeCount, strokeCount) ||
                other.strokeCount == strokeCount) &&
            const DeepCollectionEquality().equals(other.meanings, _meanings) &&
            const DeepCollectionEquality()
                .equals(other.kunReadings, _kunReadings) &&
            const DeepCollectionEquality()
                .equals(other.onReadings, _onReadings) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.jlptLevel, jlptLevel) ||
                other.jlptLevel == jlptLevel) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        kanji,
        strokeCount,
        const DeepCollectionEquality().hash(_meanings),
        const DeepCollectionEquality().hash(_kunReadings),
        const DeepCollectionEquality().hash(_onReadings),
        type,
        jlptLevel,
        details);
  }

  @override
  String toString() {
    return 'Kanji(kanji: $kanji, strokeCount: $strokeCount, meanings: $meanings, kunReadings: $kunReadings, onReadings: $onReadings, type: $type, jlptLevel: $jlptLevel, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$KanjiCopyWith<$Res> implements $KanjiCopyWith<$Res> {
  factory _$KanjiCopyWith(_Kanji value, $Res Function(_Kanji) _then) =
      __$KanjiCopyWithImpl;
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
class __$KanjiCopyWithImpl<$Res> implements _$KanjiCopyWith<$Res> {
  __$KanjiCopyWithImpl(this._self, this._then);

  final _Kanji _self;
  final $Res Function(_Kanji) _then;

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Kanji(
      kanji: null == kanji
          ? _self.kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as String,
      strokeCount: null == strokeCount
          ? _self.strokeCount
          : strokeCount // ignore: cast_nullable_to_non_nullable
              as int,
      meanings: null == meanings
          ? _self._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      kunReadings: null == kunReadings
          ? _self._kunReadings
          : kunReadings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onReadings: null == onReadings
          ? _self._onReadings
          : onReadings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as KanjiType?,
      jlptLevel: freezed == jlptLevel
          ? _self.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as JLPTLevel?,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as KanjiDetails?,
    ));
  }

  /// Create a copy of Kanji
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KanjiDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
      return null;
    }

    return $KanjiDetailsCopyWith<$Res>(_self.details!, (value) {
      return _then(_self.copyWith(details: value));
    });
  }
}

/// @nodoc
mixin _$KanjiDetails {
  List<String> get parts;
  List<String> get variants;
  List<Compound> get onCompounds;
  List<Compound> get kunCompounds;
  Radical? get radical;
  int? get frequency;

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KanjiDetailsCopyWith<KanjiDetails> get copyWith =>
      _$KanjiDetailsCopyWithImpl<KanjiDetails>(
          this as KanjiDetails, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as KanjiDetails;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KanjiDetails &&
            const DeepCollectionEquality().equals(other.parts, _this.parts) &&
            const DeepCollectionEquality()
                .equals(other.variants, _this.variants) &&
            const DeepCollectionEquality()
                .equals(other.onCompounds, _this.onCompounds) &&
            const DeepCollectionEquality()
                .equals(other.kunCompounds, _this.kunCompounds) &&
            (identical(other.radical, _this.radical) ||
                other.radical == _this.radical) &&
            (identical(other.frequency, _this.frequency) ||
                other.frequency == _this.frequency));
  }

  @override
  int get hashCode {
    final _this = this as KanjiDetails;
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_this.parts),
        const DeepCollectionEquality().hash(_this.variants),
        const DeepCollectionEquality().hash(_this.onCompounds),
        const DeepCollectionEquality().hash(_this.kunCompounds),
        _this.radical,
        _this.frequency);
  }

  @override
  String toString() {
    final _this = this as KanjiDetails;
    return 'KanjiDetails(parts: ${_this.parts}, variants: ${_this.variants}, onCompounds: ${_this.onCompounds}, kunCompounds: ${_this.kunCompounds}, radical: ${_this.radical}, frequency: ${_this.frequency})';
  }
}

/// @nodoc
abstract mixin class $KanjiDetailsCopyWith<$Res> {
  factory $KanjiDetailsCopyWith(
          KanjiDetails value, $Res Function(KanjiDetails) _then) =
      _$KanjiDetailsCopyWithImpl;
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
class _$KanjiDetailsCopyWithImpl<$Res> implements $KanjiDetailsCopyWith<$Res> {
  _$KanjiDetailsCopyWithImpl(this._self, this._then);

  final KanjiDetails _self;
  final $Res Function(KanjiDetails) _then;

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
    return _then(KanjiDetails(
      parts: null == parts
          ? _self.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variants: null == variants
          ? _self.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onCompounds: null == onCompounds
          ? _self.onCompounds
          : onCompounds // ignore: cast_nullable_to_non_nullable
              as List<Compound>,
      kunCompounds: null == kunCompounds
          ? _self.kunCompounds
          : kunCompounds // ignore: cast_nullable_to_non_nullable
              as List<Compound>,
      radical: freezed == radical
          ? _self.radical
          : radical // ignore: cast_nullable_to_non_nullable
              as Radical?,
      frequency: freezed == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RadicalCopyWith<$Res>? get radical {
    if (_self.radical == null) {
      return null;
    }

    return $RadicalCopyWith<$Res>(_self.radical!, (value) {
      return _then(_self.copyWith(radical: value));
    });
  }
}

/// Adds pattern-matching-related methods to [KanjiDetails].
extension KanjiDetailsPatterns on KanjiDetails {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_KanjiDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KanjiDetails() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_KanjiDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KanjiDetails():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_KanjiDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KanjiDetails() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<String> parts,
            List<String> variants,
            List<Compound> onCompounds,
            List<Compound> kunCompounds,
            Radical? radical,
            int? frequency)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KanjiDetails() when $default != null:
        return $default(_that.parts, _that.variants, _that.onCompounds,
            _that.kunCompounds, _that.radical, _that.frequency);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<String> parts,
            List<String> variants,
            List<Compound> onCompounds,
            List<Compound> kunCompounds,
            Radical? radical,
            int? frequency)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KanjiDetails():
        return $default(_that.parts, _that.variants, _that.onCompounds,
            _that.kunCompounds, _that.radical, _that.frequency);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<String> parts,
            List<String> variants,
            List<Compound> onCompounds,
            List<Compound> kunCompounds,
            Radical? radical,
            int? frequency)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KanjiDetails() when $default != null:
        return $default(_that.parts, _that.variants, _that.onCompounds,
            _that.kunCompounds, _that.radical, _that.frequency);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _KanjiDetails implements KanjiDetails {
  const _KanjiDetails(
      {required List<String> parts,
      required List<String> variants,
      required List<Compound> onCompounds,
      required List<Compound> kunCompounds,
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

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KanjiDetailsCopyWith<_KanjiDetails> get copyWith =>
      __$KanjiDetailsCopyWithImpl<_KanjiDetails>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KanjiDetails &&
            const DeepCollectionEquality().equals(other.parts, _parts) &&
            const DeepCollectionEquality().equals(other.variants, _variants) &&
            const DeepCollectionEquality()
                .equals(other.onCompounds, _onCompounds) &&
            const DeepCollectionEquality()
                .equals(other.kunCompounds, _kunCompounds) &&
            (identical(other.radical, radical) || other.radical == radical) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_parts),
        const DeepCollectionEquality().hash(_variants),
        const DeepCollectionEquality().hash(_onCompounds),
        const DeepCollectionEquality().hash(_kunCompounds),
        radical,
        frequency);
  }

  @override
  String toString() {
    return 'KanjiDetails(parts: $parts, variants: $variants, onCompounds: $onCompounds, kunCompounds: $kunCompounds, radical: $radical, frequency: $frequency)';
  }
}

/// @nodoc
abstract mixin class _$KanjiDetailsCopyWith<$Res>
    implements $KanjiDetailsCopyWith<$Res> {
  factory _$KanjiDetailsCopyWith(
          _KanjiDetails value, $Res Function(_KanjiDetails) _then) =
      __$KanjiDetailsCopyWithImpl;
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
class __$KanjiDetailsCopyWithImpl<$Res>
    implements _$KanjiDetailsCopyWith<$Res> {
  __$KanjiDetailsCopyWithImpl(this._self, this._then);

  final _KanjiDetails _self;
  final $Res Function(_KanjiDetails) _then;

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? parts = null,
    Object? variants = null,
    Object? onCompounds = null,
    Object? kunCompounds = null,
    Object? radical = freezed,
    Object? frequency = freezed,
  }) {
    return _then(_KanjiDetails(
      parts: null == parts
          ? _self._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variants: null == variants
          ? _self._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onCompounds: null == onCompounds
          ? _self._onCompounds
          : onCompounds // ignore: cast_nullable_to_non_nullable
              as List<Compound>,
      kunCompounds: null == kunCompounds
          ? _self._kunCompounds
          : kunCompounds // ignore: cast_nullable_to_non_nullable
              as List<Compound>,
      radical: freezed == radical
          ? _self.radical
          : radical // ignore: cast_nullable_to_non_nullable
              as Radical?,
      frequency: freezed == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of KanjiDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RadicalCopyWith<$Res>? get radical {
    if (_self.radical == null) {
      return null;
    }

    return $RadicalCopyWith<$Res>(_self.radical!, (value) {
      return _then(_self.copyWith(radical: value));
    });
  }
}

/// @nodoc
mixin _$Radical {
  String get character;
  List<String> get meanings;

  /// Create a copy of Radical
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RadicalCopyWith<Radical> get copyWith =>
      _$RadicalCopyWithImpl<Radical>(this as Radical, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Radical;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Radical &&
            (identical(other.character, _this.character) ||
                other.character == _this.character) &&
            const DeepCollectionEquality()
                .equals(other.meanings, _this.meanings));
  }

  @override
  int get hashCode {
    final _this = this as Radical;
    return Object.hash(runtimeType, _this.character,
        const DeepCollectionEquality().hash(_this.meanings));
  }

  @override
  String toString() {
    final _this = this as Radical;
    return 'Radical(character: ${_this.character}, meanings: ${_this.meanings})';
  }
}

/// @nodoc
abstract mixin class $RadicalCopyWith<$Res> {
  factory $RadicalCopyWith(Radical value, $Res Function(Radical) _then) =
      _$RadicalCopyWithImpl;
  @useResult
  $Res call({String character, List<String> meanings});
}

/// @nodoc
class _$RadicalCopyWithImpl<$Res> implements $RadicalCopyWith<$Res> {
  _$RadicalCopyWithImpl(this._self, this._then);

  final Radical _self;
  final $Res Function(Radical) _then;

  /// Create a copy of Radical
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? meanings = null,
  }) {
    return _then(Radical(
      character: null == character
          ? _self.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      meanings: null == meanings
          ? _self.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Radical].
extension RadicalPatterns on Radical {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Radical value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Radical() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Radical value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Radical():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Radical value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Radical() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String character, List<String> meanings)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Radical() when $default != null:
        return $default(_that.character, _that.meanings);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String character, List<String> meanings) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Radical():
        return $default(_that.character, _that.meanings);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String character, List<String> meanings)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Radical() when $default != null:
        return $default(_that.character, _that.meanings);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Radical implements Radical {
  const _Radical({required this.character, required List<String> meanings})
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

  /// Create a copy of Radical
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RadicalCopyWith<_Radical> get copyWith =>
      __$RadicalCopyWithImpl<_Radical>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Radical &&
            (identical(other.character, character) ||
                other.character == character) &&
            const DeepCollectionEquality().equals(other.meanings, _meanings));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, character, const DeepCollectionEquality().hash(_meanings));
  }

  @override
  String toString() {
    return 'Radical(character: $character, meanings: $meanings)';
  }
}

/// @nodoc
abstract mixin class _$RadicalCopyWith<$Res> implements $RadicalCopyWith<$Res> {
  factory _$RadicalCopyWith(_Radical value, $Res Function(_Radical) _then) =
      __$RadicalCopyWithImpl;
  @override
  @useResult
  $Res call({String character, List<String> meanings});
}

/// @nodoc
class __$RadicalCopyWithImpl<$Res> implements _$RadicalCopyWith<$Res> {
  __$RadicalCopyWithImpl(this._self, this._then);

  final _Radical _self;
  final $Res Function(_Radical) _then;

  /// Create a copy of Radical
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? character = null,
    Object? meanings = null,
  }) {
    return _then(_Radical(
      character: null == character
          ? _self.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      meanings: null == meanings
          ? _self._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$Compound {
  String get compound;
  String get reading;
  List<String> get meanings;

  /// Create a copy of Compound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompoundCopyWith<Compound> get copyWith =>
      _$CompoundCopyWithImpl<Compound>(this as Compound, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Compound;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Compound &&
            (identical(other.compound, _this.compound) ||
                other.compound == _this.compound) &&
            (identical(other.reading, _this.reading) ||
                other.reading == _this.reading) &&
            const DeepCollectionEquality()
                .equals(other.meanings, _this.meanings));
  }

  @override
  int get hashCode {
    final _this = this as Compound;
    return Object.hash(runtimeType, _this.compound, _this.reading,
        const DeepCollectionEquality().hash(_this.meanings));
  }

  @override
  String toString() {
    final _this = this as Compound;
    return 'Compound(compound: ${_this.compound}, reading: ${_this.reading}, meanings: ${_this.meanings})';
  }
}

/// @nodoc
abstract mixin class $CompoundCopyWith<$Res> {
  factory $CompoundCopyWith(Compound value, $Res Function(Compound) _then) =
      _$CompoundCopyWithImpl;
  @useResult
  $Res call({String compound, String reading, List<String> meanings});
}

/// @nodoc
class _$CompoundCopyWithImpl<$Res> implements $CompoundCopyWith<$Res> {
  _$CompoundCopyWithImpl(this._self, this._then);

  final Compound _self;
  final $Res Function(Compound) _then;

  /// Create a copy of Compound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compound = null,
    Object? reading = null,
    Object? meanings = null,
  }) {
    return _then(Compound(
      compound: null == compound
          ? _self.compound
          : compound // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _self.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      meanings: null == meanings
          ? _self.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Compound].
extension CompoundPatterns on Compound {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Compound value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Compound() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Compound value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Compound():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Compound value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Compound() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String compound, String reading, List<String> meanings)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Compound() when $default != null:
        return $default(_that.compound, _that.reading, _that.meanings);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String compound, String reading, List<String> meanings)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Compound():
        return $default(_that.compound, _that.reading, _that.meanings);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String compound, String reading, List<String> meanings)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Compound() when $default != null:
        return $default(_that.compound, _that.reading, _that.meanings);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Compound implements Compound {
  const _Compound(
      {required this.compound,
      required this.reading,
      required List<String> meanings})
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

  /// Create a copy of Compound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompoundCopyWith<_Compound> get copyWith =>
      __$CompoundCopyWithImpl<_Compound>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Compound &&
            (identical(other.compound, compound) ||
                other.compound == compound) &&
            (identical(other.reading, reading) || other.reading == reading) &&
            const DeepCollectionEquality().equals(other.meanings, _meanings));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, compound, reading,
        const DeepCollectionEquality().hash(_meanings));
  }

  @override
  String toString() {
    return 'Compound(compound: $compound, reading: $reading, meanings: $meanings)';
  }
}

/// @nodoc
abstract mixin class _$CompoundCopyWith<$Res>
    implements $CompoundCopyWith<$Res> {
  factory _$CompoundCopyWith(_Compound value, $Res Function(_Compound) _then) =
      __$CompoundCopyWithImpl;
  @override
  @useResult
  $Res call({String compound, String reading, List<String> meanings});
}

/// @nodoc
class __$CompoundCopyWithImpl<$Res> implements _$CompoundCopyWith<$Res> {
  __$CompoundCopyWithImpl(this._self, this._then);

  final _Compound _self;
  final $Res Function(_Compound) _then;

  /// Create a copy of Compound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? compound = null,
    Object? reading = null,
    Object? meanings = null,
  }) {
    return _then(_Compound(
      compound: null == compound
          ? _self.compound
          : compound // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _self.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      meanings: null == meanings
          ? _self._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$Name {
  String get japanese;
  String get english;
  String? get reading;

  /// null if type is "Unclassified name"
  String? get type;

  /// The ID of the corresponding [Word], if available.
  ///
  /// Names seem to only be linked to a [Word] if the word has Wikipedia data.
  String? get wordId;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NameCopyWith<Name> get copyWith =>
      _$NameCopyWithImpl<Name>(this as Name, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Name;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Name &&
            (identical(other.japanese, _this.japanese) ||
                other.japanese == _this.japanese) &&
            (identical(other.english, _this.english) ||
                other.english == _this.english) &&
            (identical(other.reading, _this.reading) ||
                other.reading == _this.reading) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.wordId, _this.wordId) ||
                other.wordId == _this.wordId));
  }

  @override
  int get hashCode {
    final _this = this as Name;
    return Object.hash(runtimeType, _this.japanese, _this.english,
        _this.reading, _this.type, _this.wordId);
  }

  @override
  String toString() {
    final _this = this as Name;
    return 'Name(japanese: ${_this.japanese}, english: ${_this.english}, reading: ${_this.reading}, type: ${_this.type}, wordId: ${_this.wordId})';
  }
}

/// @nodoc
abstract mixin class $NameCopyWith<$Res> {
  factory $NameCopyWith(Name value, $Res Function(Name) _then) =
      _$NameCopyWithImpl;
  @useResult
  $Res call(
      {String japanese,
      String english,
      String? reading,
      String? type,
      String? wordId});
}

/// @nodoc
class _$NameCopyWithImpl<$Res> implements $NameCopyWith<$Res> {
  _$NameCopyWithImpl(this._self, this._then);

  final Name _self;
  final $Res Function(Name) _then;

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
    return _then(Name(
      japanese: null == japanese
          ? _self.japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as String,
      english: null == english
          ? _self.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      reading: freezed == reading
          ? _self.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      wordId: freezed == wordId
          ? _self.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Name].
extension NamePatterns on Name {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Name value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Name() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Name value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Name():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Name value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Name() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String japanese, String english, String? reading,
            String? type, String? wordId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Name() when $default != null:
        return $default(_that.japanese, _that.english, _that.reading,
            _that.type, _that.wordId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String japanese, String english, String? reading,
            String? type, String? wordId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Name():
        return $default(_that.japanese, _that.english, _that.reading,
            _that.type, _that.wordId);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String japanese, String english, String? reading,
            String? type, String? wordId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Name() when $default != null:
        return $default(_that.japanese, _that.english, _that.reading,
            _that.type, _that.wordId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Name implements Name {
  const _Name(
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

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NameCopyWith<_Name> get copyWith =>
      __$NameCopyWithImpl<_Name>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Name &&
            (identical(other.japanese, japanese) ||
                other.japanese == japanese) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.reading, reading) || other.reading == reading) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.wordId, wordId) || other.wordId == wordId));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, japanese, english, reading, type, wordId);
  }

  @override
  String toString() {
    return 'Name(japanese: $japanese, english: $english, reading: $reading, type: $type, wordId: $wordId)';
  }
}

/// @nodoc
abstract mixin class _$NameCopyWith<$Res> implements $NameCopyWith<$Res> {
  factory _$NameCopyWith(_Name value, $Res Function(_Name) _then) =
      __$NameCopyWithImpl;
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
class __$NameCopyWithImpl<$Res> implements _$NameCopyWith<$Res> {
  __$NameCopyWithImpl(this._self, this._then);

  final _Name _self;
  final $Res Function(_Name) _then;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? japanese = null,
    Object? english = null,
    Object? reading = freezed,
    Object? type = freezed,
    Object? wordId = freezed,
  }) {
    return _then(_Name(
      japanese: null == japanese
          ? _self.japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as String,
      english: null == english
          ? _self.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      reading: freezed == reading
          ? _self.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      wordId: freezed == wordId
          ? _self.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$SearchResponse<T extends ResultType> {
  List<T> get results;
  bool get hasNextPage;
  List<Furigana> get zenEntries;
  List<String> get noMatchesFor;
  Correction? get correction;
  GrammarInfo? get grammarInfo;
  Conversion? get conversion;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchResponseCopyWith<T, SearchResponse<T>> get copyWith =>
      _$SearchResponseCopyWithImpl<T, SearchResponse<T>>(
          this as SearchResponse<T>, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as SearchResponse<T>;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchResponse<T> &&
            const DeepCollectionEquality()
                .equals(other.results, _this.results) &&
            (identical(other.hasNextPage, _this.hasNextPage) ||
                other.hasNextPage == _this.hasNextPage) &&
            const DeepCollectionEquality()
                .equals(other.zenEntries, _this.zenEntries) &&
            const DeepCollectionEquality()
                .equals(other.noMatchesFor, _this.noMatchesFor) &&
            (identical(other.correction, _this.correction) ||
                other.correction == _this.correction) &&
            (identical(other.grammarInfo, _this.grammarInfo) ||
                other.grammarInfo == _this.grammarInfo) &&
            (identical(other.conversion, _this.conversion) ||
                other.conversion == _this.conversion));
  }

  @override
  int get hashCode {
    final _this = this as SearchResponse<T>;
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_this.results),
        _this.hasNextPage,
        const DeepCollectionEquality().hash(_this.zenEntries),
        const DeepCollectionEquality().hash(_this.noMatchesFor),
        _this.correction,
        _this.grammarInfo,
        _this.conversion);
  }

  @override
  String toString() {
    final _this = this as SearchResponse<T>;
    return 'SearchResponse<$T>(results: ${_this.results}, hasNextPage: ${_this.hasNextPage}, zenEntries: ${_this.zenEntries}, noMatchesFor: ${_this.noMatchesFor}, correction: ${_this.correction}, grammarInfo: ${_this.grammarInfo}, conversion: ${_this.conversion})';
  }
}

/// @nodoc
abstract mixin class $SearchResponseCopyWith<T extends ResultType, $Res> {
  factory $SearchResponseCopyWith(
          SearchResponse<T> value, $Res Function(SearchResponse<T>) _then) =
      _$SearchResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<T> results,
      bool hasNextPage,
      List<Furigana> zenEntries,
      List<String> noMatchesFor,
      Correction? correction,
      GrammarInfo? grammarInfo,
      Conversion? conversion});

  $CorrectionCopyWith<$Res>? get correction;
  $GrammarInfoCopyWith<$Res>? get grammarInfo;
  $ConversionCopyWith<$Res>? get conversion;
}

/// @nodoc
class _$SearchResponseCopyWithImpl<T extends ResultType, $Res>
    implements $SearchResponseCopyWith<T, $Res> {
  _$SearchResponseCopyWithImpl(this._self, this._then);

  final SearchResponse<T> _self;
  final $Res Function(SearchResponse<T>) _then;

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
    return _then(SearchResponse(
      results: null == results
          ? _self.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasNextPage: null == hasNextPage
          ? _self.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      zenEntries: null == zenEntries
          ? _self.zenEntries
          : zenEntries // ignore: cast_nullable_to_non_nullable
              as List<Furigana>,
      noMatchesFor: null == noMatchesFor
          ? _self.noMatchesFor
          : noMatchesFor // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correction: freezed == correction
          ? _self.correction
          : correction // ignore: cast_nullable_to_non_nullable
              as Correction?,
      grammarInfo: freezed == grammarInfo
          ? _self.grammarInfo
          : grammarInfo // ignore: cast_nullable_to_non_nullable
              as GrammarInfo?,
      conversion: freezed == conversion
          ? _self.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as Conversion?,
    ));
  }

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CorrectionCopyWith<$Res>? get correction {
    if (_self.correction == null) {
      return null;
    }

    return $CorrectionCopyWith<$Res>(_self.correction!, (value) {
      return _then(_self.copyWith(correction: value));
    });
  }

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GrammarInfoCopyWith<$Res>? get grammarInfo {
    if (_self.grammarInfo == null) {
      return null;
    }

    return $GrammarInfoCopyWith<$Res>(_self.grammarInfo!, (value) {
      return _then(_self.copyWith(grammarInfo: value));
    });
  }

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversionCopyWith<$Res>? get conversion {
    if (_self.conversion == null) {
      return null;
    }

    return $ConversionCopyWith<$Res>(_self.conversion!, (value) {
      return _then(_self.copyWith(conversion: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchResponse].
extension SearchResponsePatterns<T extends ResultType> on SearchResponse<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchResponse<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchResponse() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchResponse<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchResponse():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchResponse<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchResponse() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<T> results,
            bool hasNextPage,
            List<Furigana> zenEntries,
            List<String> noMatchesFor,
            Correction? correction,
            GrammarInfo? grammarInfo,
            Conversion? conversion)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchResponse() when $default != null:
        return $default(
            _that.results,
            _that.hasNextPage,
            _that.zenEntries,
            _that.noMatchesFor,
            _that.correction,
            _that.grammarInfo,
            _that.conversion);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<T> results,
            bool hasNextPage,
            List<Furigana> zenEntries,
            List<String> noMatchesFor,
            Correction? correction,
            GrammarInfo? grammarInfo,
            Conversion? conversion)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchResponse():
        return $default(
            _that.results,
            _that.hasNextPage,
            _that.zenEntries,
            _that.noMatchesFor,
            _that.correction,
            _that.grammarInfo,
            _that.conversion);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<T> results,
            bool hasNextPage,
            List<Furigana> zenEntries,
            List<String> noMatchesFor,
            Correction? correction,
            GrammarInfo? grammarInfo,
            Conversion? conversion)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchResponse() when $default != null:
        return $default(
            _that.results,
            _that.hasNextPage,
            _that.zenEntries,
            _that.noMatchesFor,
            _that.correction,
            _that.grammarInfo,
            _that.conversion);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchResponse<T extends ResultType> implements SearchResponse<T> {
  const _SearchResponse(
      {required List<T> results,
      this.hasNextPage = false,
      List<Furigana> zenEntries = const [],
      List<String> noMatchesFor = const [],
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
  final List<Furigana> _zenEntries;
  @override
  @JsonKey()
  List<Furigana> get zenEntries {
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

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchResponseCopyWith<T, _SearchResponse<T>> get copyWith =>
      __$SearchResponseCopyWithImpl<T, _SearchResponse<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchResponse<T> &&
            const DeepCollectionEquality().equals(other.results, _results) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            const DeepCollectionEquality()
                .equals(other.zenEntries, _zenEntries) &&
            const DeepCollectionEquality()
                .equals(other.noMatchesFor, _noMatchesFor) &&
            (identical(other.correction, correction) ||
                other.correction == correction) &&
            (identical(other.grammarInfo, grammarInfo) ||
                other.grammarInfo == grammarInfo) &&
            (identical(other.conversion, conversion) ||
                other.conversion == conversion));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_results),
        hasNextPage,
        const DeepCollectionEquality().hash(_zenEntries),
        const DeepCollectionEquality().hash(_noMatchesFor),
        correction,
        grammarInfo,
        conversion);
  }

  @override
  String toString() {
    return 'SearchResponse<$T>(results: $results, hasNextPage: $hasNextPage, zenEntries: $zenEntries, noMatchesFor: $noMatchesFor, correction: $correction, grammarInfo: $grammarInfo, conversion: $conversion)';
  }
}

/// @nodoc
abstract mixin class _$SearchResponseCopyWith<T extends ResultType, $Res>
    implements $SearchResponseCopyWith<T, $Res> {
  factory _$SearchResponseCopyWith(
          _SearchResponse<T> value, $Res Function(_SearchResponse<T>) _then) =
      __$SearchResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<T> results,
      bool hasNextPage,
      List<Furigana> zenEntries,
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
class __$SearchResponseCopyWithImpl<T extends ResultType, $Res>
    implements _$SearchResponseCopyWith<T, $Res> {
  __$SearchResponseCopyWithImpl(this._self, this._then);

  final _SearchResponse<T> _self;
  final $Res Function(_SearchResponse<T>) _then;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? results = null,
    Object? hasNextPage = null,
    Object? zenEntries = null,
    Object? noMatchesFor = null,
    Object? correction = freezed,
    Object? grammarInfo = freezed,
    Object? conversion = freezed,
  }) {
    return _then(_SearchResponse<T>(
      results: null == results
          ? _self._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasNextPage: null == hasNextPage
          ? _self.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      zenEntries: null == zenEntries
          ? _self._zenEntries
          : zenEntries // ignore: cast_nullable_to_non_nullable
              as List<Furigana>,
      noMatchesFor: null == noMatchesFor
          ? _self._noMatchesFor
          : noMatchesFor // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correction: freezed == correction
          ? _self.correction
          : correction // ignore: cast_nullable_to_non_nullable
              as Correction?,
      grammarInfo: freezed == grammarInfo
          ? _self.grammarInfo
          : grammarInfo // ignore: cast_nullable_to_non_nullable
              as GrammarInfo?,
      conversion: freezed == conversion
          ? _self.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as Conversion?,
    ));
  }

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CorrectionCopyWith<$Res>? get correction {
    if (_self.correction == null) {
      return null;
    }

    return $CorrectionCopyWith<$Res>(_self.correction!, (value) {
      return _then(_self.copyWith(correction: value));
    });
  }

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GrammarInfoCopyWith<$Res>? get grammarInfo {
    if (_self.grammarInfo == null) {
      return null;
    }

    return $GrammarInfoCopyWith<$Res>(_self.grammarInfo!, (value) {
      return _then(_self.copyWith(grammarInfo: value));
    });
  }

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversionCopyWith<$Res>? get conversion {
    if (_self.conversion == null) {
      return null;
    }

    return $ConversionCopyWith<$Res>(_self.conversion!, (value) {
      return _then(_self.copyWith(conversion: value));
    });
  }
}

/// @nodoc
mixin _$Correction {
  String get effective;
  String get original;
  bool get noMatchesForOriginal;

  /// Create a copy of Correction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CorrectionCopyWith<Correction> get copyWith =>
      _$CorrectionCopyWithImpl<Correction>(this as Correction, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Correction;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Correction &&
            (identical(other.effective, _this.effective) ||
                other.effective == _this.effective) &&
            (identical(other.original, _this.original) ||
                other.original == _this.original) &&
            (identical(
                    other.noMatchesForOriginal, _this.noMatchesForOriginal) ||
                other.noMatchesForOriginal == _this.noMatchesForOriginal));
  }

  @override
  int get hashCode {
    final _this = this as Correction;
    return Object.hash(runtimeType, _this.effective, _this.original,
        _this.noMatchesForOriginal);
  }

  @override
  String toString() {
    final _this = this as Correction;
    return 'Correction(effective: ${_this.effective}, original: ${_this.original}, noMatchesForOriginal: ${_this.noMatchesForOriginal})';
  }
}

/// @nodoc
abstract mixin class $CorrectionCopyWith<$Res> {
  factory $CorrectionCopyWith(
          Correction value, $Res Function(Correction) _then) =
      _$CorrectionCopyWithImpl;
  @useResult
  $Res call({String effective, String original, bool noMatchesForOriginal});
}

/// @nodoc
class _$CorrectionCopyWithImpl<$Res> implements $CorrectionCopyWith<$Res> {
  _$CorrectionCopyWithImpl(this._self, this._then);

  final Correction _self;
  final $Res Function(Correction) _then;

  /// Create a copy of Correction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effective = null,
    Object? original = null,
    Object? noMatchesForOriginal = null,
  }) {
    return _then(Correction(
      effective: null == effective
          ? _self.effective
          : effective // ignore: cast_nullable_to_non_nullable
              as String,
      original: null == original
          ? _self.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      noMatchesForOriginal: null == noMatchesForOriginal
          ? _self.noMatchesForOriginal
          : noMatchesForOriginal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Correction].
extension CorrectionPatterns on Correction {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Correction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Correction() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Correction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Correction():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Correction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Correction() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String effective, String original, bool noMatchesForOriginal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Correction() when $default != null:
        return $default(
            _that.effective, _that.original, _that.noMatchesForOriginal);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String effective, String original, bool noMatchesForOriginal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Correction():
        return $default(
            _that.effective, _that.original, _that.noMatchesForOriginal);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String effective, String original, bool noMatchesForOriginal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Correction() when $default != null:
        return $default(
            _that.effective, _that.original, _that.noMatchesForOriginal);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Correction implements Correction {
  const _Correction(
      {required this.effective,
      required this.original,
      required this.noMatchesForOriginal});

  @override
  final String effective;
  @override
  final String original;
  @override
  final bool noMatchesForOriginal;

  /// Create a copy of Correction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CorrectionCopyWith<_Correction> get copyWith =>
      __$CorrectionCopyWithImpl<_Correction>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Correction &&
            (identical(other.effective, effective) ||
                other.effective == effective) &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.noMatchesForOriginal, noMatchesForOriginal) ||
                other.noMatchesForOriginal == noMatchesForOriginal));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, effective, original, noMatchesForOriginal);
  }

  @override
  String toString() {
    return 'Correction(effective: $effective, original: $original, noMatchesForOriginal: $noMatchesForOriginal)';
  }
}

/// @nodoc
abstract mixin class _$CorrectionCopyWith<$Res>
    implements $CorrectionCopyWith<$Res> {
  factory _$CorrectionCopyWith(
          _Correction value, $Res Function(_Correction) _then) =
      __$CorrectionCopyWithImpl;
  @override
  @useResult
  $Res call({String effective, String original, bool noMatchesForOriginal});
}

/// @nodoc
class __$CorrectionCopyWithImpl<$Res> implements _$CorrectionCopyWith<$Res> {
  __$CorrectionCopyWithImpl(this._self, this._then);

  final _Correction _self;
  final $Res Function(_Correction) _then;

  /// Create a copy of Correction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? effective = null,
    Object? original = null,
    Object? noMatchesForOriginal = null,
  }) {
    return _then(_Correction(
      effective: null == effective
          ? _self.effective
          : effective // ignore: cast_nullable_to_non_nullable
              as String,
      original: null == original
          ? _self.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      noMatchesForOriginal: null == noMatchesForOriginal
          ? _self.noMatchesForOriginal
          : noMatchesForOriginal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$GrammarInfo {
  String get word;
  String get possibleInflectionOf;
  List<String> get formInfos;

  /// Create a copy of GrammarInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GrammarInfoCopyWith<GrammarInfo> get copyWith =>
      _$GrammarInfoCopyWithImpl<GrammarInfo>(this as GrammarInfo, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as GrammarInfo;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GrammarInfo &&
            (identical(other.word, _this.word) || other.word == _this.word) &&
            (identical(
                    other.possibleInflectionOf, _this.possibleInflectionOf) ||
                other.possibleInflectionOf == _this.possibleInflectionOf) &&
            const DeepCollectionEquality()
                .equals(other.formInfos, _this.formInfos));
  }

  @override
  int get hashCode {
    final _this = this as GrammarInfo;
    return Object.hash(runtimeType, _this.word, _this.possibleInflectionOf,
        const DeepCollectionEquality().hash(_this.formInfos));
  }

  @override
  String toString() {
    final _this = this as GrammarInfo;
    return 'GrammarInfo(word: ${_this.word}, possibleInflectionOf: ${_this.possibleInflectionOf}, formInfos: ${_this.formInfos})';
  }
}

/// @nodoc
abstract mixin class $GrammarInfoCopyWith<$Res> {
  factory $GrammarInfoCopyWith(
          GrammarInfo value, $Res Function(GrammarInfo) _then) =
      _$GrammarInfoCopyWithImpl;
  @useResult
  $Res call({String word, String possibleInflectionOf, List<String> formInfos});
}

/// @nodoc
class _$GrammarInfoCopyWithImpl<$Res> implements $GrammarInfoCopyWith<$Res> {
  _$GrammarInfoCopyWithImpl(this._self, this._then);

  final GrammarInfo _self;
  final $Res Function(GrammarInfo) _then;

  /// Create a copy of GrammarInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? possibleInflectionOf = null,
    Object? formInfos = null,
  }) {
    return _then(GrammarInfo(
      word: null == word
          ? _self.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      possibleInflectionOf: null == possibleInflectionOf
          ? _self.possibleInflectionOf
          : possibleInflectionOf // ignore: cast_nullable_to_non_nullable
              as String,
      formInfos: null == formInfos
          ? _self.formInfos
          : formInfos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [GrammarInfo].
extension GrammarInfoPatterns on GrammarInfo {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GrammarInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GrammarInfo() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GrammarInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GrammarInfo():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GrammarInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GrammarInfo() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String word, String possibleInflectionOf, List<String> formInfos)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GrammarInfo() when $default != null:
        return $default(
            _that.word, _that.possibleInflectionOf, _that.formInfos);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String word, String possibleInflectionOf, List<String> formInfos)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GrammarInfo():
        return $default(
            _that.word, _that.possibleInflectionOf, _that.formInfos);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String word, String possibleInflectionOf, List<String> formInfos)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GrammarInfo() when $default != null:
        return $default(
            _that.word, _that.possibleInflectionOf, _that.formInfos);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GrammarInfo implements GrammarInfo {
  const _GrammarInfo(
      {required this.word,
      required this.possibleInflectionOf,
      required List<String> formInfos})
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

  /// Create a copy of GrammarInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GrammarInfoCopyWith<_GrammarInfo> get copyWith =>
      __$GrammarInfoCopyWithImpl<_GrammarInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GrammarInfo &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.possibleInflectionOf, possibleInflectionOf) ||
                other.possibleInflectionOf == possibleInflectionOf) &&
            const DeepCollectionEquality().equals(other.formInfos, _formInfos));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, word, possibleInflectionOf,
        const DeepCollectionEquality().hash(_formInfos));
  }

  @override
  String toString() {
    return 'GrammarInfo(word: $word, possibleInflectionOf: $possibleInflectionOf, formInfos: $formInfos)';
  }
}

/// @nodoc
abstract mixin class _$GrammarInfoCopyWith<$Res>
    implements $GrammarInfoCopyWith<$Res> {
  factory _$GrammarInfoCopyWith(
          _GrammarInfo value, $Res Function(_GrammarInfo) _then) =
      __$GrammarInfoCopyWithImpl;
  @override
  @useResult
  $Res call({String word, String possibleInflectionOf, List<String> formInfos});
}

/// @nodoc
class __$GrammarInfoCopyWithImpl<$Res> implements _$GrammarInfoCopyWith<$Res> {
  __$GrammarInfoCopyWithImpl(this._self, this._then);

  final _GrammarInfo _self;
  final $Res Function(_GrammarInfo) _then;

  /// Create a copy of GrammarInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? word = null,
    Object? possibleInflectionOf = null,
    Object? formInfos = null,
  }) {
    return _then(_GrammarInfo(
      word: null == word
          ? _self.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      possibleInflectionOf: null == possibleInflectionOf
          ? _self.possibleInflectionOf
          : possibleInflectionOf // ignore: cast_nullable_to_non_nullable
              as String,
      formInfos: null == formInfos
          ? _self._formInfos
          : formInfos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$Conversion {
  String get original;
  String get converted;

  /// Create a copy of Conversion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConversionCopyWith<Conversion> get copyWith =>
      _$ConversionCopyWithImpl<Conversion>(this as Conversion, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Conversion;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Conversion &&
            (identical(other.original, _this.original) ||
                other.original == _this.original) &&
            (identical(other.converted, _this.converted) ||
                other.converted == _this.converted));
  }

  @override
  int get hashCode {
    final _this = this as Conversion;
    return Object.hash(runtimeType, _this.original, _this.converted);
  }

  @override
  String toString() {
    final _this = this as Conversion;
    return 'Conversion(original: ${_this.original}, converted: ${_this.converted})';
  }
}

/// @nodoc
abstract mixin class $ConversionCopyWith<$Res> {
  factory $ConversionCopyWith(
          Conversion value, $Res Function(Conversion) _then) =
      _$ConversionCopyWithImpl;
  @useResult
  $Res call({String original, String converted});
}

/// @nodoc
class _$ConversionCopyWithImpl<$Res> implements $ConversionCopyWith<$Res> {
  _$ConversionCopyWithImpl(this._self, this._then);

  final Conversion _self;
  final $Res Function(Conversion) _then;

  /// Create a copy of Conversion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? converted = null,
  }) {
    return _then(Conversion(
      original: null == original
          ? _self.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      converted: null == converted
          ? _self.converted
          : converted // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Conversion].
extension ConversionPatterns on Conversion {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Conversion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Conversion() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Conversion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Conversion():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Conversion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Conversion() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String original, String converted)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Conversion() when $default != null:
        return $default(_that.original, _that.converted);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String original, String converted) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Conversion():
        return $default(_that.original, _that.converted);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String original, String converted)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Conversion() when $default != null:
        return $default(_that.original, _that.converted);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Conversion implements Conversion {
  const _Conversion({required this.original, required this.converted});

  @override
  final String original;
  @override
  final String converted;

  /// Create a copy of Conversion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConversionCopyWith<_Conversion> get copyWith =>
      __$ConversionCopyWithImpl<_Conversion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Conversion &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.converted, converted) ||
                other.converted == converted));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, original, converted);
  }

  @override
  String toString() {
    return 'Conversion(original: $original, converted: $converted)';
  }
}

/// @nodoc
abstract mixin class _$ConversionCopyWith<$Res>
    implements $ConversionCopyWith<$Res> {
  factory _$ConversionCopyWith(
          _Conversion value, $Res Function(_Conversion) _then) =
      __$ConversionCopyWithImpl;
  @override
  @useResult
  $Res call({String original, String converted});
}

/// @nodoc
class __$ConversionCopyWithImpl<$Res> implements _$ConversionCopyWith<$Res> {
  __$ConversionCopyWithImpl(this._self, this._then);

  final _Conversion _self;
  final $Res Function(_Conversion) _then;

  /// Create a copy of Conversion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? original = null,
    Object? converted = null,
  }) {
    return _then(_Conversion(
      original: null == original
          ? _self.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      converted: null == converted
          ? _self.converted
          : converted // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Sentence {
  Furigana get japanese;
  String get english;
  String? get id;
  SentenceCopyright? get copyright;
  List<Kanji>? get kanji;

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SentenceCopyWith<Sentence> get copyWith =>
      _$SentenceCopyWithImpl<Sentence>(this as Sentence, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Sentence;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sentence &&
            const DeepCollectionEquality()
                .equals(other.japanese, _this.japanese) &&
            (identical(other.english, _this.english) ||
                other.english == _this.english) &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.copyright, _this.copyright) ||
                other.copyright == _this.copyright) &&
            const DeepCollectionEquality().equals(other.kanji, _this.kanji));
  }

  @override
  int get hashCode {
    final _this = this as Sentence;
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_this.japanese),
        _this.english,
        _this.id,
        _this.copyright,
        const DeepCollectionEquality().hash(_this.kanji));
  }

  @override
  String toString() {
    final _this = this as Sentence;
    return 'Sentence(japanese: ${_this.japanese}, english: ${_this.english}, id: ${_this.id}, copyright: ${_this.copyright}, kanji: ${_this.kanji})';
  }
}

/// @nodoc
abstract mixin class $SentenceCopyWith<$Res> {
  factory $SentenceCopyWith(Sentence value, $Res Function(Sentence) _then) =
      _$SentenceCopyWithImpl;
  @useResult
  $Res call(
      {Furigana japanese,
      String english,
      String? id,
      SentenceCopyright? copyright,
      List<Kanji>? kanji});

  $SentenceCopyrightCopyWith<$Res>? get copyright;
}

/// @nodoc
class _$SentenceCopyWithImpl<$Res> implements $SentenceCopyWith<$Res> {
  _$SentenceCopyWithImpl(this._self, this._then);

  final Sentence _self;
  final $Res Function(Sentence) _then;

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
    return _then(Sentence(
      japanese: null == japanese
          ? _self.japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as Furigana,
      english: null == english
          ? _self.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _self.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as SentenceCopyright?,
      kanji: freezed == kanji
          ? _self.kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as List<Kanji>?,
    ));
  }

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SentenceCopyrightCopyWith<$Res>? get copyright {
    if (_self.copyright == null) {
      return null;
    }

    return $SentenceCopyrightCopyWith<$Res>(_self.copyright!, (value) {
      return _then(_self.copyWith(copyright: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sentence].
extension SentencePatterns on Sentence {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sentence value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sentence() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sentence value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sentence():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sentence value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sentence() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Furigana japanese, String english, String? id,
            SentenceCopyright? copyright, List<Kanji>? kanji)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sentence() when $default != null:
        return $default(_that.japanese, _that.english, _that.id,
            _that.copyright, _that.kanji);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Furigana japanese, String english, String? id,
            SentenceCopyright? copyright, List<Kanji>? kanji)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sentence():
        return $default(_that.japanese, _that.english, _that.id,
            _that.copyright, _that.kanji);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Furigana japanese, String english, String? id,
            SentenceCopyright? copyright, List<Kanji>? kanji)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sentence() when $default != null:
        return $default(_that.japanese, _that.english, _that.id,
            _that.copyright, _that.kanji);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sentence extends Sentence {
  const _Sentence(
      {required Furigana japanese,
      required this.english,
      this.id,
      this.copyright,
      List<Kanji>? kanji})
      : _japanese = japanese,
        _kanji = kanji,
        super._();

  final Furigana _japanese;
  @override
  Furigana get japanese {
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

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SentenceCopyWith<_Sentence> get copyWith =>
      __$SentenceCopyWithImpl<_Sentence>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sentence &&
            const DeepCollectionEquality().equals(other.japanese, _japanese) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            const DeepCollectionEquality().equals(other.kanji, _kanji));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_japanese),
        english,
        id,
        copyright,
        const DeepCollectionEquality().hash(_kanji));
  }

  @override
  String toString() {
    return 'Sentence(japanese: $japanese, english: $english, id: $id, copyright: $copyright, kanji: $kanji)';
  }
}

/// @nodoc
abstract mixin class _$SentenceCopyWith<$Res>
    implements $SentenceCopyWith<$Res> {
  factory _$SentenceCopyWith(_Sentence value, $Res Function(_Sentence) _then) =
      __$SentenceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Furigana japanese,
      String english,
      String? id,
      SentenceCopyright? copyright,
      List<Kanji>? kanji});

  @override
  $SentenceCopyrightCopyWith<$Res>? get copyright;
}

/// @nodoc
class __$SentenceCopyWithImpl<$Res> implements _$SentenceCopyWith<$Res> {
  __$SentenceCopyWithImpl(this._self, this._then);

  final _Sentence _self;
  final $Res Function(_Sentence) _then;

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? japanese = null,
    Object? english = null,
    Object? id = freezed,
    Object? copyright = freezed,
    Object? kanji = freezed,
  }) {
    return _then(_Sentence(
      japanese: null == japanese
          ? _self._japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as Furigana,
      english: null == english
          ? _self.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _self.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as SentenceCopyright?,
      kanji: freezed == kanji
          ? _self._kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as List<Kanji>?,
    ));
  }

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SentenceCopyrightCopyWith<$Res>? get copyright {
    if (_self.copyright == null) {
      return null;
    }

    return $SentenceCopyrightCopyWith<$Res>(_self.copyright!, (value) {
      return _then(_self.copyWith(copyright: value));
    });
  }
}

/// @nodoc
mixin _$SentenceCopyright {
  String get name;
  String get url;

  /// Create a copy of SentenceCopyright
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SentenceCopyrightCopyWith<SentenceCopyright> get copyWith =>
      _$SentenceCopyrightCopyWithImpl<SentenceCopyright>(
          this as SentenceCopyright, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as SentenceCopyright;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SentenceCopyright &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.url, _this.url) || other.url == _this.url));
  }

  @override
  int get hashCode {
    final _this = this as SentenceCopyright;
    return Object.hash(runtimeType, _this.name, _this.url);
  }

  @override
  String toString() {
    final _this = this as SentenceCopyright;
    return 'SentenceCopyright(name: ${_this.name}, url: ${_this.url})';
  }
}

/// @nodoc
abstract mixin class $SentenceCopyrightCopyWith<$Res> {
  factory $SentenceCopyrightCopyWith(
          SentenceCopyright value, $Res Function(SentenceCopyright) _then) =
      _$SentenceCopyrightCopyWithImpl;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$SentenceCopyrightCopyWithImpl<$Res>
    implements $SentenceCopyrightCopyWith<$Res> {
  _$SentenceCopyrightCopyWithImpl(this._self, this._then);

  final SentenceCopyright _self;
  final $Res Function(SentenceCopyright) _then;

  /// Create a copy of SentenceCopyright
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(SentenceCopyright(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SentenceCopyright].
extension SentenceCopyrightPatterns on SentenceCopyright {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SentenceCopyright value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SentenceCopyright() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SentenceCopyright value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SentenceCopyright():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SentenceCopyright value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SentenceCopyright() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, String url)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SentenceCopyright() when $default != null:
        return $default(_that.name, _that.url);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, String url) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SentenceCopyright():
        return $default(_that.name, _that.url);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name, String url)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SentenceCopyright() when $default != null:
        return $default(_that.name, _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SentenceCopyright implements SentenceCopyright {
  const _SentenceCopyright({required this.name, required this.url});

  @override
  final String name;
  @override
  final String url;

  /// Create a copy of SentenceCopyright
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SentenceCopyrightCopyWith<_SentenceCopyright> get copyWith =>
      __$SentenceCopyrightCopyWithImpl<_SentenceCopyright>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SentenceCopyright &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, url);
  }

  @override
  String toString() {
    return 'SentenceCopyright(name: $name, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$SentenceCopyrightCopyWith<$Res>
    implements $SentenceCopyrightCopyWith<$Res> {
  factory _$SentenceCopyrightCopyWith(
          _SentenceCopyright value, $Res Function(_SentenceCopyright) _then) =
      __$SentenceCopyrightCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$SentenceCopyrightCopyWithImpl<$Res>
    implements _$SentenceCopyrightCopyWith<$Res> {
  __$SentenceCopyrightCopyWithImpl(this._self, this._then);

  final _SentenceCopyright _self;
  final $Res Function(_SentenceCopyright) _then;

  /// Create a copy of SentenceCopyright
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_SentenceCopyright(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Word {
  Furigana get word;
  List<Definition> get definitions;
  List<Collocation> get collocations;
  List<OtherForm> get otherForms;
  List<Note> get notes;
  List<int> get wanikaniLevels;
  bool get isCommon;
  bool get hasWikipedia;
  String? get id;
  String? get inflectionCode;
  String? get audioUrl;
  JLPTLevel? get jlptLevel;
  WordDetails? get details;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WordCopyWith<Word> get copyWith =>
      _$WordCopyWithImpl<Word>(this as Word, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Word;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Word &&
            const DeepCollectionEquality().equals(other.word, _this.word) &&
            const DeepCollectionEquality()
                .equals(other.definitions, _this.definitions) &&
            const DeepCollectionEquality()
                .equals(other.collocations, _this.collocations) &&
            const DeepCollectionEquality()
                .equals(other.otherForms, _this.otherForms) &&
            const DeepCollectionEquality().equals(other.notes, _this.notes) &&
            const DeepCollectionEquality()
                .equals(other.wanikaniLevels, _this.wanikaniLevels) &&
            (identical(other.isCommon, _this.isCommon) ||
                other.isCommon == _this.isCommon) &&
            (identical(other.hasWikipedia, _this.hasWikipedia) ||
                other.hasWikipedia == _this.hasWikipedia) &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.inflectionCode, _this.inflectionCode) ||
                other.inflectionCode == _this.inflectionCode) &&
            (identical(other.audioUrl, _this.audioUrl) ||
                other.audioUrl == _this.audioUrl) &&
            (identical(other.jlptLevel, _this.jlptLevel) ||
                other.jlptLevel == _this.jlptLevel) &&
            (identical(other.details, _this.details) ||
                other.details == _this.details));
  }

  @override
  int get hashCode {
    final _this = this as Word;
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_this.word),
        const DeepCollectionEquality().hash(_this.definitions),
        const DeepCollectionEquality().hash(_this.collocations),
        const DeepCollectionEquality().hash(_this.otherForms),
        const DeepCollectionEquality().hash(_this.notes),
        const DeepCollectionEquality().hash(_this.wanikaniLevels),
        _this.isCommon,
        _this.hasWikipedia,
        _this.id,
        _this.inflectionCode,
        _this.audioUrl,
        _this.jlptLevel,
        _this.details);
  }

  @override
  String toString() {
    final _this = this as Word;
    return 'Word(word: ${_this.word}, definitions: ${_this.definitions}, collocations: ${_this.collocations}, otherForms: ${_this.otherForms}, notes: ${_this.notes}, wanikaniLevels: ${_this.wanikaniLevels}, isCommon: ${_this.isCommon}, hasWikipedia: ${_this.hasWikipedia}, id: ${_this.id}, inflectionCode: ${_this.inflectionCode}, audioUrl: ${_this.audioUrl}, jlptLevel: ${_this.jlptLevel}, details: ${_this.details})';
  }
}

/// @nodoc
abstract mixin class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) _then) =
      _$WordCopyWithImpl;
  @useResult
  $Res call(
      {Furigana word,
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
class _$WordCopyWithImpl<$Res> implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._self, this._then);

  final Word _self;
  final $Res Function(Word) _then;

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
    return _then(Word(
      word: null == word
          ? _self.word
          : word // ignore: cast_nullable_to_non_nullable
              as Furigana,
      definitions: null == definitions
          ? _self.definitions
          : definitions // ignore: cast_nullable_to_non_nullable
              as List<Definition>,
      collocations: null == collocations
          ? _self.collocations
          : collocations // ignore: cast_nullable_to_non_nullable
              as List<Collocation>,
      otherForms: null == otherForms
          ? _self.otherForms
          : otherForms // ignore: cast_nullable_to_non_nullable
              as List<OtherForm>,
      notes: null == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      wanikaniLevels: null == wanikaniLevels
          ? _self.wanikaniLevels
          : wanikaniLevels // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isCommon: null == isCommon
          ? _self.isCommon
          : isCommon // ignore: cast_nullable_to_non_nullable
              as bool,
      hasWikipedia: null == hasWikipedia
          ? _self.hasWikipedia
          : hasWikipedia // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      inflectionCode: freezed == inflectionCode
          ? _self.inflectionCode
          : inflectionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _self.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      jlptLevel: freezed == jlptLevel
          ? _self.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as JLPTLevel?,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as WordDetails?,
    ));
  }

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
      return null;
    }

    return $WordDetailsCopyWith<$Res>(_self.details!, (value) {
      return _then(_self.copyWith(details: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Word].
extension WordPatterns on Word {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Word value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Word() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Word value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Word():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Word value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Word() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Furigana word,
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
            WordDetails? details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Word() when $default != null:
        return $default(
            _that.word,
            _that.definitions,
            _that.collocations,
            _that.otherForms,
            _that.notes,
            _that.wanikaniLevels,
            _that.isCommon,
            _that.hasWikipedia,
            _that.id,
            _that.inflectionCode,
            _that.audioUrl,
            _that.jlptLevel,
            _that.details);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Furigana word,
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
            WordDetails? details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Word():
        return $default(
            _that.word,
            _that.definitions,
            _that.collocations,
            _that.otherForms,
            _that.notes,
            _that.wanikaniLevels,
            _that.isCommon,
            _that.hasWikipedia,
            _that.id,
            _that.inflectionCode,
            _that.audioUrl,
            _that.jlptLevel,
            _that.details);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            Furigana word,
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
            WordDetails? details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Word() when $default != null:
        return $default(
            _that.word,
            _that.definitions,
            _that.collocations,
            _that.otherForms,
            _that.notes,
            _that.wanikaniLevels,
            _that.isCommon,
            _that.hasWikipedia,
            _that.id,
            _that.inflectionCode,
            _that.audioUrl,
            _that.jlptLevel,
            _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Word extends Word {
  const _Word(
      {required Furigana word,
      required List<Definition> definitions,
      List<Collocation> collocations = const [],
      List<OtherForm> otherForms = const [],
      List<Note> notes = const [],
      List<int> wanikaniLevels = const [],
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

  final Furigana _word;
  @override
  Furigana get word {
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

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WordCopyWith<_Word> get copyWith =>
      __$WordCopyWithImpl<_Word>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Word &&
            const DeepCollectionEquality().equals(other.word, _word) &&
            const DeepCollectionEquality()
                .equals(other.definitions, _definitions) &&
            const DeepCollectionEquality()
                .equals(other.collocations, _collocations) &&
            const DeepCollectionEquality()
                .equals(other.otherForms, _otherForms) &&
            const DeepCollectionEquality().equals(other.notes, _notes) &&
            const DeepCollectionEquality()
                .equals(other.wanikaniLevels, _wanikaniLevels) &&
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
  int get hashCode {
    return Object.hash(
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
  }

  @override
  String toString() {
    return 'Word(word: $word, definitions: $definitions, collocations: $collocations, otherForms: $otherForms, notes: $notes, wanikaniLevels: $wanikaniLevels, isCommon: $isCommon, hasWikipedia: $hasWikipedia, id: $id, inflectionCode: $inflectionCode, audioUrl: $audioUrl, jlptLevel: $jlptLevel, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$WordCopyWith(_Word value, $Res Function(_Word) _then) =
      __$WordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Furigana word,
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
class __$WordCopyWithImpl<$Res> implements _$WordCopyWith<$Res> {
  __$WordCopyWithImpl(this._self, this._then);

  final _Word _self;
  final $Res Function(_Word) _then;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Word(
      word: null == word
          ? _self._word
          : word // ignore: cast_nullable_to_non_nullable
              as Furigana,
      definitions: null == definitions
          ? _self._definitions
          : definitions // ignore: cast_nullable_to_non_nullable
              as List<Definition>,
      collocations: null == collocations
          ? _self._collocations
          : collocations // ignore: cast_nullable_to_non_nullable
              as List<Collocation>,
      otherForms: null == otherForms
          ? _self._otherForms
          : otherForms // ignore: cast_nullable_to_non_nullable
              as List<OtherForm>,
      notes: null == notes
          ? _self._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      wanikaniLevels: null == wanikaniLevels
          ? _self._wanikaniLevels
          : wanikaniLevels // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isCommon: null == isCommon
          ? _self.isCommon
          : isCommon // ignore: cast_nullable_to_non_nullable
              as bool,
      hasWikipedia: null == hasWikipedia
          ? _self.hasWikipedia
          : hasWikipedia // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      inflectionCode: freezed == inflectionCode
          ? _self.inflectionCode
          : inflectionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _self.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      jlptLevel: freezed == jlptLevel
          ? _self.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as JLPTLevel?,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as WordDetails?,
    ));
  }

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
      return null;
    }

    return $WordDetailsCopyWith<$Res>(_self.details!, (value) {
      return _then(_self.copyWith(details: value));
    });
  }
}

/// @nodoc
mixin _$WordDetails {
  List<Kanji> get kanji;
  WikipediaInfo? get wikipedia;

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WordDetailsCopyWith<WordDetails> get copyWith =>
      _$WordDetailsCopyWithImpl<WordDetails>(this as WordDetails, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as WordDetails;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WordDetails &&
            const DeepCollectionEquality().equals(other.kanji, _this.kanji) &&
            (identical(other.wikipedia, _this.wikipedia) ||
                other.wikipedia == _this.wikipedia));
  }

  @override
  int get hashCode {
    final _this = this as WordDetails;
    return Object.hash(runtimeType,
        const DeepCollectionEquality().hash(_this.kanji), _this.wikipedia);
  }

  @override
  String toString() {
    final _this = this as WordDetails;
    return 'WordDetails(kanji: ${_this.kanji}, wikipedia: ${_this.wikipedia})';
  }
}

/// @nodoc
abstract mixin class $WordDetailsCopyWith<$Res> {
  factory $WordDetailsCopyWith(
          WordDetails value, $Res Function(WordDetails) _then) =
      _$WordDetailsCopyWithImpl;
  @useResult
  $Res call({List<Kanji> kanji, WikipediaInfo? wikipedia});

  $WikipediaInfoCopyWith<$Res>? get wikipedia;
}

/// @nodoc
class _$WordDetailsCopyWithImpl<$Res> implements $WordDetailsCopyWith<$Res> {
  _$WordDetailsCopyWithImpl(this._self, this._then);

  final WordDetails _self;
  final $Res Function(WordDetails) _then;

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kanji = null,
    Object? wikipedia = freezed,
  }) {
    return _then(WordDetails(
      kanji: null == kanji
          ? _self.kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as List<Kanji>,
      wikipedia: freezed == wikipedia
          ? _self.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as WikipediaInfo?,
    ));
  }

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaInfoCopyWith<$Res>? get wikipedia {
    if (_self.wikipedia == null) {
      return null;
    }

    return $WikipediaInfoCopyWith<$Res>(_self.wikipedia!, (value) {
      return _then(_self.copyWith(wikipedia: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WordDetails].
extension WordDetailsPatterns on WordDetails {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WordDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WordDetails() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WordDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WordDetails():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WordDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WordDetails() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Kanji> kanji, WikipediaInfo? wikipedia)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WordDetails() when $default != null:
        return $default(_that.kanji, _that.wikipedia);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Kanji> kanji, WikipediaInfo? wikipedia) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WordDetails():
        return $default(_that.kanji, _that.wikipedia);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Kanji> kanji, WikipediaInfo? wikipedia)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WordDetails() when $default != null:
        return $default(_that.kanji, _that.wikipedia);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WordDetails implements WordDetails {
  const _WordDetails({List<Kanji> kanji = const [], this.wikipedia})
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

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WordDetailsCopyWith<_WordDetails> get copyWith =>
      __$WordDetailsCopyWithImpl<_WordDetails>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WordDetails &&
            const DeepCollectionEquality().equals(other.kanji, _kanji) &&
            (identical(other.wikipedia, wikipedia) ||
                other.wikipedia == wikipedia));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(_kanji), wikipedia);
  }

  @override
  String toString() {
    return 'WordDetails(kanji: $kanji, wikipedia: $wikipedia)';
  }
}

/// @nodoc
abstract mixin class _$WordDetailsCopyWith<$Res>
    implements $WordDetailsCopyWith<$Res> {
  factory _$WordDetailsCopyWith(
          _WordDetails value, $Res Function(_WordDetails) _then) =
      __$WordDetailsCopyWithImpl;
  @override
  @useResult
  $Res call({List<Kanji> kanji, WikipediaInfo? wikipedia});

  @override
  $WikipediaInfoCopyWith<$Res>? get wikipedia;
}

/// @nodoc
class __$WordDetailsCopyWithImpl<$Res> implements _$WordDetailsCopyWith<$Res> {
  __$WordDetailsCopyWithImpl(this._self, this._then);

  final _WordDetails _self;
  final $Res Function(_WordDetails) _then;

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kanji = null,
    Object? wikipedia = freezed,
  }) {
    return _then(_WordDetails(
      kanji: null == kanji
          ? _self._kanji
          : kanji // ignore: cast_nullable_to_non_nullable
              as List<Kanji>,
      wikipedia: freezed == wikipedia
          ? _self.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as WikipediaInfo?,
    ));
  }

  /// Create a copy of WordDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaInfoCopyWith<$Res>? get wikipedia {
    if (_self.wikipedia == null) {
      return null;
    }

    return $WikipediaInfoCopyWith<$Res>(_self.wikipedia!, (value) {
      return _then(_self.copyWith(wikipedia: value));
    });
  }
}

/// @nodoc
mixin _$Definition {
  List<String> get meanings;
  List<String> get types;
  List<String> get tags;
  List<String> get seeAlso;
  Sentence? get exampleSentence;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DefinitionCopyWith<Definition> get copyWith =>
      _$DefinitionCopyWithImpl<Definition>(this as Definition, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Definition;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Definition &&
            const DeepCollectionEquality()
                .equals(other.meanings, _this.meanings) &&
            const DeepCollectionEquality().equals(other.types, _this.types) &&
            const DeepCollectionEquality().equals(other.tags, _this.tags) &&
            const DeepCollectionEquality()
                .equals(other.seeAlso, _this.seeAlso) &&
            (identical(other.exampleSentence, _this.exampleSentence) ||
                other.exampleSentence == _this.exampleSentence));
  }

  @override
  int get hashCode {
    final _this = this as Definition;
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_this.meanings),
        const DeepCollectionEquality().hash(_this.types),
        const DeepCollectionEquality().hash(_this.tags),
        const DeepCollectionEquality().hash(_this.seeAlso),
        _this.exampleSentence);
  }

  @override
  String toString() {
    final _this = this as Definition;
    return 'Definition(meanings: ${_this.meanings}, types: ${_this.types}, tags: ${_this.tags}, seeAlso: ${_this.seeAlso}, exampleSentence: ${_this.exampleSentence})';
  }
}

/// @nodoc
abstract mixin class $DefinitionCopyWith<$Res> {
  factory $DefinitionCopyWith(
          Definition value, $Res Function(Definition) _then) =
      _$DefinitionCopyWithImpl;
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
class _$DefinitionCopyWithImpl<$Res> implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._self, this._then);

  final Definition _self;
  final $Res Function(Definition) _then;

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
    return _then(Definition(
      meanings: null == meanings
          ? _self.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seeAlso: null == seeAlso
          ? _self.seeAlso
          : seeAlso // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exampleSentence: freezed == exampleSentence
          ? _self.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as Sentence?,
    ));
  }

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SentenceCopyWith<$Res>? get exampleSentence {
    if (_self.exampleSentence == null) {
      return null;
    }

    return $SentenceCopyWith<$Res>(_self.exampleSentence!, (value) {
      return _then(_self.copyWith(exampleSentence: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Definition].
extension DefinitionPatterns on Definition {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Definition value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Definition() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Definition value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Definition():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Definition value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Definition() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<String> meanings, List<String> types,
            List<String> tags, List<String> seeAlso, Sentence? exampleSentence)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Definition() when $default != null:
        return $default(_that.meanings, _that.types, _that.tags, _that.seeAlso,
            _that.exampleSentence);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<String> meanings, List<String> types,
            List<String> tags, List<String> seeAlso, Sentence? exampleSentence)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Definition():
        return $default(_that.meanings, _that.types, _that.tags, _that.seeAlso,
            _that.exampleSentence);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<String> meanings, List<String> types,
            List<String> tags, List<String> seeAlso, Sentence? exampleSentence)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Definition() when $default != null:
        return $default(_that.meanings, _that.types, _that.tags, _that.seeAlso,
            _that.exampleSentence);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Definition implements Definition {
  const _Definition(
      {required List<String> meanings,
      List<String> types = const [],
      List<String> tags = const [],
      List<String> seeAlso = const [],
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

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DefinitionCopyWith<_Definition> get copyWith =>
      __$DefinitionCopyWithImpl<_Definition>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Definition &&
            const DeepCollectionEquality().equals(other.meanings, _meanings) &&
            const DeepCollectionEquality().equals(other.types, _types) &&
            const DeepCollectionEquality().equals(other.tags, _tags) &&
            const DeepCollectionEquality().equals(other.seeAlso, _seeAlso) &&
            (identical(other.exampleSentence, exampleSentence) ||
                other.exampleSentence == exampleSentence));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_meanings),
        const DeepCollectionEquality().hash(_types),
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_seeAlso),
        exampleSentence);
  }

  @override
  String toString() {
    return 'Definition(meanings: $meanings, types: $types, tags: $tags, seeAlso: $seeAlso, exampleSentence: $exampleSentence)';
  }
}

/// @nodoc
abstract mixin class _$DefinitionCopyWith<$Res>
    implements $DefinitionCopyWith<$Res> {
  factory _$DefinitionCopyWith(
          _Definition value, $Res Function(_Definition) _then) =
      __$DefinitionCopyWithImpl;
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
class __$DefinitionCopyWithImpl<$Res> implements _$DefinitionCopyWith<$Res> {
  __$DefinitionCopyWithImpl(this._self, this._then);

  final _Definition _self;
  final $Res Function(_Definition) _then;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? meanings = null,
    Object? types = null,
    Object? tags = null,
    Object? seeAlso = null,
    Object? exampleSentence = freezed,
  }) {
    return _then(_Definition(
      meanings: null == meanings
          ? _self._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      types: null == types
          ? _self._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seeAlso: null == seeAlso
          ? _self._seeAlso
          : seeAlso // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exampleSentence: freezed == exampleSentence
          ? _self.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as Sentence?,
    ));
  }

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SentenceCopyWith<$Res>? get exampleSentence {
    if (_self.exampleSentence == null) {
      return null;
    }

    return $SentenceCopyWith<$Res>(_self.exampleSentence!, (value) {
      return _then(_self.copyWith(exampleSentence: value));
    });
  }
}

/// @nodoc
mixin _$WikipediaInfo {
  String get title;
  String get textAbstract;
  WikipediaPage? get wikipediaEnglish;
  WikipediaPage? get wikipediaJapanese;
  WikipediaPage? get dbpedia;

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WikipediaInfoCopyWith<WikipediaInfo> get copyWith =>
      _$WikipediaInfoCopyWithImpl<WikipediaInfo>(
          this as WikipediaInfo, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as WikipediaInfo;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WikipediaInfo &&
            (identical(other.title, _this.title) ||
                other.title == _this.title) &&
            (identical(other.textAbstract, _this.textAbstract) ||
                other.textAbstract == _this.textAbstract) &&
            (identical(other.wikipediaEnglish, _this.wikipediaEnglish) ||
                other.wikipediaEnglish == _this.wikipediaEnglish) &&
            (identical(other.wikipediaJapanese, _this.wikipediaJapanese) ||
                other.wikipediaJapanese == _this.wikipediaJapanese) &&
            (identical(other.dbpedia, _this.dbpedia) ||
                other.dbpedia == _this.dbpedia));
  }

  @override
  int get hashCode {
    final _this = this as WikipediaInfo;
    return Object.hash(runtimeType, _this.title, _this.textAbstract,
        _this.wikipediaEnglish, _this.wikipediaJapanese, _this.dbpedia);
  }

  @override
  String toString() {
    final _this = this as WikipediaInfo;
    return 'WikipediaInfo(title: ${_this.title}, textAbstract: ${_this.textAbstract}, wikipediaEnglish: ${_this.wikipediaEnglish}, wikipediaJapanese: ${_this.wikipediaJapanese}, dbpedia: ${_this.dbpedia})';
  }
}

/// @nodoc
abstract mixin class $WikipediaInfoCopyWith<$Res> {
  factory $WikipediaInfoCopyWith(
          WikipediaInfo value, $Res Function(WikipediaInfo) _then) =
      _$WikipediaInfoCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String textAbstract,
      WikipediaPage? wikipediaEnglish,
      WikipediaPage? wikipediaJapanese,
      WikipediaPage? dbpedia});

  $WikipediaPageCopyWith<$Res>? get wikipediaEnglish;
  $WikipediaPageCopyWith<$Res>? get wikipediaJapanese;
  $WikipediaPageCopyWith<$Res>? get dbpedia;
}

/// @nodoc
class _$WikipediaInfoCopyWithImpl<$Res>
    implements $WikipediaInfoCopyWith<$Res> {
  _$WikipediaInfoCopyWithImpl(this._self, this._then);

  final WikipediaInfo _self;
  final $Res Function(WikipediaInfo) _then;

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? textAbstract = null,
    Object? wikipediaEnglish = freezed,
    Object? wikipediaJapanese = freezed,
    Object? dbpedia = freezed,
  }) {
    return _then(WikipediaInfo(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      textAbstract: null == textAbstract
          ? _self.textAbstract
          : textAbstract // ignore: cast_nullable_to_non_nullable
              as String,
      wikipediaEnglish: freezed == wikipediaEnglish
          ? _self.wikipediaEnglish
          : wikipediaEnglish // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
      wikipediaJapanese: freezed == wikipediaJapanese
          ? _self.wikipediaJapanese
          : wikipediaJapanese // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
      dbpedia: freezed == dbpedia
          ? _self.dbpedia
          : dbpedia // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
    ));
  }

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaPageCopyWith<$Res>? get wikipediaEnglish {
    if (_self.wikipediaEnglish == null) {
      return null;
    }

    return $WikipediaPageCopyWith<$Res>(_self.wikipediaEnglish!, (value) {
      return _then(_self.copyWith(wikipediaEnglish: value));
    });
  }

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaPageCopyWith<$Res>? get wikipediaJapanese {
    if (_self.wikipediaJapanese == null) {
      return null;
    }

    return $WikipediaPageCopyWith<$Res>(_self.wikipediaJapanese!, (value) {
      return _then(_self.copyWith(wikipediaJapanese: value));
    });
  }

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaPageCopyWith<$Res>? get dbpedia {
    if (_self.dbpedia == null) {
      return null;
    }

    return $WikipediaPageCopyWith<$Res>(_self.dbpedia!, (value) {
      return _then(_self.copyWith(dbpedia: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WikipediaInfo].
extension WikipediaInfoPatterns on WikipediaInfo {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WikipediaInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WikipediaInfo() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WikipediaInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WikipediaInfo():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WikipediaInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WikipediaInfo() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String title,
            String textAbstract,
            WikipediaPage? wikipediaEnglish,
            WikipediaPage? wikipediaJapanese,
            WikipediaPage? dbpedia)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WikipediaInfo() when $default != null:
        return $default(_that.title, _that.textAbstract, _that.wikipediaEnglish,
            _that.wikipediaJapanese, _that.dbpedia);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String title,
            String textAbstract,
            WikipediaPage? wikipediaEnglish,
            WikipediaPage? wikipediaJapanese,
            WikipediaPage? dbpedia)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WikipediaInfo():
        return $default(_that.title, _that.textAbstract, _that.wikipediaEnglish,
            _that.wikipediaJapanese, _that.dbpedia);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String title,
            String textAbstract,
            WikipediaPage? wikipediaEnglish,
            WikipediaPage? wikipediaJapanese,
            WikipediaPage? dbpedia)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WikipediaInfo() when $default != null:
        return $default(_that.title, _that.textAbstract, _that.wikipediaEnglish,
            _that.wikipediaJapanese, _that.dbpedia);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WikipediaInfo implements WikipediaInfo {
  const _WikipediaInfo(
      {required this.title,
      required this.textAbstract,
      this.wikipediaEnglish,
      this.wikipediaJapanese,
      this.dbpedia});

  @override
  final String title;
  @override
  final String textAbstract;
  @override
  final WikipediaPage? wikipediaEnglish;
  @override
  final WikipediaPage? wikipediaJapanese;
  @override
  final WikipediaPage? dbpedia;

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WikipediaInfoCopyWith<_WikipediaInfo> get copyWith =>
      __$WikipediaInfoCopyWithImpl<_WikipediaInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WikipediaInfo &&
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
  int get hashCode {
    return Object.hash(runtimeType, title, textAbstract, wikipediaEnglish,
        wikipediaJapanese, dbpedia);
  }

  @override
  String toString() {
    return 'WikipediaInfo(title: $title, textAbstract: $textAbstract, wikipediaEnglish: $wikipediaEnglish, wikipediaJapanese: $wikipediaJapanese, dbpedia: $dbpedia)';
  }
}

/// @nodoc
abstract mixin class _$WikipediaInfoCopyWith<$Res>
    implements $WikipediaInfoCopyWith<$Res> {
  factory _$WikipediaInfoCopyWith(
          _WikipediaInfo value, $Res Function(_WikipediaInfo) _then) =
      __$WikipediaInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String textAbstract,
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
class __$WikipediaInfoCopyWithImpl<$Res>
    implements _$WikipediaInfoCopyWith<$Res> {
  __$WikipediaInfoCopyWithImpl(this._self, this._then);

  final _WikipediaInfo _self;
  final $Res Function(_WikipediaInfo) _then;

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? textAbstract = null,
    Object? wikipediaEnglish = freezed,
    Object? wikipediaJapanese = freezed,
    Object? dbpedia = freezed,
  }) {
    return _then(_WikipediaInfo(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      textAbstract: null == textAbstract
          ? _self.textAbstract
          : textAbstract // ignore: cast_nullable_to_non_nullable
              as String,
      wikipediaEnglish: freezed == wikipediaEnglish
          ? _self.wikipediaEnglish
          : wikipediaEnglish // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
      wikipediaJapanese: freezed == wikipediaJapanese
          ? _self.wikipediaJapanese
          : wikipediaJapanese // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
      dbpedia: freezed == dbpedia
          ? _self.dbpedia
          : dbpedia // ignore: cast_nullable_to_non_nullable
              as WikipediaPage?,
    ));
  }

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaPageCopyWith<$Res>? get wikipediaEnglish {
    if (_self.wikipediaEnglish == null) {
      return null;
    }

    return $WikipediaPageCopyWith<$Res>(_self.wikipediaEnglish!, (value) {
      return _then(_self.copyWith(wikipediaEnglish: value));
    });
  }

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaPageCopyWith<$Res>? get wikipediaJapanese {
    if (_self.wikipediaJapanese == null) {
      return null;
    }

    return $WikipediaPageCopyWith<$Res>(_self.wikipediaJapanese!, (value) {
      return _then(_self.copyWith(wikipediaJapanese: value));
    });
  }

  /// Create a copy of WikipediaInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WikipediaPageCopyWith<$Res>? get dbpedia {
    if (_self.dbpedia == null) {
      return null;
    }

    return $WikipediaPageCopyWith<$Res>(_self.dbpedia!, (value) {
      return _then(_self.copyWith(dbpedia: value));
    });
  }
}

/// @nodoc
mixin _$WikipediaPage {
  String get title;
  String get url;

  /// Create a copy of WikipediaPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WikipediaPageCopyWith<WikipediaPage> get copyWith =>
      _$WikipediaPageCopyWithImpl<WikipediaPage>(
          this as WikipediaPage, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as WikipediaPage;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WikipediaPage &&
            (identical(other.title, _this.title) ||
                other.title == _this.title) &&
            (identical(other.url, _this.url) || other.url == _this.url));
  }

  @override
  int get hashCode {
    final _this = this as WikipediaPage;
    return Object.hash(runtimeType, _this.title, _this.url);
  }

  @override
  String toString() {
    final _this = this as WikipediaPage;
    return 'WikipediaPage(title: ${_this.title}, url: ${_this.url})';
  }
}

/// @nodoc
abstract mixin class $WikipediaPageCopyWith<$Res> {
  factory $WikipediaPageCopyWith(
          WikipediaPage value, $Res Function(WikipediaPage) _then) =
      _$WikipediaPageCopyWithImpl;
  @useResult
  $Res call({String title, String url});
}

/// @nodoc
class _$WikipediaPageCopyWithImpl<$Res>
    implements $WikipediaPageCopyWith<$Res> {
  _$WikipediaPageCopyWithImpl(this._self, this._then);

  final WikipediaPage _self;
  final $Res Function(WikipediaPage) _then;

  /// Create a copy of WikipediaPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
  }) {
    return _then(WikipediaPage(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [WikipediaPage].
extension WikipediaPagePatterns on WikipediaPage {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WikipediaPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WikipediaPage() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WikipediaPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WikipediaPage():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WikipediaPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WikipediaPage() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String title, String url)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WikipediaPage() when $default != null:
        return $default(_that.title, _that.url);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String title, String url) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WikipediaPage():
        return $default(_that.title, _that.url);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String title, String url)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WikipediaPage() when $default != null:
        return $default(_that.title, _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WikipediaPage implements WikipediaPage {
  const _WikipediaPage({required this.title, required this.url});

  @override
  final String title;
  @override
  final String url;

  /// Create a copy of WikipediaPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WikipediaPageCopyWith<_WikipediaPage> get copyWith =>
      __$WikipediaPageCopyWithImpl<_WikipediaPage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WikipediaPage &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, title, url);
  }

  @override
  String toString() {
    return 'WikipediaPage(title: $title, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$WikipediaPageCopyWith<$Res>
    implements $WikipediaPageCopyWith<$Res> {
  factory _$WikipediaPageCopyWith(
          _WikipediaPage value, $Res Function(_WikipediaPage) _then) =
      __$WikipediaPageCopyWithImpl;
  @override
  @useResult
  $Res call({String title, String url});
}

/// @nodoc
class __$WikipediaPageCopyWithImpl<$Res>
    implements _$WikipediaPageCopyWith<$Res> {
  __$WikipediaPageCopyWithImpl(this._self, this._then);

  final _WikipediaPage _self;
  final $Res Function(_WikipediaPage) _then;

  /// Create a copy of WikipediaPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_WikipediaPage(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$OtherForm {
  String get form;
  String get reading;

  /// Create a copy of OtherForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OtherFormCopyWith<OtherForm> get copyWith =>
      _$OtherFormCopyWithImpl<OtherForm>(this as OtherForm, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as OtherForm;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OtherForm &&
            (identical(other.form, _this.form) || other.form == _this.form) &&
            (identical(other.reading, _this.reading) ||
                other.reading == _this.reading));
  }

  @override
  int get hashCode {
    final _this = this as OtherForm;
    return Object.hash(runtimeType, _this.form, _this.reading);
  }

  @override
  String toString() {
    final _this = this as OtherForm;
    return 'OtherForm(form: ${_this.form}, reading: ${_this.reading})';
  }
}

/// @nodoc
abstract mixin class $OtherFormCopyWith<$Res> {
  factory $OtherFormCopyWith(OtherForm value, $Res Function(OtherForm) _then) =
      _$OtherFormCopyWithImpl;
  @useResult
  $Res call({String form, String reading});
}

/// @nodoc
class _$OtherFormCopyWithImpl<$Res> implements $OtherFormCopyWith<$Res> {
  _$OtherFormCopyWithImpl(this._self, this._then);

  final OtherForm _self;
  final $Res Function(OtherForm) _then;

  /// Create a copy of OtherForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? reading = null,
  }) {
    return _then(OtherForm(
      form: null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _self.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [OtherForm].
extension OtherFormPatterns on OtherForm {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OtherForm value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OtherForm() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OtherForm value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OtherForm():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OtherForm value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OtherForm() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String form, String reading)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OtherForm() when $default != null:
        return $default(_that.form, _that.reading);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String form, String reading) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OtherForm():
        return $default(_that.form, _that.reading);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String form, String reading)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OtherForm() when $default != null:
        return $default(_that.form, _that.reading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OtherForm implements OtherForm {
  const _OtherForm({required this.form, required this.reading});

  @override
  final String form;
  @override
  final String reading;

  /// Create a copy of OtherForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OtherFormCopyWith<_OtherForm> get copyWith =>
      __$OtherFormCopyWithImpl<_OtherForm>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OtherForm &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.reading, reading) || other.reading == reading));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, form, reading);
  }

  @override
  String toString() {
    return 'OtherForm(form: $form, reading: $reading)';
  }
}

/// @nodoc
abstract mixin class _$OtherFormCopyWith<$Res>
    implements $OtherFormCopyWith<$Res> {
  factory _$OtherFormCopyWith(
          _OtherForm value, $Res Function(_OtherForm) _then) =
      __$OtherFormCopyWithImpl;
  @override
  @useResult
  $Res call({String form, String reading});
}

/// @nodoc
class __$OtherFormCopyWithImpl<$Res> implements _$OtherFormCopyWith<$Res> {
  __$OtherFormCopyWithImpl(this._self, this._then);

  final _OtherForm _self;
  final $Res Function(_OtherForm) _then;

  /// Create a copy of OtherForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? form = null,
    Object? reading = null,
  }) {
    return _then(_OtherForm(
      form: null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _self.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Collocation {
  String get word;
  String get meaning;

  /// Create a copy of Collocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CollocationCopyWith<Collocation> get copyWith =>
      _$CollocationCopyWithImpl<Collocation>(this as Collocation, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Collocation;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Collocation &&
            (identical(other.word, _this.word) || other.word == _this.word) &&
            (identical(other.meaning, _this.meaning) ||
                other.meaning == _this.meaning));
  }

  @override
  int get hashCode {
    final _this = this as Collocation;
    return Object.hash(runtimeType, _this.word, _this.meaning);
  }

  @override
  String toString() {
    final _this = this as Collocation;
    return 'Collocation(word: ${_this.word}, meaning: ${_this.meaning})';
  }
}

/// @nodoc
abstract mixin class $CollocationCopyWith<$Res> {
  factory $CollocationCopyWith(
          Collocation value, $Res Function(Collocation) _then) =
      _$CollocationCopyWithImpl;
  @useResult
  $Res call({String word, String meaning});
}

/// @nodoc
class _$CollocationCopyWithImpl<$Res> implements $CollocationCopyWith<$Res> {
  _$CollocationCopyWithImpl(this._self, this._then);

  final Collocation _self;
  final $Res Function(Collocation) _then;

  /// Create a copy of Collocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? meaning = null,
  }) {
    return _then(Collocation(
      word: null == word
          ? _self.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _self.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Collocation].
extension CollocationPatterns on Collocation {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Collocation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Collocation() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Collocation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Collocation():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Collocation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Collocation() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String word, String meaning)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Collocation() when $default != null:
        return $default(_that.word, _that.meaning);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String word, String meaning) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Collocation():
        return $default(_that.word, _that.meaning);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String word, String meaning)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Collocation() when $default != null:
        return $default(_that.word, _that.meaning);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Collocation implements Collocation {
  const _Collocation({required this.word, required this.meaning});

  @override
  final String word;
  @override
  final String meaning;

  /// Create a copy of Collocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CollocationCopyWith<_Collocation> get copyWith =>
      __$CollocationCopyWithImpl<_Collocation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Collocation &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.meaning, meaning) || other.meaning == meaning));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, word, meaning);
  }

  @override
  String toString() {
    return 'Collocation(word: $word, meaning: $meaning)';
  }
}

/// @nodoc
abstract mixin class _$CollocationCopyWith<$Res>
    implements $CollocationCopyWith<$Res> {
  factory _$CollocationCopyWith(
          _Collocation value, $Res Function(_Collocation) _then) =
      __$CollocationCopyWithImpl;
  @override
  @useResult
  $Res call({String word, String meaning});
}

/// @nodoc
class __$CollocationCopyWithImpl<$Res> implements _$CollocationCopyWith<$Res> {
  __$CollocationCopyWithImpl(this._self, this._then);

  final _Collocation _self;
  final $Res Function(_Collocation) _then;

  /// Create a copy of Collocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? word = null,
    Object? meaning = null,
  }) {
    return _then(_Collocation(
      word: null == word
          ? _self.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _self.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Note {
  String get form;
  String get note;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NoteCopyWith<Note> get copyWith =>
      _$NoteCopyWithImpl<Note>(this as Note, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Note;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Note &&
            (identical(other.form, _this.form) || other.form == _this.form) &&
            (identical(other.note, _this.note) || other.note == _this.note));
  }

  @override
  int get hashCode {
    final _this = this as Note;
    return Object.hash(runtimeType, _this.form, _this.note);
  }

  @override
  String toString() {
    final _this = this as Note;
    return 'Note(form: ${_this.form}, note: ${_this.note})';
  }
}

/// @nodoc
abstract mixin class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) _then) =
      _$NoteCopyWithImpl;
  @useResult
  $Res call({String form, String note});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res> implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._self, this._then);

  final Note _self;
  final $Res Function(Note) _then;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? note = null,
  }) {
    return _then(Note(
      form: null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Note].
extension NotePatterns on Note {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Note value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Note() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Note value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Note():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Note value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Note() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String form, String note)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Note() when $default != null:
        return $default(_that.form, _that.note);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String form, String note) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Note():
        return $default(_that.form, _that.note);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String form, String note)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Note() when $default != null:
        return $default(_that.form, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Note implements Note {
  const _Note({required this.form, required this.note});

  @override
  final String form;
  @override
  final String note;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NoteCopyWith<_Note> get copyWith =>
      __$NoteCopyWithImpl<_Note>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Note &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, form, note);
  }

  @override
  String toString() {
    return 'Note(form: $form, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$NoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$NoteCopyWith(_Note value, $Res Function(_Note) _then) =
      __$NoteCopyWithImpl;
  @override
  @useResult
  $Res call({String form, String note});
}

/// @nodoc
class __$NoteCopyWithImpl<$Res> implements _$NoteCopyWith<$Res> {
  __$NoteCopyWithImpl(this._self, this._then);

  final _Note _self;
  final $Res Function(_Note) _then;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? form = null,
    Object? note = null,
  }) {
    return _then(_Note(
      form: null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
