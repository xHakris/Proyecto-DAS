import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocenteRecord extends FirestoreRecord {
  DocenteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  void _initializeFields() {
    _tipo = snapshotData['tipo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('docente');

  static Stream<DocenteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocenteRecord.fromSnapshot(s));

  static Future<DocenteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocenteRecord.fromSnapshot(s));

  static DocenteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocenteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocenteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocenteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocenteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocenteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocenteRecordData({
  String? tipo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo': tipo,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocenteRecordDocumentEquality implements Equality<DocenteRecord> {
  const DocenteRecordDocumentEquality();

  @override
  bool equals(DocenteRecord? e1, DocenteRecord? e2) {
    return e1?.tipo == e2?.tipo;
  }

  @override
  int hash(DocenteRecord? e) => const ListEquality().hash([e?.tipo]);

  @override
  bool isValidKey(Object? o) => o is DocenteRecord;
}
