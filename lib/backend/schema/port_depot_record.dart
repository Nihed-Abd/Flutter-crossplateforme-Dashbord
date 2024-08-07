import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PortDepotRecord extends FirestoreRecord {
  PortDepotRecord._(
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
      FirebaseFirestore.instance.collection('portDepot');

  static Stream<PortDepotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PortDepotRecord.fromSnapshot(s));

  static Future<PortDepotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PortDepotRecord.fromSnapshot(s));

  static PortDepotRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PortDepotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PortDepotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PortDepotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PortDepotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PortDepotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPortDepotRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class PortDepotRecordDocumentEquality implements Equality<PortDepotRecord> {
  const PortDepotRecordDocumentEquality();

  @override
  bool equals(PortDepotRecord? e1, PortDepotRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(PortDepotRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is PortDepotRecord;
}
