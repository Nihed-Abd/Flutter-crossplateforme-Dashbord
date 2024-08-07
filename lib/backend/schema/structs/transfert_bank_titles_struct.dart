// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransfertBankTitlesStruct extends FFFirebaseStruct {
  TransfertBankTitlesStruct({
    String? title,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static TransfertBankTitlesStruct fromMap(Map<String, dynamic> data) =>
      TransfertBankTitlesStruct(
        title: data['title'] as String?,
      );

  static TransfertBankTitlesStruct? maybeFromMap(dynamic data) => data is Map
      ? TransfertBankTitlesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static TransfertBankTitlesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TransfertBankTitlesStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TransfertBankTitlesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransfertBankTitlesStruct && title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([title]);
}

TransfertBankTitlesStruct createTransfertBankTitlesStruct({
  String? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TransfertBankTitlesStruct(
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TransfertBankTitlesStruct? updateTransfertBankTitlesStruct(
  TransfertBankTitlesStruct? transfertBankTitles, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    transfertBankTitles
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTransfertBankTitlesStructData(
  Map<String, dynamic> firestoreData,
  TransfertBankTitlesStruct? transfertBankTitles,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (transfertBankTitles == null) {
    return;
  }
  if (transfertBankTitles.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && transfertBankTitles.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final transfertBankTitlesData =
      getTransfertBankTitlesFirestoreData(transfertBankTitles, forFieldValue);
  final nestedData =
      transfertBankTitlesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      transfertBankTitles.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTransfertBankTitlesFirestoreData(
  TransfertBankTitlesStruct? transfertBankTitles, [
  bool forFieldValue = false,
]) {
  if (transfertBankTitles == null) {
    return {};
  }
  final firestoreData = mapToFirestore(transfertBankTitles.toMap());

  // Add any Firestore field values
  transfertBankTitles.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTransfertBankTitlesListFirestoreData(
  List<TransfertBankTitlesStruct>? transfertBankTitless,
) =>
    transfertBankTitless
        ?.map((e) => getTransfertBankTitlesFirestoreData(e, true))
        .toList() ??
    [];
