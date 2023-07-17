import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetalleCursoRecord extends FirestoreRecord {
  DetalleCursoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "estudianteID" field.
  DocumentReference? _estudianteID;
  DocumentReference? get estudianteID => _estudianteID;
  bool hasEstudianteID() => _estudianteID != null;

  // "asistencia" field.
  List<String>? _asistencia;
  List<String> get asistencia => _asistencia ?? const [];
  bool hasAsistencia() => _asistencia != null;

  // "eventoID" field.
  DocumentReference? _eventoID;
  DocumentReference? get eventoID => _eventoID;
  bool hasEventoID() => _eventoID != null;

  // "certificado" field.
  String? _certificado;
  String get certificado => _certificado ?? '';
  bool hasCertificado() => _certificado != null;

  // "habilitado" field.
  bool? _habilitado;
  bool get habilitado => _habilitado ?? false;
  bool hasHabilitado() => _habilitado != null;

  // "codigoInscripcion" field.
  String? _codigoInscripcion;
  String get codigoInscripcion => _codigoInscripcion ?? '';
  bool hasCodigoInscripcion() => _codigoInscripcion != null;

  // "ordenPago" field.
  String? _ordenPago;
  String get ordenPago => _ordenPago ?? '';
  bool hasOrdenPago() => _ordenPago != null;

  // "comprobanteInscripcion" field.
  String? _comprobanteInscripcion;
  String get comprobanteInscripcion => _comprobanteInscripcion ?? '';
  bool hasComprobanteInscripcion() => _comprobanteInscripcion != null;

  // "comprobantePago" field.
  String? _comprobantePago;
  String get comprobantePago => _comprobantePago ?? '';
  bool hasComprobantePago() => _comprobantePago != null;

  void _initializeFields() {
    _estudianteID = snapshotData['estudianteID'] as DocumentReference?;
    _asistencia = getDataList(snapshotData['asistencia']);
    _eventoID = snapshotData['eventoID'] as DocumentReference?;
    _certificado = snapshotData['certificado'] as String?;
    _habilitado = snapshotData['habilitado'] as bool?;
    _codigoInscripcion = snapshotData['codigoInscripcion'] as String?;
    _ordenPago = snapshotData['ordenPago'] as String?;
    _comprobanteInscripcion = snapshotData['comprobanteInscripcion'] as String?;
    _comprobantePago = snapshotData['comprobantePago'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('detalleCurso');

  static Stream<DetalleCursoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetalleCursoRecord.fromSnapshot(s));

  static Future<DetalleCursoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DetalleCursoRecord.fromSnapshot(s));

  static DetalleCursoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetalleCursoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetalleCursoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetalleCursoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetalleCursoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DetalleCursoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDetalleCursoRecordData({
  DocumentReference? estudianteID,
  DocumentReference? eventoID,
  String? certificado,
  bool? habilitado,
  String? codigoInscripcion,
  String? ordenPago,
  String? comprobanteInscripcion,
  String? comprobantePago,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'estudianteID': estudianteID,
      'eventoID': eventoID,
      'certificado': certificado,
      'habilitado': habilitado,
      'codigoInscripcion': codigoInscripcion,
      'ordenPago': ordenPago,
      'comprobanteInscripcion': comprobanteInscripcion,
      'comprobantePago': comprobantePago,
    }.withoutNulls,
  );

  return firestoreData;
}

class DetalleCursoRecordDocumentEquality
    implements Equality<DetalleCursoRecord> {
  const DetalleCursoRecordDocumentEquality();

  @override
  bool equals(DetalleCursoRecord? e1, DetalleCursoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.estudianteID == e2?.estudianteID &&
        listEquality.equals(e1?.asistencia, e2?.asistencia) &&
        e1?.eventoID == e2?.eventoID &&
        e1?.certificado == e2?.certificado &&
        e1?.habilitado == e2?.habilitado &&
        e1?.codigoInscripcion == e2?.codigoInscripcion &&
        e1?.ordenPago == e2?.ordenPago &&
        e1?.comprobanteInscripcion == e2?.comprobanteInscripcion &&
        e1?.comprobantePago == e2?.comprobantePago;
  }

  @override
  int hash(DetalleCursoRecord? e) => const ListEquality().hash([
        e?.estudianteID,
        e?.asistencia,
        e?.eventoID,
        e?.certificado,
        e?.habilitado,
        e?.codigoInscripcion,
        e?.ordenPago,
        e?.comprobanteInscripcion,
        e?.comprobantePago
      ]);

  @override
  bool isValidKey(Object? o) => o is DetalleCursoRecord;
}
