import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'old_edits_struct.g.dart';

abstract class OldEditsStruct
    implements Built<OldEditsStruct, OldEditsStructBuilder> {
  static Serializer<OldEditsStruct> get serializer =>
      _$oldEditsStructSerializer;

  DateTime? get date;

  String? get image;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(OldEditsStructBuilder builder) => builder
    ..image = ''
    ..firestoreUtilData = FirestoreUtilData();

  OldEditsStruct._();
  factory OldEditsStruct([void Function(OldEditsStructBuilder) updates]) =
      _$OldEditsStruct;
}

OldEditsStruct createOldEditsStruct({
  DateTime? date,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OldEditsStruct(
      (o) => o
        ..date = date
        ..image = image
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

OldEditsStruct? updateOldEditsStruct(
  OldEditsStruct? oldEdits, {
  bool clearUnsetFields = true,
}) =>
    oldEdits != null
        ? (oldEdits.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addOldEditsStructData(
  Map<String, dynamic> firestoreData,
  OldEditsStruct? oldEdits,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (oldEdits == null) {
    return;
  }
  if (oldEdits.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && oldEdits.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final oldEditsData = getOldEditsFirestoreData(oldEdits, forFieldValue);
  final nestedData = oldEditsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = oldEdits.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getOldEditsFirestoreData(
  OldEditsStruct? oldEdits, [
  bool forFieldValue = false,
]) {
  if (oldEdits == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(OldEditsStruct.serializer, oldEdits);

  // Add any Firestore field values
  oldEdits.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOldEditsListFirestoreData(
  List<OldEditsStruct>? oldEditss,
) =>
    oldEditss?.map((o) => getOldEditsFirestoreData(o, true)).toList() ?? [];
