import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditDepotRecord extends FirestoreRecord {
  CreditDepotRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "montantDepot" field.
  double? _montantDepot;
  double get montantDepot => _montantDepot ?? 0.0;
  bool hasMontantDepot() => _montantDepot != null;

  // "mois" field.
  String? _mois;
  String get mois => _mois ?? '';
  bool hasMois() => _mois != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "file" field.
  String? _file;
  String get file => _file ?? '';
  bool hasFile() => _file != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _date = snapshotData['date'] as String?;
    _montantDepot = castToType<double>(snapshotData['montantDepot']);
    _mois = snapshotData['mois'] as String?;
    _year = snapshotData['year'] as String?;
    _file = snapshotData['file'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('creditDepot');

  static Stream<CreditDepotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreditDepotRecord.fromSnapshot(s));

  static Future<CreditDepotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CreditDepotRecord.fromSnapshot(s));

  static CreditDepotRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreditDepotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreditDepotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreditDepotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreditDepotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreditDepotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreditDepotRecordData({
  int? id,
  String? date,
  double? montantDepot,
  String? mois,
  String? year,
  String? file,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'date': date,
      'montantDepot': montantDepot,
      'mois': mois,
      'year': year,
      'file': file,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreditDepotRecordDocumentEquality implements Equality<CreditDepotRecord> {
  const CreditDepotRecordDocumentEquality();

  @override
  bool equals(CreditDepotRecord? e1, CreditDepotRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.date == e2?.date &&
        e1?.montantDepot == e2?.montantDepot &&
        e1?.mois == e2?.mois &&
        e1?.year == e2?.year &&
        e1?.file == e2?.file;
  }

  @override
  int hash(CreditDepotRecord? e) => const ListEquality()
      .hash([e?.id, e?.date, e?.montantDepot, e?.mois, e?.year, e?.file]);

  @override
  bool isValidKey(Object? o) => o is CreditDepotRecord;
}
