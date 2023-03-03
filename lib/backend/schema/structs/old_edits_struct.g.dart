// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_edits_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OldEditsStruct> _$oldEditsStructSerializer =
    new _$OldEditsStructSerializer();

class _$OldEditsStructSerializer
    implements StructuredSerializer<OldEditsStruct> {
  @override
  final Iterable<Type> types = const [OldEditsStruct, _$OldEditsStruct];
  @override
  final String wireName = 'OldEditsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, OldEditsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  OldEditsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OldEditsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$OldEditsStruct extends OldEditsStruct {
  @override
  final DateTime? date;
  @override
  final String? image;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$OldEditsStruct([void Function(OldEditsStructBuilder)? updates]) =>
      (new OldEditsStructBuilder()..update(updates))._build();

  _$OldEditsStruct._({this.date, this.image, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'OldEditsStruct', 'firestoreUtilData');
  }

  @override
  OldEditsStruct rebuild(void Function(OldEditsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OldEditsStructBuilder toBuilder() =>
      new OldEditsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OldEditsStruct &&
        date == other.date &&
        image == other.image &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, date.hashCode), image.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OldEditsStruct')
          ..add('date', date)
          ..add('image', image)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class OldEditsStructBuilder
    implements Builder<OldEditsStruct, OldEditsStructBuilder> {
  _$OldEditsStruct? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  OldEditsStructBuilder() {
    OldEditsStruct._initializeBuilder(this);
  }

  OldEditsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _image = $v.image;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OldEditsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OldEditsStruct;
  }

  @override
  void update(void Function(OldEditsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OldEditsStruct build() => _build();

  _$OldEditsStruct _build() {
    final _$result = _$v ??
        new _$OldEditsStruct._(
            date: date,
            image: image,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'OldEditsStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
