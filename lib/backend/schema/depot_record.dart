import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepotRecord extends FirestoreRecord {
  DepotRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "montant" field.
  double? _montant;
  double get montant => _montant ?? 0.0;
  bool hasMontant() => _montant != null;

  // "mois" field.
  String? _mois;
  String get mois => _mois ?? '';
  bool hasMois() => _mois != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "remarque" field.
  String? _remarque;
  String get remarque => _remarque ?? '';
  bool hasRemarque() => _remarque != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "titre" field.
  DocumentReference? _titre;
  DocumentReference? get titre => _titre;
  bool hasTitre() => _titre != null;

  void _initializeFields() {
    _montant = castToType<double>(snapshotData['montant']);
    _mois = snapshotData['mois'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _remarque = snapshotData['remarque'] as String?;
    _year = snapshotData['year'] as String?;
    _titre = snapshotData['titre'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Depot');

  static Stream<DepotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DepotRecord.fromSnapshot(s));

  static Future<DepotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DepotRecord.fromSnapshot(s));

  static DepotRecord fromSnapshot(DocumentSnapshot snapshot) => DepotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DepotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DepotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DepotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DepotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDepotRecordData({
  double? montant,
  String? mois,
  DateTime? date,
  String? remarque,
  String? year,
  DocumentReference? titre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'montant': montant,
      'mois': mois,
      'date': date,
      'remarque': remarque,
      'year': year,
      'titre': titre,
    }.withoutNulls,
  );

  return firestoreData;
}

class DepotRecordDocumentEquality implements Equality<DepotRecord> {
  const DepotRecordDocumentEquality();

  @override
  bool equals(DepotRecord? e1, DepotRecord? e2) {
    return e1?.montant == e2?.montant &&
        e1?.mois == e2?.mois &&
        e1?.date == e2?.date &&
        e1?.remarque == e2?.remarque &&
        e1?.year == e2?.year &&
        e1?.titre == e2?.titre;
  }

  @override
  int hash(DepotRecord? e) => const ListEquality()
      .hash([e?.montant, e?.mois, e?.date, e?.remarque, e?.year, e?.titre]);

  @override
  bool isValidKey(Object? o) => o is DepotRecord;
}
