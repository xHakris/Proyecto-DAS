import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EstudianteRecord extends FirestoreRecord {
  EstudianteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notaFinal" field.
  int? _notaFinal;
  int get notaFinal => _notaFinal ?? 0;
  bool hasNotaFinal() => _notaFinal != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "semestre" field.
  int? _semestre;
  int get semestre => _semestre ?? 0;
  bool hasSemestre() => _semestre != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  // "carrera" field.
  String? _carrera;
  String get carrera => _carrera ?? '';
  bool hasCarrera() => _carrera != null;

  void _initializeFields() {
    _notaFinal = castToType<int>(snapshotData['notaFinal']);
    _uid = snapshotData['uid'] as DocumentReference?;
    _semestre = castToType<int>(snapshotData['semestre']);
    _telefono = snapshotData['telefono'] as String?;
    _carrera = snapshotData['carrera'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('estudiante');

  static Stream<EstudianteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EstudianteRecord.fromSnapshot(s));

  static Future<EstudianteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EstudianteRecord.fromSnapshot(s));

  static EstudianteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EstudianteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EstudianteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EstudianteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EstudianteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EstudianteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEstudianteRecordData({
  int? notaFinal,
  DocumentReference? uid,
  int? semestre,
  String? telefono,
  String? carrera,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notaFinal': notaFinal,
      'uid': uid,
      'semestre': semestre,
      'telefono': telefono,
      'carrera': carrera,
    }.withoutNulls,
  );

  return firestoreData;
}

class EstudianteRecordDocumentEquality implements Equality<EstudianteRecord> {
  const EstudianteRecordDocumentEquality();

  @override
  bool equals(EstudianteRecord? e1, EstudianteRecord? e2) {
    return e1?.notaFinal == e2?.notaFinal &&
        e1?.uid == e2?.uid &&
        e1?.semestre == e2?.semestre &&
        e1?.telefono == e2?.telefono &&
        e1?.carrera == e2?.carrera;
  }

  @override
  int hash(EstudianteRecord? e) => const ListEquality()
      .hash([e?.notaFinal, e?.uid, e?.semestre, e?.telefono, e?.carrera]);

  @override
  bool isValidKey(Object? o) => o is EstudianteRecord;
}
