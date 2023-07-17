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

  // "asistenciaDia1" field.
  String? _asistenciaDia1;
  String get asistenciaDia1 => _asistenciaDia1 ?? '';
  bool hasAsistenciaDia1() => _asistenciaDia1 != null;

  // "asistenciaDia2" field.
  String? _asistenciaDia2;
  String get asistenciaDia2 => _asistenciaDia2 ?? '';
  bool hasAsistenciaDia2() => _asistenciaDia2 != null;

  // "asistenciaDia3" field.
  String? _asistenciaDia3;
  String get asistenciaDia3 => _asistenciaDia3 ?? '';
  bool hasAsistenciaDia3() => _asistenciaDia3 != null;

  // "asistenciaDia4" field.
  String? _asistenciaDia4;
  String get asistenciaDia4 => _asistenciaDia4 ?? '';
  bool hasAsistenciaDia4() => _asistenciaDia4 != null;

  // "asistenciaDia5" field.
  String? _asistenciaDia5;
  String get asistenciaDia5 => _asistenciaDia5 ?? '';
  bool hasAsistenciaDia5() => _asistenciaDia5 != null;

  // "asistenciaDia10" field.
  String? _asistenciaDia10;
  String get asistenciaDia10 => _asistenciaDia10 ?? '';
  bool hasAsistenciaDia10() => _asistenciaDia10 != null;

  // "asistenciaDia29" field.
  String? _asistenciaDia29;
  String get asistenciaDia29 => _asistenciaDia29 ?? '';
  bool hasAsistenciaDia29() => _asistenciaDia29 != null;

  // "asistenciaDia9" field.
  String? _asistenciaDia9;
  String get asistenciaDia9 => _asistenciaDia9 ?? '';
  bool hasAsistenciaDia9() => _asistenciaDia9 != null;

  void _initializeFields() {
    _asistenciaDia1 = snapshotData['asistenciaDia1'] as String?;
    _asistenciaDia2 = snapshotData['asistenciaDia2'] as String?;
    _asistenciaDia3 = snapshotData['asistenciaDia3'] as String?;
    _asistenciaDia4 = snapshotData['asistenciaDia4'] as String?;
    _asistenciaDia5 = snapshotData['asistenciaDia5'] as String?;
    _asistenciaDia10 = snapshotData['asistenciaDia10'] as String?;
    _asistenciaDia29 = snapshotData['asistenciaDia29'] as String?;
    _asistenciaDia9 = snapshotData['asistenciaDia9'] as String?;
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
  String? asistenciaDia1,
  String? asistenciaDia2,
  String? asistenciaDia3,
  String? asistenciaDia4,
  String? asistenciaDia5,
  String? asistenciaDia10,
  String? asistenciaDia29,
  String? asistenciaDia9,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'asistenciaDia1': asistenciaDia1,
      'asistenciaDia2': asistenciaDia2,
      'asistenciaDia3': asistenciaDia3,
      'asistenciaDia4': asistenciaDia4,
      'asistenciaDia5': asistenciaDia5,
      'asistenciaDia10': asistenciaDia10,
      'asistenciaDia29': asistenciaDia29,
      'asistenciaDia9': asistenciaDia9,
    }.withoutNulls,
  );

  return firestoreData;
}

class AsistenciaRecordDocumentEquality implements Equality<AsistenciaRecord> {
  const AsistenciaRecordDocumentEquality();

  @override
  bool equals(AsistenciaRecord? e1, AsistenciaRecord? e2) {
    return e1?.asistenciaDia1 == e2?.asistenciaDia1 &&
        e1?.asistenciaDia2 == e2?.asistenciaDia2 &&
        e1?.asistenciaDia3 == e2?.asistenciaDia3 &&
        e1?.asistenciaDia4 == e2?.asistenciaDia4 &&
        e1?.asistenciaDia5 == e2?.asistenciaDia5 &&
        e1?.asistenciaDia10 == e2?.asistenciaDia10 &&
        e1?.asistenciaDia29 == e2?.asistenciaDia29 &&
        e1?.asistenciaDia9 == e2?.asistenciaDia9;
  }

  @override
  int hash(AsistenciaRecord? e) => const ListEquality().hash([
        e?.asistenciaDia1,
        e?.asistenciaDia2,
        e?.asistenciaDia3,
        e?.asistenciaDia4,
        e?.asistenciaDia5,
        e?.asistenciaDia10,
        e?.asistenciaDia29,
        e?.asistenciaDia9
      ]);

  @override
  bool isValidKey(Object? o) => o is AsistenciaRecord;
}
