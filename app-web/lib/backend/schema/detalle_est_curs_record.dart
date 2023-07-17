import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetalleEstCursRecord extends FirestoreRecord {
  DetalleEstCursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "estudiante" field.
  DocumentReference? _estudiante;
  DocumentReference? get estudiante => _estudiante;
  bool hasEstudiante() => _estudiante != null;

  // "asistencia" field.
  List<String>? _asistencia;
  List<String> get asistencia => _asistencia ?? const [];
  bool hasAsistencia() => _asistencia != null;

  // "evento" field.
  DocumentReference? _evento;
  DocumentReference? get evento => _evento;
  bool hasEvento() => _evento != null;

  // "certificado" field.
  String? _certificado;
  String get certificado => _certificado ?? '';
  bool hasCertificado() => _certificado != null;

  // "comprobantePago" field.
  String? _comprobantePago;
  String get comprobantePago => _comprobantePago ?? '';
  bool hasComprobantePago() => _comprobantePago != null;

  // "cantidadPago" field.
  double? _cantidadPago;
  double get cantidadPago => _cantidadPago ?? 0.0;
  bool hasCantidadPago() => _cantidadPago != null;

  // "habilitado" field.
  bool? _habilitado;
  bool get habilitado => _habilitado ?? false;
  bool hasHabilitado() => _habilitado != null;

  // "codigoInscripcion" field.
  String? _codigoInscripcion;
  String get codigoInscripcion => _codigoInscripcion ?? '';
  bool hasCodigoInscripcion() => _codigoInscripcion != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _estudiante = snapshotData['estudiante'] as DocumentReference?;
    _asistencia = getDataList(snapshotData['asistencia']);
    _evento = snapshotData['evento'] as DocumentReference?;
    _certificado = snapshotData['certificado'] as String?;
    _comprobantePago = snapshotData['comprobantePago'] as String?;
    _cantidadPago = castToType<double>(snapshotData['cantidadPago']);
    _habilitado = snapshotData['habilitado'] as bool?;
    _codigoInscripcion = snapshotData['codigoInscripcion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('detalleEstCurs');

  static Stream<DetalleEstCursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetalleEstCursRecord.fromSnapshot(s));

  static Future<DetalleEstCursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DetalleEstCursRecord.fromSnapshot(s));

  static DetalleEstCursRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetalleEstCursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetalleEstCursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetalleEstCursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetalleEstCursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DetalleEstCursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDetalleEstCursRecordData({
  String? uid,
  DocumentReference? estudiante,
  DocumentReference? evento,
  String? certificado,
  String? comprobantePago,
  double? cantidadPago,
  bool? habilitado,
  String? codigoInscripcion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'estudiante': estudiante,
      'evento': evento,
      'certificado': certificado,
      'comprobantePago': comprobantePago,
      'cantidadPago': cantidadPago,
      'habilitado': habilitado,
      'codigoInscripcion': codigoInscripcion,
    }.withoutNulls,
  );

  return firestoreData;
}

class DetalleEstCursRecordDocumentEquality
    implements Equality<DetalleEstCursRecord> {
  const DetalleEstCursRecordDocumentEquality();

  @override
  bool equals(DetalleEstCursRecord? e1, DetalleEstCursRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.estudiante == e2?.estudiante &&
        listEquality.equals(e1?.asistencia, e2?.asistencia) &&
        e1?.evento == e2?.evento &&
        e1?.certificado == e2?.certificado &&
        e1?.comprobantePago == e2?.comprobantePago &&
        e1?.cantidadPago == e2?.cantidadPago &&
        e1?.habilitado == e2?.habilitado &&
        e1?.codigoInscripcion == e2?.codigoInscripcion;
  }

  @override
  int hash(DetalleEstCursRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.estudiante,
        e?.asistencia,
        e?.evento,
        e?.certificado,
        e?.comprobantePago,
        e?.cantidadPago,
        e?.habilitado,
        e?.codigoInscripcion
      ]);

  @override
  bool isValidKey(Object? o) => o is DetalleEstCursRecord;
}
