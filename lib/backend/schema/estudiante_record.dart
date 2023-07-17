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

  // "correo" field.
  String? _correo;
  String get correo => _correo ?? '';
  bool hasCorreo() => _correo != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

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

  // "estudianteID" field.
  DocumentReference? _estudianteID;
  DocumentReference? get estudianteID => _estudianteID;
  bool hasEstudianteID() => _estudianteID != null;

  void _initializeFields() {
    _correo = snapshotData['correo'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _notaFinal = castToType<int>(snapshotData['notaFinal']);
    _uid = snapshotData['uid'] as DocumentReference?;
    _semestre = castToType<int>(snapshotData['semestre']);
    _estudianteID = snapshotData['estudianteID'] as DocumentReference?;
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
  String? correo,
  String? nombre,
  int? notaFinal,
  DocumentReference? uid,
  int? semestre,
  DocumentReference? estudianteID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'correo': correo,
      'nombre': nombre,
      'notaFinal': notaFinal,
      'uid': uid,
      'semestre': semestre,
      'estudianteID': estudianteID,
    }.withoutNulls,
  );

  return firestoreData;
}

class EstudianteRecordDocumentEquality implements Equality<EstudianteRecord> {
  const EstudianteRecordDocumentEquality();

  @override
  bool equals(EstudianteRecord? e1, EstudianteRecord? e2) {
    return e1?.correo == e2?.correo &&
        e1?.nombre == e2?.nombre &&
        e1?.notaFinal == e2?.notaFinal &&
        e1?.uid == e2?.uid &&
        e1?.semestre == e2?.semestre &&
        e1?.estudianteID == e2?.estudianteID;
  }

  @override
  int hash(EstudianteRecord? e) => const ListEquality().hash([
        e?.correo,
        e?.nombre,
        e?.notaFinal,
        e?.uid,
        e?.semestre,
        e?.estudianteID
      ]);

  @override
  bool isValidKey(Object? o) => o is EstudianteRecord;
}
