import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticlesRecord extends FirestoreRecord {
  ArticlesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  bool hasCodigo() => _codigo != null;

  // "Product_type" field.
  String? _productType;
  String get productType => _productType ?? '';
  bool hasProductType() => _productType != null;

  // "OEM" field.
  String? _oem;
  String get oem => _oem ?? '';
  bool hasOem() => _oem != null;

  // "Codigo_proveedor" field.
  String? _codigoProveedor;
  String get codigoProveedor => _codigoProveedor ?? '';
  bool hasCodigoProveedor() => _codigoProveedor != null;

  // "Nombre_name" field.
  String? _nombreName;
  String get nombreName => _nombreName ?? '';
  bool hasNombreName() => _nombreName != null;

  // "Marca_brand" field.
  String? _marcaBrand;
  String get marcaBrand => _marcaBrand ?? '';
  bool hasMarcaBrand() => _marcaBrand != null;

  // "Unidad_de_medida_Measurement_unit" field.
  String? _unidadDeMedidaMeasurementUnit;
  String get unidadDeMedidaMeasurementUnit =>
      _unidadDeMedidaMeasurementUnit ?? '';
  bool hasUnidadDeMedidaMeasurementUnit() =>
      _unidadDeMedidaMeasurementUnit != null;

  // "Group_Grupo" field.
  String? _groupGrupo;
  String get groupGrupo => _groupGrupo ?? '';
  bool hasGroupGrupo() => _groupGrupo != null;

  // "Subgroup_Subgrupo" field.
  String? _subgroupSubgrupo;
  String get subgroupSubgrupo => _subgroupSubgrupo ?? '';
  bool hasSubgroupSubgrupo() => _subgroupSubgrupo != null;

  // "Garantia_Warranty" field.
  String? _garantiaWarranty;
  String get garantiaWarranty => _garantiaWarranty ?? '';
  bool hasGarantiaWarranty() => _garantiaWarranty != null;

  // "No_Sere_If_Have_Serial_Nr" field.
  String? _noSereIfHaveSerialNr;
  String get noSereIfHaveSerialNr => _noSereIfHaveSerialNr ?? '';
  bool hasNoSereIfHaveSerialNr() => _noSereIfHaveSerialNr != null;

  // "Stock_minimo_Minimum_Stock" field.
  int? _stockMinimoMinimumStock;
  int get stockMinimoMinimumStock => _stockMinimoMinimumStock ?? 0;
  bool hasStockMinimoMinimumStock() => _stockMinimoMinimumStock != null;

  // "Moneda_Currency" field.
  String? _monedaCurrency;
  String get monedaCurrency => _monedaCurrency ?? '';
  bool hasMonedaCurrency() => _monedaCurrency != null;

  // "Precio_compra_Purchase_price" field.
  double? _precioCompraPurchasePrice;
  double get precioCompraPurchasePrice => _precioCompraPurchasePrice ?? 0.0;
  bool hasPrecioCompraPurchasePrice() => _precioCompraPurchasePrice != null;

  // "Utilidad_Profit_Percentage" field.
  double? _utilidadProfitPercentage;
  double get utilidadProfitPercentage => _utilidadProfitPercentage ?? 0.0;
  bool hasUtilidadProfitPercentage() => _utilidadProfitPercentage != null;

  // "Precio_Venta_Sale_price" field.
  double? _precioVentaSalePrice;
  double get precioVentaSalePrice => _precioVentaSalePrice ?? 0.0;
  bool hasPrecioVentaSalePrice() => _precioVentaSalePrice != null;

  // "Codigo_de_Barras_Bar_Code" field.
  String? _codigoDeBarrasBarCode;
  String get codigoDeBarrasBarCode => _codigoDeBarrasBarCode ?? '';
  bool hasCodigoDeBarrasBarCode() => _codigoDeBarrasBarCode != null;

  // "Imagen_Picture" field.
  String? _imagenPicture;
  String get imagenPicture => _imagenPicture ?? '';
  bool hasImagenPicture() => _imagenPicture != null;

  // "Ubicacion_Location" field.
  String? _ubicacionLocation;
  String get ubicacionLocation => _ubicacionLocation ?? '';
  bool hasUbicacionLocation() => _ubicacionLocation != null;

  // "Comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "Precio_Fabrica_P1_FactoryPriceP1" field.
  double? _precioFabricaP1FactoryPriceP1;
  double get precioFabricaP1FactoryPriceP1 =>
      _precioFabricaP1FactoryPriceP1 ?? 0.0;
  bool hasPrecioFabricaP1FactoryPriceP1() =>
      _precioFabricaP1FactoryPriceP1 != null;

  // "Precio_Fabrica_P2_FactoryPriceP2" field.
  double? _precioFabricaP2FactoryPriceP2;
  double get precioFabricaP2FactoryPriceP2 =>
      _precioFabricaP2FactoryPriceP2 ?? 0.0;
  bool hasPrecioFabricaP2FactoryPriceP2() =>
      _precioFabricaP2FactoryPriceP2 != null;

  // "Precio_Fabrica_P3_FactoryPriceP3" field.
  double? _precioFabricaP3FactoryPriceP3;
  double get precioFabricaP3FactoryPriceP3 =>
      _precioFabricaP3FactoryPriceP3 ?? 0.0;
  bool hasPrecioFabricaP3FactoryPriceP3() =>
      _precioFabricaP3FactoryPriceP3 != null;

  // "Precio_Fabrica_PvtaM_FactoryPricePvtaM" field.
  double? _precioFabricaPvtaMFactoryPricePvtaM;
  double get precioFabricaPvtaMFactoryPricePvtaM =>
      _precioFabricaPvtaMFactoryPricePvtaM ?? 0.0;
  bool hasPrecioFabricaPvtaMFactoryPricePvtaM() =>
      _precioFabricaPvtaMFactoryPricePvtaM != null;

  // "Fecha_de_Creacion_Created_Date" field.
  DateTime? _fechaDeCreacionCreatedDate;
  DateTime? get fechaDeCreacionCreatedDate => _fechaDeCreacionCreatedDate;
  bool hasFechaDeCreacionCreatedDate() => _fechaDeCreacionCreatedDate != null;

  // "Stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "precioventaconigv" field.
  double? _precioventaconigv;
  double get precioventaconigv => _precioventaconigv ?? 0.0;
  bool hasPrecioventaconigv() => _precioventaconigv != null;

  void _initializeFields() {
    _codigo = snapshotData['Codigo'] as String?;
    _productType = snapshotData['Product_type'] as String?;
    _oem = snapshotData['OEM'] as String?;
    _codigoProveedor = snapshotData['Codigo_proveedor'] as String?;
    _nombreName = snapshotData['Nombre_name'] as String?;
    _marcaBrand = snapshotData['Marca_brand'] as String?;
    _unidadDeMedidaMeasurementUnit =
        snapshotData['Unidad_de_medida_Measurement_unit'] as String?;
    _groupGrupo = snapshotData['Group_Grupo'] as String?;
    _subgroupSubgrupo = snapshotData['Subgroup_Subgrupo'] as String?;
    _garantiaWarranty = snapshotData['Garantia_Warranty'] as String?;
    _noSereIfHaveSerialNr =
        snapshotData['No_Sere_If_Have_Serial_Nr'] as String?;
    _stockMinimoMinimumStock =
        castToType<int>(snapshotData['Stock_minimo_Minimum_Stock']);
    _monedaCurrency = snapshotData['Moneda_Currency'] as String?;
    _precioCompraPurchasePrice =
        castToType<double>(snapshotData['Precio_compra_Purchase_price']);
    _utilidadProfitPercentage =
        castToType<double>(snapshotData['Utilidad_Profit_Percentage']);
    _precioVentaSalePrice =
        castToType<double>(snapshotData['Precio_Venta_Sale_price']);
    _codigoDeBarrasBarCode =
        snapshotData['Codigo_de_Barras_Bar_Code'] as String?;
    _imagenPicture = snapshotData['Imagen_Picture'] as String?;
    _ubicacionLocation = snapshotData['Ubicacion_Location'] as String?;
    _comentario = snapshotData['Comentario'] as String?;
    _precioFabricaP1FactoryPriceP1 =
        castToType<double>(snapshotData['Precio_Fabrica_P1_FactoryPriceP1']);
    _precioFabricaP2FactoryPriceP2 =
        castToType<double>(snapshotData['Precio_Fabrica_P2_FactoryPriceP2']);
    _precioFabricaP3FactoryPriceP3 =
        castToType<double>(snapshotData['Precio_Fabrica_P3_FactoryPriceP3']);
    _precioFabricaPvtaMFactoryPricePvtaM = castToType<double>(
        snapshotData['Precio_Fabrica_PvtaM_FactoryPricePvtaM']);
    _fechaDeCreacionCreatedDate =
        snapshotData['Fecha_de_Creacion_Created_Date'] as DateTime?;
    _stock = castToType<int>(snapshotData['Stock']);
    _precioventaconigv = castToType<double>(snapshotData['precioventaconigv']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Articles');

  static Stream<ArticlesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticlesRecord.fromSnapshot(s));

  static Future<ArticlesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticlesRecord.fromSnapshot(s));

  static ArticlesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticlesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticlesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticlesRecord._(reference, mapFromFirestore(data));

  static ArticlesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ArticlesRecord.getDocumentFromData(
        {
          'Codigo': snapshot.data['Codigo'],
          'Product_type': snapshot.data['Product_type'],
          'OEM': snapshot.data['OEM'],
          'Codigo_proveedor': snapshot.data['Codigo_proveedor'],
          'Nombre_name': snapshot.data['Nombre_name'],
          'Marca_brand': snapshot.data['Marca_brand'],
          'Unidad_de_medida_Measurement_unit':
              snapshot.data['Unidad_de_medida_Measurement_unit'],
          'Group_Grupo': snapshot.data['Group_Grupo'],
          'Subgroup_Subgrupo': snapshot.data['Subgroup_Subgrupo'],
          'Garantia_Warranty': snapshot.data['Garantia_Warranty'],
          'No_Sere_If_Have_Serial_Nr':
              snapshot.data['No_Sere_If_Have_Serial_Nr'],
          'Stock_minimo_Minimum_Stock': convertAlgoliaParam(
            snapshot.data['Stock_minimo_Minimum_Stock'],
            ParamType.int,
            false,
          ),
          'Moneda_Currency': snapshot.data['Moneda_Currency'],
          'Precio_compra_Purchase_price': convertAlgoliaParam(
            snapshot.data['Precio_compra_Purchase_price'],
            ParamType.double,
            false,
          ),
          'Utilidad_Profit_Percentage': convertAlgoliaParam(
            snapshot.data['Utilidad_Profit_Percentage'],
            ParamType.double,
            false,
          ),
          'Precio_Venta_Sale_price': convertAlgoliaParam(
            snapshot.data['Precio_Venta_Sale_price'],
            ParamType.double,
            false,
          ),
          'Codigo_de_Barras_Bar_Code':
              snapshot.data['Codigo_de_Barras_Bar_Code'],
          'Imagen_Picture': snapshot.data['Imagen_Picture'],
          'Ubicacion_Location': snapshot.data['Ubicacion_Location'],
          'Comentario': snapshot.data['Comentario'],
          'Precio_Fabrica_P1_FactoryPriceP1': convertAlgoliaParam(
            snapshot.data['Precio_Fabrica_P1_FactoryPriceP1'],
            ParamType.double,
            false,
          ),
          'Precio_Fabrica_P2_FactoryPriceP2': convertAlgoliaParam(
            snapshot.data['Precio_Fabrica_P2_FactoryPriceP2'],
            ParamType.double,
            false,
          ),
          'Precio_Fabrica_P3_FactoryPriceP3': convertAlgoliaParam(
            snapshot.data['Precio_Fabrica_P3_FactoryPriceP3'],
            ParamType.double,
            false,
          ),
          'Precio_Fabrica_PvtaM_FactoryPricePvtaM': convertAlgoliaParam(
            snapshot.data['Precio_Fabrica_PvtaM_FactoryPricePvtaM'],
            ParamType.double,
            false,
          ),
          'Fecha_de_Creacion_Created_Date': convertAlgoliaParam(
            snapshot.data['Fecha_de_Creacion_Created_Date'],
            ParamType.DateTime,
            false,
          ),
          'Stock': convertAlgoliaParam(
            snapshot.data['Stock'],
            ParamType.int,
            false,
          ),
          'precioventaconigv': convertAlgoliaParam(
            snapshot.data['precioventaconigv'],
            ParamType.double,
            false,
          ),
        },
        ArticlesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ArticlesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Articles',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ArticlesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticlesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticlesRecordData({
  String? codigo,
  String? productType,
  String? oem,
  String? codigoProveedor,
  String? nombreName,
  String? marcaBrand,
  String? unidadDeMedidaMeasurementUnit,
  String? groupGrupo,
  String? subgroupSubgrupo,
  String? garantiaWarranty,
  String? noSereIfHaveSerialNr,
  int? stockMinimoMinimumStock,
  String? monedaCurrency,
  double? precioCompraPurchasePrice,
  double? utilidadProfitPercentage,
  double? precioVentaSalePrice,
  String? codigoDeBarrasBarCode,
  String? imagenPicture,
  String? ubicacionLocation,
  String? comentario,
  double? precioFabricaP1FactoryPriceP1,
  double? precioFabricaP2FactoryPriceP2,
  double? precioFabricaP3FactoryPriceP3,
  double? precioFabricaPvtaMFactoryPricePvtaM,
  DateTime? fechaDeCreacionCreatedDate,
  int? stock,
  double? precioventaconigv,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Codigo': codigo,
      'Product_type': productType,
      'OEM': oem,
      'Codigo_proveedor': codigoProveedor,
      'Nombre_name': nombreName,
      'Marca_brand': marcaBrand,
      'Unidad_de_medida_Measurement_unit': unidadDeMedidaMeasurementUnit,
      'Group_Grupo': groupGrupo,
      'Subgroup_Subgrupo': subgroupSubgrupo,
      'Garantia_Warranty': garantiaWarranty,
      'No_Sere_If_Have_Serial_Nr': noSereIfHaveSerialNr,
      'Stock_minimo_Minimum_Stock': stockMinimoMinimumStock,
      'Moneda_Currency': monedaCurrency,
      'Precio_compra_Purchase_price': precioCompraPurchasePrice,
      'Utilidad_Profit_Percentage': utilidadProfitPercentage,
      'Precio_Venta_Sale_price': precioVentaSalePrice,
      'Codigo_de_Barras_Bar_Code': codigoDeBarrasBarCode,
      'Imagen_Picture': imagenPicture,
      'Ubicacion_Location': ubicacionLocation,
      'Comentario': comentario,
      'Precio_Fabrica_P1_FactoryPriceP1': precioFabricaP1FactoryPriceP1,
      'Precio_Fabrica_P2_FactoryPriceP2': precioFabricaP2FactoryPriceP2,
      'Precio_Fabrica_P3_FactoryPriceP3': precioFabricaP3FactoryPriceP3,
      'Precio_Fabrica_PvtaM_FactoryPricePvtaM':
          precioFabricaPvtaMFactoryPricePvtaM,
      'Fecha_de_Creacion_Created_Date': fechaDeCreacionCreatedDate,
      'Stock': stock,
      'precioventaconigv': precioventaconigv,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticlesRecordDocumentEquality implements Equality<ArticlesRecord> {
  const ArticlesRecordDocumentEquality();

  @override
  bool equals(ArticlesRecord? e1, ArticlesRecord? e2) {
    return e1?.codigo == e2?.codigo &&
        e1?.productType == e2?.productType &&
        e1?.oem == e2?.oem &&
        e1?.codigoProveedor == e2?.codigoProveedor &&
        e1?.nombreName == e2?.nombreName &&
        e1?.marcaBrand == e2?.marcaBrand &&
        e1?.unidadDeMedidaMeasurementUnit ==
            e2?.unidadDeMedidaMeasurementUnit &&
        e1?.groupGrupo == e2?.groupGrupo &&
        e1?.subgroupSubgrupo == e2?.subgroupSubgrupo &&
        e1?.garantiaWarranty == e2?.garantiaWarranty &&
        e1?.noSereIfHaveSerialNr == e2?.noSereIfHaveSerialNr &&
        e1?.stockMinimoMinimumStock == e2?.stockMinimoMinimumStock &&
        e1?.monedaCurrency == e2?.monedaCurrency &&
        e1?.precioCompraPurchasePrice == e2?.precioCompraPurchasePrice &&
        e1?.utilidadProfitPercentage == e2?.utilidadProfitPercentage &&
        e1?.precioVentaSalePrice == e2?.precioVentaSalePrice &&
        e1?.codigoDeBarrasBarCode == e2?.codigoDeBarrasBarCode &&
        e1?.imagenPicture == e2?.imagenPicture &&
        e1?.ubicacionLocation == e2?.ubicacionLocation &&
        e1?.comentario == e2?.comentario &&
        e1?.precioFabricaP1FactoryPriceP1 ==
            e2?.precioFabricaP1FactoryPriceP1 &&
        e1?.precioFabricaP2FactoryPriceP2 ==
            e2?.precioFabricaP2FactoryPriceP2 &&
        e1?.precioFabricaP3FactoryPriceP3 ==
            e2?.precioFabricaP3FactoryPriceP3 &&
        e1?.precioFabricaPvtaMFactoryPricePvtaM ==
            e2?.precioFabricaPvtaMFactoryPricePvtaM &&
        e1?.fechaDeCreacionCreatedDate == e2?.fechaDeCreacionCreatedDate &&
        e1?.stock == e2?.stock &&
        e1?.precioventaconigv == e2?.precioventaconigv;
  }

  @override
  int hash(ArticlesRecord? e) => const ListEquality().hash([
        e?.codigo,
        e?.productType,
        e?.oem,
        e?.codigoProveedor,
        e?.nombreName,
        e?.marcaBrand,
        e?.unidadDeMedidaMeasurementUnit,
        e?.groupGrupo,
        e?.subgroupSubgrupo,
        e?.garantiaWarranty,
        e?.noSereIfHaveSerialNr,
        e?.stockMinimoMinimumStock,
        e?.monedaCurrency,
        e?.precioCompraPurchasePrice,
        e?.utilidadProfitPercentage,
        e?.precioVentaSalePrice,
        e?.codigoDeBarrasBarCode,
        e?.imagenPicture,
        e?.ubicacionLocation,
        e?.comentario,
        e?.precioFabricaP1FactoryPriceP1,
        e?.precioFabricaP2FactoryPriceP2,
        e?.precioFabricaP3FactoryPriceP3,
        e?.precioFabricaPvtaMFactoryPricePvtaM,
        e?.fechaDeCreacionCreatedDate,
        e?.stock,
        e?.precioventaconigv
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticlesRecord;
}
