import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Lista = prefs.getStringList('ff_Lista') ?? _Lista;
    });
    _safeInit(() {
      _costo = prefs.getDouble('ff_costo') ?? _costo;
    });
    _safeInit(() {
      _ArticaleList = prefs
              .getStringList('ff_ArticaleList')
              ?.map((x) {
                try {
                  return ArticlesWarehouseStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ArticaleList;
    });
    _safeInit(() {
      _select = prefs.getString('ff_select') ?? _select;
    });
    _safeInit(() {
      _ListMarca = prefs
              .getStringList('ff_ListMarca')
              ?.map((x) {
                try {
                  return MarcaStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ListMarca;
    });
    _safeInit(() {
      _Fechadesde = prefs.containsKey('ff_Fechadesde')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_Fechadesde')!)
          : _Fechadesde;
    });
    _safeInit(() {
      _FechaHasta = prefs.containsKey('ff_FechaHasta')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_FechaHasta')!)
          : _FechaHasta;
    });
    _safeInit(() {
      _correlativofactura =
          prefs.getInt('ff_correlativofactura') ?? _correlativofactura;
    });
    _safeInit(() {
      _correlativoboleta =
          prefs.getInt('ff_correlativoboleta') ?? _correlativoboleta;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _Lista = [
    'Dato inicial 1',
    'Dato inicial 2',
    'Dato inicial 3',
    'Dato inicial 4',
    'Dato inicial 5'
  ];
  List<String> get Lista => _Lista;
  set Lista(List<String> value) {
    _Lista = value;
    prefs.setStringList('ff_Lista', value);
  }

  void addToLista(String value) {
    Lista.add(value);
    prefs.setStringList('ff_Lista', _Lista);
  }

  void removeFromLista(String value) {
    Lista.remove(value);
    prefs.setStringList('ff_Lista', _Lista);
  }

  void removeAtIndexFromLista(int index) {
    Lista.removeAt(index);
    prefs.setStringList('ff_Lista', _Lista);
  }

  void updateListaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Lista[index] = updateFn(_Lista[index]);
    prefs.setStringList('ff_Lista', _Lista);
  }

  void insertAtIndexInLista(int index, String value) {
    Lista.insert(index, value);
    prefs.setStringList('ff_Lista', _Lista);
  }

  double _costo = 60.0;
  double get costo => _costo;
  set costo(double value) {
    _costo = value;
    prefs.setDouble('ff_costo', value);
  }

  List<ArticlesWarehouseStruct> _ArticaleList = [];
  List<ArticlesWarehouseStruct> get ArticaleList => _ArticaleList;
  set ArticaleList(List<ArticlesWarehouseStruct> value) {
    _ArticaleList = value;
    prefs.setStringList(
        'ff_ArticaleList', value.map((x) => x.serialize()).toList());
  }

  void addToArticaleList(ArticlesWarehouseStruct value) {
    ArticaleList.add(value);
    prefs.setStringList(
        'ff_ArticaleList', _ArticaleList.map((x) => x.serialize()).toList());
  }

  void removeFromArticaleList(ArticlesWarehouseStruct value) {
    ArticaleList.remove(value);
    prefs.setStringList(
        'ff_ArticaleList', _ArticaleList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromArticaleList(int index) {
    ArticaleList.removeAt(index);
    prefs.setStringList(
        'ff_ArticaleList', _ArticaleList.map((x) => x.serialize()).toList());
  }

  void updateArticaleListAtIndex(
    int index,
    ArticlesWarehouseStruct Function(ArticlesWarehouseStruct) updateFn,
  ) {
    ArticaleList[index] = updateFn(_ArticaleList[index]);
    prefs.setStringList(
        'ff_ArticaleList', _ArticaleList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInArticaleList(int index, ArticlesWarehouseStruct value) {
    ArticaleList.insert(index, value);
    prefs.setStringList(
        'ff_ArticaleList', _ArticaleList.map((x) => x.serialize()).toList());
  }

  String _select = '';
  String get select => _select;
  set select(String value) {
    _select = value;
    prefs.setString('ff_select', value);
  }

  List<MarcaStruct> _ListMarca = [];
  List<MarcaStruct> get ListMarca => _ListMarca;
  set ListMarca(List<MarcaStruct> value) {
    _ListMarca = value;
    prefs.setStringList(
        'ff_ListMarca', value.map((x) => x.serialize()).toList());
  }

  void addToListMarca(MarcaStruct value) {
    ListMarca.add(value);
    prefs.setStringList(
        'ff_ListMarca', _ListMarca.map((x) => x.serialize()).toList());
  }

  void removeFromListMarca(MarcaStruct value) {
    ListMarca.remove(value);
    prefs.setStringList(
        'ff_ListMarca', _ListMarca.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListMarca(int index) {
    ListMarca.removeAt(index);
    prefs.setStringList(
        'ff_ListMarca', _ListMarca.map((x) => x.serialize()).toList());
  }

  void updateListMarcaAtIndex(
    int index,
    MarcaStruct Function(MarcaStruct) updateFn,
  ) {
    ListMarca[index] = updateFn(_ListMarca[index]);
    prefs.setStringList(
        'ff_ListMarca', _ListMarca.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListMarca(int index, MarcaStruct value) {
    ListMarca.insert(index, value);
    prefs.setStringList(
        'ff_ListMarca', _ListMarca.map((x) => x.serialize()).toList());
  }

  List<int> _addNew = [];
  List<int> get addNew => _addNew;
  set addNew(List<int> value) {
    _addNew = value;
  }

  void addToAddNew(int value) {
    addNew.add(value);
  }

  void removeFromAddNew(int value) {
    addNew.remove(value);
  }

  void removeAtIndexFromAddNew(int index) {
    addNew.removeAt(index);
  }

  void updateAddNewAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    addNew[index] = updateFn(_addNew[index]);
  }

  void insertAtIndexInAddNew(int index, int value) {
    addNew.insert(index, value);
  }

  DateTime? _Fechadesde = DateTime.fromMillisecondsSinceEpoch(1700854080000);
  DateTime? get Fechadesde => _Fechadesde;
  set Fechadesde(DateTime? value) {
    _Fechadesde = value;
    value != null
        ? prefs.setInt('ff_Fechadesde', value.millisecondsSinceEpoch)
        : prefs.remove('ff_Fechadesde');
  }

  DateTime? _FechaHasta = DateTime.fromMillisecondsSinceEpoch(10352777340000);
  DateTime? get FechaHasta => _FechaHasta;
  set FechaHasta(DateTime? value) {
    _FechaHasta = value;
    value != null
        ? prefs.setInt('ff_FechaHasta', value.millisecondsSinceEpoch)
        : prefs.remove('ff_FechaHasta');
  }

  List<FacturasArticulosStruct> _CrearFacturas = [];
  List<FacturasArticulosStruct> get CrearFacturas => _CrearFacturas;
  set CrearFacturas(List<FacturasArticulosStruct> value) {
    _CrearFacturas = value;
  }

  void addToCrearFacturas(FacturasArticulosStruct value) {
    CrearFacturas.add(value);
  }

  void removeFromCrearFacturas(FacturasArticulosStruct value) {
    CrearFacturas.remove(value);
  }

  void removeAtIndexFromCrearFacturas(int index) {
    CrearFacturas.removeAt(index);
  }

  void updateCrearFacturasAtIndex(
    int index,
    FacturasArticulosStruct Function(FacturasArticulosStruct) updateFn,
  ) {
    CrearFacturas[index] = updateFn(_CrearFacturas[index]);
  }

  void insertAtIndexInCrearFacturas(int index, FacturasArticulosStruct value) {
    CrearFacturas.insert(index, value);
  }

  int _correlativofactura = 2;
  int get correlativofactura => _correlativofactura;
  set correlativofactura(int value) {
    _correlativofactura = value;
    prefs.setInt('ff_correlativofactura', value);
  }

  int _correlativoboleta = 2;
  int get correlativoboleta => _correlativoboleta;
  set correlativoboleta(int value) {
    _correlativoboleta = value;
    prefs.setInt('ff_correlativoboleta', value);
  }

  final _repuestosManager = StreamRequestManager<List<ArticlesRecord>>();
  Stream<List<ArticlesRecord>> repuestos({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ArticlesRecord>> Function() requestFn,
  }) =>
      _repuestosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRepuestosCache() => _repuestosManager.clear();
  void clearRepuestosCacheKey(String? uniqueKey) =>
      _repuestosManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
