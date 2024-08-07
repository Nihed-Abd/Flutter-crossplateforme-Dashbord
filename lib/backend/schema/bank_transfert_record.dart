import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BankTransfertRecord extends FirestoreRecord {
  BankTransfertRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "montantPaye" field.
  double? _montantPaye;
  double get montantPaye => _montantPaye ?? 0.0;
  bool hasMontantPaye() => _montantPaye != null;

  // "montantReste" field.
  double? _montantReste;
  double get montantReste => _montantReste ?? 0.0;
  bool hasMontantReste() => _montantReste != null;

  // "montantTrensferer" field.
  double? _montantTrensferer;
  double get montantTrensferer => _montantTrensferer ?? 0.0;
  bool hasMontantTrensferer() => _montantTrensferer != null;

  // "mois" field.
  String? _mois;
  String get mois => _mois ?? '';
  bool hasMois() => _mois != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "numFile" field.
  int? _numFile;
  int get numFile => _numFile ?? 0;
  bool hasNumFile() => _numFile != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _montantPaye = castToType<double>(snapshotData['montantPaye']);
    _montantReste = castToType<double>(snapshotData['montantReste']);
    _montantTrensferer = castToType<double>(snapshotData['montantTrensferer']);
    _mois = snapshotData['mois'] as String?;
    _year = snapshotData['year'] as String?;
    _date = snapshotData['date'] as String?;
    _numFile = castToType<int>(snapshotData['numFile']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BankTransfert');

  static Stream<BankTransfertRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BankTransfertRecord.fromSnapshot(s));

  static Future<BankTransfertRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BankTransfertRecord.fromSnapshot(s));

  static BankTransfertRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BankTransfertRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BankTransfertRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BankTransfertRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BankTransfertRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BankTransfertRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBankTransfertRecordData({
  String? title,
  double? montantPaye,
  double? montantReste,
  double? montantTrensferer,
  String? mois,
  String? year,
  String? date,
  int? numFile,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'montantPaye': montantPaye,
      'montantReste': montantReste,
      'montantTrensferer': montantTrensferer,
      'mois': mois,
      'year': year,
      'date': date,
      'numFile': numFile,
    }.withoutNulls,
  );

  return firestoreData;
}

class BankTransfertRecordDocumentEquality
    implements Equality<BankTransfertRecord> {
  const BankTransfertRecordDocumentEquality();

  @override
  bool equals(BankTransfertRecord? e1, BankTransfertRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.montantPaye == e2?.montantPaye &&
        e1?.montantReste == e2?.montantReste &&
        e1?.montantTrensferer == e2?.montantTrensferer &&
        e1?.mois == e2?.mois &&
        e1?.year == e2?.year &&
        e1?.date == e2?.date &&
        e1?.numFile == e2?.numFile;
  }

  @override
  int hash(BankTransfertRecord? e) => const ListEquality().hash([
        e?.title,
        e?.montantPaye,
        e?.montantReste,
        e?.montantTrensferer,
        e?.mois,
        e?.year,
        e?.date,
        e?.numFile
      ]);

  @override
  bool isValidKey(Object? o) => o is BankTransfertRecord;
}
