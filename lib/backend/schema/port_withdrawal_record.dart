import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PortWithdrawalRecord extends FirestoreRecord {
  PortWithdrawalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('portWithdrawal');

  static Stream<PortWithdrawalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PortWithdrawalRecord.fromSnapshot(s));

  static Future<PortWithdrawalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PortWithdrawalRecord.fromSnapshot(s));

  static PortWithdrawalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PortWithdrawalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PortWithdrawalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PortWithdrawalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PortWithdrawalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PortWithdrawalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPortWithdrawalRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class PortWithdrawalRecordDocumentEquality
    implements Equality<PortWithdrawalRecord> {
  const PortWithdrawalRecordDocumentEquality();

  @override
  bool equals(PortWithdrawalRecord? e1, PortWithdrawalRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(PortWithdrawalRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is PortWithdrawalRecord;
}
