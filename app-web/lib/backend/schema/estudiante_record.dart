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

  // "notaFinal" field.
  int? _notaFinal;
  int get notaFinal => _notaFinal ?? 0;
  bool hasNotaFinal() => _notaFinal != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "asistencia" field.
  List<DocumentReference>? _asistencia;
  List<DocumentReference> get asistencia => _asistencia ?? const [];
  bool hasAsistencia() => _asistencia != null;

  void _initializeFields() {
    _correo = snapshotData['correo'] as String?;
    _notaFinal = castToType<int>(snapshotData['notaFinal']);
    _nombre = snapshotData['nombre'] as String?;
    _uid = snapshotData['uid'] as String?;
    _asistencia = getDataList(snapshotData['asistencia']);
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
  int? notaFinal,
  String? nombre,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'correo': correo,
      'notaFinal': notaFinal,
      'nombre': nombre,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class EstudianteRecordDocumentEquality implements Equality<EstudianteRecord> {
  const EstudianteRecordDocumentEquality();

  @override
  bool equals(EstudianteRecord? e1, EstudianteRecord? e2) {
    const listEquality = ListEquality();
    return e1?.correo == e2?.correo &&
        e1?.notaFinal == e2?.notaFinal &&
        e1?.nombre == e2?.nombre &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.asistencia, e2?.asistencia);
  }

  @override
  int hash(EstudianteRecord? e) => const ListEquality()
      .hash([e?.correo, e?.notaFinal, e?.nombre, e?.uid, e?.asistencia]);

  @override
  bool isValidKey(Object? o) => o is EstudianteRecord;
}
