import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WithdrawalRecord extends FirestoreRecord {
  WithdrawalRecord._(
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

  // "titreString" field.
  String? _titreString;
  String get titreString => _titreString ?? '';
  bool hasTitreString() => _titreString != null;

  // "file" field.
  String? _file;
  String get file => _file ?? '';
  bool hasFile() => _file != null;

  void _initializeFields() {
    _montant = castToType<double>(snapshotData['montant']);
    _mois = snapshotData['mois'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _remarque = snapshotData['remarque'] as String?;
    _year = snapshotData['year'] as String?;
    _titre = snapshotData['titre'] as DocumentReference?;
    _titreString = snapshotData['titreString'] as String?;
    _file = snapshotData['file'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('withdrawal');

  static Stream<WithdrawalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WithdrawalRecord.fromSnapshot(s));

  static Future<WithdrawalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WithdrawalRecord.fromSnapshot(s));

  static WithdrawalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WithdrawalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WithdrawalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WithdrawalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WithdrawalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WithdrawalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWithdrawalRecordData({
  double? montant,
  String? mois,
  DateTime? date,
  String? remarque,
  String? year,
  DocumentReference? titre,
  String? titreString,
  String? file,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'montant': montant,
      'mois': mois,
      'date': date,
      'remarque': remarque,
      'year': year,
      'titre': titre,
      'titreString': titreString,
      'file': file,
    }.withoutNulls,
  );

  return firestoreData;
}

class WithdrawalRecordDocumentEquality implements Equality<WithdrawalRecord> {
  const WithdrawalRecordDocumentEquality();

  @override
  bool equals(WithdrawalRecord? e1, WithdrawalRecord? e2) {
    return e1?.montant == e2?.montant &&
        e1?.mois == e2?.mois &&
        e1?.date == e2?.date &&
        e1?.remarque == e2?.remarque &&
        e1?.year == e2?.year &&
        e1?.titre == e2?.titre &&
        e1?.titreString == e2?.titreString &&
        e1?.file == e2?.file;
  }

  @override
  int hash(WithdrawalRecord? e) => const ListEquality().hash([
        e?.montant,
        e?.mois,
        e?.date,
        e?.remarque,
        e?.year,
        e?.titre,
        e?.titreString,
        e?.file
      ]);

  @override
  bool isValidKey(Object? o) => o is WithdrawalRecord;
}
