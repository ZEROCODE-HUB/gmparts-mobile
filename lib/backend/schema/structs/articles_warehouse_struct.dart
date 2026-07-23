// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ArticlesWarehouseStruct extends FFFirebaseStruct {
  ArticlesWarehouseStruct({
    int? quantity,
    String? descripcin,
    String? code,
    String? unit,
    double? totalPrice,
    DocumentReference? articles,
    double? pricePerUnit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quantity = quantity,
        _descripcin = descripcin,
        _code = code,
        _unit = unit,
        _totalPrice = totalPrice,
        _articles = articles,
        _pricePerUnit = pricePerUnit,
        super(firestoreUtilData);

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "Descripcin" field.
  String? _descripcin;
  String get descripcin => _descripcin ?? '';
  set descripcin(String? val) => _descripcin = val;

  bool hasDescripcin() => _descripcin != null;

  // "Code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  // "TotalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;

  void incrementTotalPrice(double amount) => totalPrice = totalPrice + amount;

  bool hasTotalPrice() => _totalPrice != null;

  // "Articles" field.
  DocumentReference? _articles;
  DocumentReference? get articles => _articles;
  set articles(DocumentReference? val) => _articles = val;

  bool hasArticles() => _articles != null;

  // "PricePerUnit" field.
  double? _pricePerUnit;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  set pricePerUnit(double? val) => _pricePerUnit = val;

  void incrementPricePerUnit(double amount) =>
      pricePerUnit = pricePerUnit + amount;

  bool hasPricePerUnit() => _pricePerUnit != null;

  static ArticlesWarehouseStruct fromMap(Map<String, dynamic> data) =>
      ArticlesWarehouseStruct(
        quantity: castToType<int>(data['Quantity']),
        descripcin: data['Descripcin'] as String?,
        code: data['Code'] as String?,
        unit: data['unit'] as String?,
        totalPrice: castToType<double>(data['TotalPrice']),
        articles: data['Articles'] as DocumentReference?,
        pricePerUnit: castToType<double>(data['PricePerUnit']),
      );

  static ArticlesWarehouseStruct? maybeFromMap(dynamic data) => data is Map
      ? ArticlesWarehouseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Quantity': _quantity,
        'Descripcin': _descripcin,
        'Code': _code,
        'unit': _unit,
        'TotalPrice': _totalPrice,
        'Articles': _articles,
        'PricePerUnit': _pricePerUnit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'Descripcin': serializeParam(
          _descripcin,
          ParamType.String,
        ),
        'Code': serializeParam(
          _code,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'TotalPrice': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
        'Articles': serializeParam(
          _articles,
          ParamType.DocumentReference,
        ),
        'PricePerUnit': serializeParam(
          _pricePerUnit,
          ParamType.double,
        ),
      }.withoutNulls;

  static ArticlesWarehouseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ArticlesWarehouseStruct(
        quantity: deserializeParam(
          data['Quantity'],
          ParamType.int,
          false,
        ),
        descripcin: deserializeParam(
          data['Descripcin'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['Code'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        totalPrice: deserializeParam(
          data['TotalPrice'],
          ParamType.double,
          false,
        ),
        articles: deserializeParam(
          data['Articles'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Articles'],
        ),
        pricePerUnit: deserializeParam(
          data['PricePerUnit'],
          ParamType.double,
          false,
        ),
      );

  static ArticlesWarehouseStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ArticlesWarehouseStruct(
        quantity: convertAlgoliaParam(
          data['Quantity'],
          ParamType.int,
          false,
        ),
        descripcin: convertAlgoliaParam(
          data['Descripcin'],
          ParamType.String,
          false,
        ),
        code: convertAlgoliaParam(
          data['Code'],
          ParamType.String,
          false,
        ),
        unit: convertAlgoliaParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        totalPrice: convertAlgoliaParam(
          data['TotalPrice'],
          ParamType.double,
          false,
        ),
        articles: convertAlgoliaParam(
          data['Articles'],
          ParamType.DocumentReference,
          false,
        ),
        pricePerUnit: convertAlgoliaParam(
          data['PricePerUnit'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ArticlesWarehouseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ArticlesWarehouseStruct &&
        quantity == other.quantity &&
        descripcin == other.descripcin &&
        code == other.code &&
        unit == other.unit &&
        totalPrice == other.totalPrice &&
        articles == other.articles &&
        pricePerUnit == other.pricePerUnit;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [quantity, descripcin, code, unit, totalPrice, articles, pricePerUnit]);
}

ArticlesWarehouseStruct createArticlesWarehouseStruct({
  int? quantity,
  String? descripcin,
  String? code,
  String? unit,
  double? totalPrice,
  DocumentReference? articles,
  double? pricePerUnit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArticlesWarehouseStruct(
      quantity: quantity,
      descripcin: descripcin,
      code: code,
      unit: unit,
      totalPrice: totalPrice,
      articles: articles,
      pricePerUnit: pricePerUnit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ArticlesWarehouseStruct? updateArticlesWarehouseStruct(
  ArticlesWarehouseStruct? articlesWarehouse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    articlesWarehouse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addArticlesWarehouseStructData(
  Map<String, dynamic> firestoreData,
  ArticlesWarehouseStruct? articlesWarehouse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (articlesWarehouse == null) {
    return;
  }
  if (articlesWarehouse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && articlesWarehouse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final articlesWarehouseData =
      getArticlesWarehouseFirestoreData(articlesWarehouse, forFieldValue);
  final nestedData =
      articlesWarehouseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = articlesWarehouse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getArticlesWarehouseFirestoreData(
  ArticlesWarehouseStruct? articlesWarehouse, [
  bool forFieldValue = false,
]) {
  if (articlesWarehouse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(articlesWarehouse.toMap());

  // Add any Firestore field values
  mapToFirestore(articlesWarehouse.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArticlesWarehouseListFirestoreData(
  List<ArticlesWarehouseStruct>? articlesWarehouses,
) =>
    articlesWarehouses
        ?.map((e) => getArticlesWarehouseFirestoreData(e, true))
        .toList() ??
    [];
