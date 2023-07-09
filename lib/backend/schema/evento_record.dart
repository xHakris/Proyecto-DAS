import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventoRecord extends FirestoreRecord {
  EventoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "diasDuracion" field.
  int? _diasDuracion;
  int get diasDuracion => _diasDuracion ?? 0;
  bool hasDiasDuracion() => _diasDuracion != null;

  // "horas" field.
  int? _horas;
  int get horas => _horas ?? 0;
  bool hasHoras() => _horas != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "precio" field.
  int? _precio;
  int get precio => _precio ?? 0;
  bool hasPrecio() => _precio != null;

  // "responsable" field.
  String? _responsable;
  String get responsable => _responsable ?? '';
  bool hasResponsable() => _responsable != null;

  // "organizador" field.
  String? _organizador;
  String get organizador => _organizador ?? '';
  bool hasOrganizador() => _organizador != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "certificado" field.
  bool? _certificado;
  bool get certificado => _certificado ?? false;
  bool hasCertificado() => _certificado != null;

  // "areaPertenece" field.
  String? _areaPertenece;
  String get areaPertenece => _areaPertenece ?? '';
  bool hasAreaPertenece() => _areaPertenece != null;

  // "dePago" field.
  bool? _dePago;
  bool get dePago => _dePago ?? false;
  bool hasDePago() => _dePago != null;

  // "imgCurso" field.
  String? _imgCurso;
  String get imgCurso => _imgCurso ?? '';
  bool hasImgCurso() => _imgCurso != null;

  void _initializeFields() {
    _diasDuracion = castToType<int>(snapshotData['diasDuracion']);
    _horas = castToType<int>(snapshotData['horas']);
    _nombre = snapshotData['nombre'] as String?;
    _precio = castToType<int>(snapshotData['precio']);
    _responsable = snapshotData['responsable'] as String?;
    _organizador = snapshotData['organizador'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _certificado = snapshotData['certificado'] as bool?;
    _areaPertenece = snapshotData['areaPertenece'] as String?;
    _dePago = snapshotData['dePago'] as bool?;
    _imgCurso = snapshotData['imgCurso'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('evento');

  static Stream<EventoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventoRecord.fromSnapshot(s));

  static Future<EventoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventoRecord.fromSnapshot(s));

  static EventoRecord fromSnapshot(DocumentSnapshot snapshot) => EventoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventoRecordData({
  int? diasDuracion,
  int? horas,
  String? nombre,
  int? precio,
  String? responsable,
  String? organizador,
  String? tipo,
  bool? certificado,
  String? areaPertenece,
  bool? dePago,
  String? imgCurso,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'diasDuracion': diasDuracion,
      'horas': horas,
      'nombre': nombre,
      'precio': precio,
      'responsable': responsable,
      'organizador': organizador,
      'tipo': tipo,
      'certificado': certificado,
      'areaPertenece': areaPertenece,
      'dePago': dePago,
      'imgCurso': imgCurso,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventoRecordDocumentEquality implements Equality<EventoRecord> {
  const EventoRecordDocumentEquality();

  @override
  bool equals(EventoRecord? e1, EventoRecord? e2) {
    return e1?.diasDuracion == e2?.diasDuracion &&
        e1?.horas == e2?.horas &&
        e1?.nombre == e2?.nombre &&
        e1?.precio == e2?.precio &&
        e1?.responsable == e2?.responsable &&
        e1?.organizador == e2?.organizador &&
        e1?.tipo == e2?.tipo &&
        e1?.certificado == e2?.certificado &&
        e1?.areaPertenece == e2?.areaPertenece &&
        e1?.dePago == e2?.dePago &&
        e1?.imgCurso == e2?.imgCurso;
  }

  @override
  int hash(EventoRecord? e) => const ListEquality().hash([
        e?.diasDuracion,
        e?.horas,
        e?.nombre,
        e?.precio,
        e?.responsable,
        e?.organizador,
        e?.tipo,
        e?.certificado,
        e?.areaPertenece,
        e?.dePago,
        e?.imgCurso
      ]);

  @override
  bool isValidKey(Object? o) => o is EventoRecord;
}
