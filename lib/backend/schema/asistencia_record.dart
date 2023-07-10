import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AsistenciaRecord extends FirestoreRecord {
  AsistenciaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "asistencia1" field.
  String? _asistencia1;
  String get asistencia1 => _asistencia1 ?? '';
  bool hasAsistencia1() => _asistencia1 != null;

  // "asistencia2" field.
  String? _asistencia2;
  String get asistencia2 => _asistencia2 ?? '';
  bool hasAsistencia2() => _asistencia2 != null;

  void _initializeFields() {
    _asistencia1 = snapshotData['asistencia1'] as String?;
    _asistencia2 = snapshotData['asistencia2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('asistencia');

  static Stream<AsistenciaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AsistenciaRecord.fromSnapshot(s));

  static Future<AsistenciaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AsistenciaRecord.fromSnapshot(s));

  static AsistenciaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AsistenciaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AsistenciaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AsistenciaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AsistenciaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AsistenciaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAsistenciaRecordData({
  String? asistencia1,
  String? asistencia2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'asistencia1': asistencia1,
      'asistencia2': asistencia2,
    }.withoutNulls,
  );

  return firestoreData;
}

class AsistenciaRecordDocumentEquality implements Equality<AsistenciaRecord> {
  const AsistenciaRecordDocumentEquality();

  @override
  bool equals(AsistenciaRecord? e1, AsistenciaRecord? e2) {
    return e1?.asistencia1 == e2?.asistencia1 &&
        e1?.asistencia2 == e2?.asistencia2;
  }

  @override
  int hash(AsistenciaRecord? e) =>
      const ListEquality().hash([e?.asistencia1, e?.asistencia2]);

  @override
  bool isValidKey(Object? o) => o is AsistenciaRecord;
}
