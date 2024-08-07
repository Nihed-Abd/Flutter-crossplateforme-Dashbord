import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientRecord extends FirestoreRecord {
  ClientRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cin" field.
  int? _cin;
  int get cin => _cin ?? 0;
  bool hasCin() => _cin != null;

  // "metier" field.
  String? _metier;
  String get metier => _metier ?? '';
  bool hasMetier() => _metier != null;

  // "adresse" field.
  String? _adresse;
  String get adresse => _adresse ?? '';
  bool hasAdresse() => _adresse != null;

  // "montant_credit" field.
  double? _montantCredit;
  double get montantCredit => _montantCredit ?? 0.0;
  bool hasMontantCredit() => _montantCredit != null;

  // "montant_abonnement" field.
  double? _montantAbonnement;
  double get montantAbonnement => _montantAbonnement ?? 0.0;
  bool hasMontantAbonnement() => _montantAbonnement != null;

  // "nomComplete" field.
  String? _nomComplete;
  String get nomComplete => _nomComplete ?? '';
  bool hasNomComplete() => _nomComplete != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  void _initializeFields() {
    _cin = castToType<int>(snapshotData['cin']);
    _metier = snapshotData['metier'] as String?;
    _adresse = snapshotData['adresse'] as String?;
    _montantCredit = castToType<double>(snapshotData['montant_credit']);
    _montantAbonnement = castToType<double>(snapshotData['montant_abonnement']);
    _nomComplete = snapshotData['nomComplete'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _year = snapshotData['year'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Client');

  static Stream<ClientRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientRecord.fromSnapshot(s));

  static Future<ClientRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientRecord.fromSnapshot(s));

  static ClientRecord fromSnapshot(DocumentSnapshot snapshot) => ClientRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientRecordData({
  int? cin,
  String? metier,
  String? adresse,
  double? montantCredit,
  double? montantAbonnement,
  String? nomComplete,
  DateTime? date,
  String? year,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cin': cin,
      'metier': metier,
      'adresse': adresse,
      'montant_credit': montantCredit,
      'montant_abonnement': montantAbonnement,
      'nomComplete': nomComplete,
      'date': date,
      'year': year,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientRecordDocumentEquality implements Equality<ClientRecord> {
  const ClientRecordDocumentEquality();

  @override
  bool equals(ClientRecord? e1, ClientRecord? e2) {
    return e1?.cin == e2?.cin &&
        e1?.metier == e2?.metier &&
        e1?.adresse == e2?.adresse &&
        e1?.montantCredit == e2?.montantCredit &&
        e1?.montantAbonnement == e2?.montantAbonnement &&
        e1?.nomComplete == e2?.nomComplete &&
        e1?.date == e2?.date &&
        e1?.year == e2?.year;
  }

  @override
  int hash(ClientRecord? e) => const ListEquality().hash([
        e?.cin,
        e?.metier,
        e?.adresse,
        e?.montantCredit,
        e?.montantAbonnement,
        e?.nomComplete,
        e?.date,
        e?.year
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientRecord;
}
