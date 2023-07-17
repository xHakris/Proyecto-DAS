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

  // "areaPertenece" field.
  String? _areaPertenece;
  String get areaPertenece => _areaPertenece ?? '';
  bool hasAreaPertenece() => _areaPertenece != null;

  // "categoriaID" field.
  DocumentReference? _categoriaID;
  DocumentReference? get categoriaID => _categoriaID;
  bool hasCategoriaID() => _categoriaID != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "certificado" field.
  bool? _certificado;
  bool get certificado => _certificado ?? false;
  bool hasCertificado() => _certificado != null;

  // "comprobanteCurso" field.
  String? _comprobanteCurso;
  String get comprobanteCurso => _comprobanteCurso ?? '';
  bool hasComprobanteCurso() => _comprobanteCurso != null;

  // "cursoMinimo" field.
  int? _cursoMinimo;
  int get cursoMinimo => _cursoMinimo ?? 0;
  bool hasCursoMinimo() => _cursoMinimo != null;

  // "dePago" field.
  bool? _dePago;
  bool get dePago => _dePago ?? false;
  bool hasDePago() => _dePago != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "diasDuracion" field.
  int? _diasDuracion;
  int get diasDuracion => _diasDuracion ?? 0;
  bool hasDiasDuracion() => _diasDuracion != null;

  // "equipo" field.
  String? _equipo;
  String get equipo => _equipo ?? '';
  bool hasEquipo() => _equipo != null;

  // "horasDiarias" field.
  int? _horasDiarias;
  int get horasDiarias => _horasDiarias ?? 0;
  bool hasHorasDiarias() => _horasDiarias != null;

  // "imagenCurso" field.
  String? _imagenCurso;
  String get imagenCurso => _imagenCurso ?? '';
  bool hasImagenCurso() => _imagenCurso != null;

  // "responsable" field.
  String? _responsable;
  String get responsable => _responsable ?? '';
  bool hasResponsable() => _responsable != null;

  // "organizador" field.
  String? _organizador;
  String get organizador => _organizador ?? '';
  bool hasOrganizador() => _organizador != null;

  // "precio" field.
  int? _precio;
  int get precio => _precio ?? 0;
  bool hasPrecio() => _precio != null;

  // "notaAprobacion" field.
  int? _notaAprobacion;
  int get notaAprobacion => _notaAprobacion ?? 0;
  bool hasNotaAprobacion() => _notaAprobacion != null;

  // "estadoFinalizado" field.
  bool? _estadoFinalizado;
  bool get estadoFinalizado => _estadoFinalizado ?? false;
  bool hasEstadoFinalizado() => _estadoFinalizado != null;

  void _initializeFields() {
    _areaPertenece = snapshotData['areaPertenece'] as String?;
    _categoriaID = snapshotData['categoriaID'] as DocumentReference?;
    _nombre = snapshotData['nombre'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _certificado = snapshotData['certificado'] as bool?;
    _comprobanteCurso = snapshotData['comprobanteCurso'] as String?;
    _cursoMinimo = castToType<int>(snapshotData['cursoMinimo']);
    _dePago = snapshotData['dePago'] as bool?;
    _descripcion = snapshotData['descripcion'] as String?;
    _diasDuracion = castToType<int>(snapshotData['diasDuracion']);
    _equipo = snapshotData['equipo'] as String?;
    _horasDiarias = castToType<int>(snapshotData['horasDiarias']);
    _imagenCurso = snapshotData['imagenCurso'] as String?;
    _responsable = snapshotData['responsable'] as String?;
    _organizador = snapshotData['organizador'] as String?;
    _precio = castToType<int>(snapshotData['precio']);
    _notaAprobacion = castToType<int>(snapshotData['notaAprobacion']);
    _estadoFinalizado = snapshotData['estadoFinalizado'] as bool?;
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
  String? areaPertenece,
  DocumentReference? categoriaID,
  String? nombre,
  String? tipo,
  bool? certificado,
  String? comprobanteCurso,
  int? cursoMinimo,
  bool? dePago,
  String? descripcion,
  int? diasDuracion,
  String? equipo,
  int? horasDiarias,
  String? imagenCurso,
  String? responsable,
  String? organizador,
  int? precio,
  int? notaAprobacion,
  bool? estadoFinalizado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'areaPertenece': areaPertenece,
      'categoriaID': categoriaID,
      'nombre': nombre,
      'tipo': tipo,
      'certificado': certificado,
      'comprobanteCurso': comprobanteCurso,
      'cursoMinimo': cursoMinimo,
      'dePago': dePago,
      'descripcion': descripcion,
      'diasDuracion': diasDuracion,
      'equipo': equipo,
      'horasDiarias': horasDiarias,
      'imagenCurso': imagenCurso,
      'responsable': responsable,
      'organizador': organizador,
      'precio': precio,
      'notaAprobacion': notaAprobacion,
      'estadoFinalizado': estadoFinalizado,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventoRecordDocumentEquality implements Equality<EventoRecord> {
  const EventoRecordDocumentEquality();

  @override
  bool equals(EventoRecord? e1, EventoRecord? e2) {
    return e1?.areaPertenece == e2?.areaPertenece &&
        e1?.categoriaID == e2?.categoriaID &&
        e1?.nombre == e2?.nombre &&
        e1?.tipo == e2?.tipo &&
        e1?.certificado == e2?.certificado &&
        e1?.comprobanteCurso == e2?.comprobanteCurso &&
        e1?.cursoMinimo == e2?.cursoMinimo &&
        e1?.dePago == e2?.dePago &&
        e1?.descripcion == e2?.descripcion &&
        e1?.diasDuracion == e2?.diasDuracion &&
        e1?.equipo == e2?.equipo &&
        e1?.horasDiarias == e2?.horasDiarias &&
        e1?.imagenCurso == e2?.imagenCurso &&
        e1?.responsable == e2?.responsable &&
        e1?.organizador == e2?.organizador &&
        e1?.precio == e2?.precio &&
        e1?.notaAprobacion == e2?.notaAprobacion &&
        e1?.estadoFinalizado == e2?.estadoFinalizado;
  }

  @override
  int hash(EventoRecord? e) => const ListEquality().hash([
        e?.areaPertenece,
        e?.categoriaID,
        e?.nombre,
        e?.tipo,
        e?.certificado,
        e?.comprobanteCurso,
        e?.cursoMinimo,
        e?.dePago,
        e?.descripcion,
        e?.diasDuracion,
        e?.equipo,
        e?.horasDiarias,
        e?.imagenCurso,
        e?.responsable,
        e?.organizador,
        e?.precio,
        e?.notaAprobacion,
        e?.estadoFinalizado
      ]);

  @override
  bool isValidKey(Object? o) => o is EventoRecord;
}
