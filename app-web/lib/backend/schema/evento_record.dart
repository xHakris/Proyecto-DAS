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

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "certificado" field.
  bool? _certificado;
  bool get certificado => _certificado ?? false;
  bool hasCertificado() => _certificado != null;

  // "comprobanteCurso" field.
  String? _comprobanteCurso;
  String get comprobanteCurso => _comprobanteCurso ?? '';
  bool hasComprobanteCurso() => _comprobanteCurso != null;

  // "comprobantePago" field.
  String? _comprobantePago;
  String get comprobantePago => _comprobantePago ?? '';
  bool hasComprobantePago() => _comprobantePago != null;

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

  // "horas" field.
  int? _horas;
  int get horas => _horas ?? 0;
  bool hasHoras() => _horas != null;

  // "imgCurso" field.
  String? _imgCurso;
  String get imgCurso => _imgCurso ?? '';
  bool hasImgCurso() => _imgCurso != null;

  // "equipo" field.
  List<DocumentReference>? _equipo;
  List<DocumentReference> get equipo => _equipo ?? const [];
  bool hasEquipo() => _equipo != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "responsable" field.
  String? _responsable;
  String get responsable => _responsable ?? '';
  bool hasResponsable() => _responsable != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "inicio" field.
  DateTime? _inicio;
  DateTime? get inicio => _inicio;
  bool hasInicio() => _inicio != null;

  // "fin" field.
  DateTime? _fin;
  DateTime? get fin => _fin;
  bool hasFin() => _fin != null;

  // "integrantes" field.
  List<DocumentReference>? _integrantes;
  List<DocumentReference> get integrantes => _integrantes ?? const [];
  bool hasIntegrantes() => _integrantes != null;

  void _initializeFields() {
    _areaPertenece = snapshotData['areaPertenece'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _certificado = snapshotData['certificado'] as bool?;
    _comprobanteCurso = snapshotData['comprobanteCurso'] as String?;
    _comprobantePago = snapshotData['comprobantePago'] as String?;
    _cursoMinimo = castToType<int>(snapshotData['cursoMinimo']);
    _dePago = snapshotData['dePago'] as bool?;
    _descripcion = snapshotData['descripcion'] as String?;
    _diasDuracion = castToType<int>(snapshotData['diasDuracion']);
    _horas = castToType<int>(snapshotData['horas']);
    _imgCurso = snapshotData['imgCurso'] as String?;
    _equipo = getDataList(snapshotData['equipo']);
    _nombre = snapshotData['nombre'] as String?;
    _precio = castToType<double>(snapshotData['precio']);
    _responsable = snapshotData['responsable'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _inicio = snapshotData['inicio'] as DateTime?;
    _fin = snapshotData['fin'] as DateTime?;
    _integrantes = getDataList(snapshotData['integrantes']);
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
  String? categoria,
  bool? certificado,
  String? comprobanteCurso,
  String? comprobantePago,
  int? cursoMinimo,
  bool? dePago,
  String? descripcion,
  int? diasDuracion,
  int? horas,
  String? imgCurso,
  String? nombre,
  double? precio,
  String? responsable,
  String? tipo,
  DateTime? inicio,
  DateTime? fin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'areaPertenece': areaPertenece,
      'categoria': categoria,
      'certificado': certificado,
      'comprobanteCurso': comprobanteCurso,
      'comprobantePago': comprobantePago,
      'cursoMinimo': cursoMinimo,
      'dePago': dePago,
      'descripcion': descripcion,
      'diasDuracion': diasDuracion,
      'horas': horas,
      'imgCurso': imgCurso,
      'nombre': nombre,
      'precio': precio,
      'responsable': responsable,
      'tipo': tipo,
      'inicio': inicio,
      'fin': fin,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventoRecordDocumentEquality implements Equality<EventoRecord> {
  const EventoRecordDocumentEquality();

  @override
  bool equals(EventoRecord? e1, EventoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.areaPertenece == e2?.areaPertenece &&
        e1?.categoria == e2?.categoria &&
        e1?.certificado == e2?.certificado &&
        e1?.comprobanteCurso == e2?.comprobanteCurso &&
        e1?.comprobantePago == e2?.comprobantePago &&
        e1?.cursoMinimo == e2?.cursoMinimo &&
        e1?.dePago == e2?.dePago &&
        e1?.descripcion == e2?.descripcion &&
        e1?.diasDuracion == e2?.diasDuracion &&
        e1?.horas == e2?.horas &&
        e1?.imgCurso == e2?.imgCurso &&
        listEquality.equals(e1?.equipo, e2?.equipo) &&
        e1?.nombre == e2?.nombre &&
        e1?.precio == e2?.precio &&
        e1?.responsable == e2?.responsable &&
        e1?.tipo == e2?.tipo &&
        e1?.inicio == e2?.inicio &&
        e1?.fin == e2?.fin &&
        listEquality.equals(e1?.integrantes, e2?.integrantes);
  }

  @override
  int hash(EventoRecord? e) => const ListEquality().hash([
        e?.areaPertenece,
        e?.categoria,
        e?.certificado,
        e?.comprobanteCurso,
        e?.comprobantePago,
        e?.cursoMinimo,
        e?.dePago,
        e?.descripcion,
        e?.diasDuracion,
        e?.horas,
        e?.imgCurso,
        e?.equipo,
        e?.nombre,
        e?.precio,
        e?.responsable,
        e?.tipo,
        e?.inicio,
        e?.fin,
        e?.integrantes
      ]);

  @override
  bool isValidKey(Object? o) => o is EventoRecord;
}
