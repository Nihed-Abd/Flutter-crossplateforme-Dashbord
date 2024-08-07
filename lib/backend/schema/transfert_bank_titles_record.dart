import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransfertBankTitlesRecord extends FirestoreRecord {
  TransfertBankTitlesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TransfertBankTitles');

  static Stream<TransfertBankTitlesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransfertBankTitlesRecord.fromSnapshot(s));

  static Future<TransfertBankTitlesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TransfertBankTitlesRecord.fromSnapshot(s));

  static TransfertBankTitlesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransfertBankTitlesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransfertBankTitlesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransfertBankTitlesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransfertBankTitlesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransfertBankTitlesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransfertBankTitlesRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransfertBankTitlesRecordDocumentEquality
    implements Equality<TransfertBankTitlesRecord> {
  const TransfertBankTitlesRecordDocumentEquality();

  @override
  bool equals(TransfertBankTitlesRecord? e1, TransfertBankTitlesRecord? e2) {
    return e1?.title == e2?.title;
  }

  @override
  int hash(TransfertBankTitlesRecord? e) =>
      const ListEquality().hash([e?.title]);

  @override
  bool isValidKey(Object? o) => o is TransfertBankTitlesRecord;
}
