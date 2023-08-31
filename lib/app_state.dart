import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _userId = await secureStorage.getString('ff_userId') ?? _userId;
    });
    await _safeInitAsync(() async {
      _token = await secureStorage.getString('ff_token') ?? _token;
    });
    await _safeInitAsync(() async {
      _noOfMachinesDown =
          await secureStorage.getString('ff_noOfMachinesDown') ??
              _noOfMachinesDown;
    });
    await _safeInitAsync(() async {
      _noOfMachineTransactionDip =
          await secureStorage.getString('ff_noOfMachineTransactionDip') ??
              _noOfMachineTransactionDip;
    });
    await _safeInitAsync(() async {
      _totalMachinesManaged =
          await secureStorage.getString('ff_totalMachinesManaged') ??
              _totalMachinesManaged;
    });
    await _safeInitAsync(() async {
      _visibilityState =
          await secureStorage.getBool('ff_visibilityState') ?? _visibilityState;
    });
    await _safeInitAsync(() async {
      _atmId = await secureStorage.getString('ff_atmId') ?? _atmId;
    });
    await _safeInitAsync(() async {
      _atmInfoState =
          await secureStorage.getBool('ff_atmInfoState') ?? _atmInfoState;
    });
    await _safeInitAsync(() async {
      _awardState = await secureStorage.getBool('ff_awardState') ?? _awardState;
    });
    await _safeInitAsync(() async {
      _targetIncState =
          await secureStorage.getBool('ff_targetIncState') ?? _targetIncState;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_machineDownJson') != null) {
        try {
          _machineDownJson = jsonDecode(
              await secureStorage.getString('ff_machineDownJson') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_transactionDipJson') != null) {
        try {
          _transactionDipJson = jsonDecode(
              await secureStorage.getString('ff_transactionDipJson') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_LastUpdatedBankDataJson') != null) {
        try {
          _LastUpdatedBankDataJson = jsonDecode(
              await secureStorage.getString('ff_LastUpdatedBankDataJson') ??
                  '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_allMachineDetails') != null) {
        try {
          _allMachineDetails = jsonDecode(
              await secureStorage.getString('ff_allMachineDetails') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _searchValue1 =
          await secureStorage.getString('ff_searchValue1') ?? _searchValue1;
    });
    await _safeInitAsync(() async {
      _searchValue2 =
          await secureStorage.getString('ff_searchValue2') ?? _searchValue2;
    });
    await _safeInitAsync(() async {
      _searchValue3 =
          await secureStorage.getString('ff_searchValue3') ?? _searchValue3;
    });
    await _safeInitAsync(() async {
      _sortByFilter =
          await secureStorage.getString('ff_sortByFilter') ?? _sortByFilter;
    });
    await _safeInitAsync(() async {
      _gradeFilter =
          await secureStorage.getString('ff_gradeFilter') ?? _gradeFilter;
    });
    await _safeInitAsync(() async {
      _reasonFilter =
          await secureStorage.getString('ff_reasonFilter') ?? _reasonFilter;
    });
    await _safeInitAsync(() async {
      _transactionTrendFilter =
          await secureStorage.getString('ff_transactionTrendFilter') ??
              _transactionTrendFilter;
    });
    await _safeInitAsync(() async {
      _uptimeTrendFilter =
          await secureStorage.getString('ff_uptimeTrendFilter') ??
              _uptimeTrendFilter;
    });
    await _safeInitAsync(() async {
      _downTimeFilter =
          await secureStorage.getString('ff_downTimeFilter') ?? _downTimeFilter;
    });
    await _safeInitAsync(() async {
      _bankFilter =
          await secureStorage.getString('ff_bankFilter') ?? _bankFilter;
    });
    await _safeInitAsync(() async {
      _locationFilter =
          await secureStorage.getString('ff_locationFilter') ?? _locationFilter;
    });
    await _safeInitAsync(() async {
      _sortByFilterTab =
          await secureStorage.getBool('ff_sortByFilterTab') ?? _sortByFilterTab;
    });
    await _safeInitAsync(() async {
      _reasonFilterTab =
          await secureStorage.getBool('ff_reasonFilterTab') ?? _reasonFilterTab;
    });
    await _safeInitAsync(() async {
      _gradeFilterTab =
          await secureStorage.getBool('ff_gradeFilterTab') ?? _gradeFilterTab;
    });
    await _safeInitAsync(() async {
      _uptimeTrendFilterTab =
          await secureStorage.getBool('ff_uptimeTrendFilterTab') ??
              _uptimeTrendFilterTab;
    });
    await _safeInitAsync(() async {
      _transactionTrendFilterTab =
          await secureStorage.getBool('ff_transactionTrendFilterTab') ??
              _transactionTrendFilterTab;
    });
    await _safeInitAsync(() async {
      _downTimeFilterTab =
          await secureStorage.getBool('ff_downTimeFilterTab') ??
              _downTimeFilterTab;
    });
    await _safeInitAsync(() async {
      _bankFilterTab =
          await secureStorage.getBool('ff_bankFilterTab') ?? _bankFilterTab;
    });
    await _safeInitAsync(() async {
      _locationFilterTab =
          await secureStorage.getBool('ff_locationFilterTab') ??
              _locationFilterTab;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _userId = '';
  String get userId => _userId;
  set userId(String _value) {
    _userId = _value;
    secureStorage.setString('ff_userId', _value);
  }

  void deleteUserId() {
    secureStorage.delete(key: 'ff_userId');
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    secureStorage.setString('ff_token', _value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
  }

  String _noOfMachinesDown = '0';
  String get noOfMachinesDown => _noOfMachinesDown;
  set noOfMachinesDown(String _value) {
    _noOfMachinesDown = _value;
    secureStorage.setString('ff_noOfMachinesDown', _value);
  }

  void deleteNoOfMachinesDown() {
    secureStorage.delete(key: 'ff_noOfMachinesDown');
  }

  String _noOfMachineTransactionDip = '0';
  String get noOfMachineTransactionDip => _noOfMachineTransactionDip;
  set noOfMachineTransactionDip(String _value) {
    _noOfMachineTransactionDip = _value;
    secureStorage.setString('ff_noOfMachineTransactionDip', _value);
  }

  void deleteNoOfMachineTransactionDip() {
    secureStorage.delete(key: 'ff_noOfMachineTransactionDip');
  }

  String _totalMachinesManaged = '0';
  String get totalMachinesManaged => _totalMachinesManaged;
  set totalMachinesManaged(String _value) {
    _totalMachinesManaged = _value;
    secureStorage.setString('ff_totalMachinesManaged', _value);
  }

  void deleteTotalMachinesManaged() {
    secureStorage.delete(key: 'ff_totalMachinesManaged');
  }

  bool _visibilityState = false;
  bool get visibilityState => _visibilityState;
  set visibilityState(bool _value) {
    _visibilityState = _value;
    secureStorage.setBool('ff_visibilityState', _value);
  }

  void deleteVisibilityState() {
    secureStorage.delete(key: 'ff_visibilityState');
  }

  String _atmId = '';
  String get atmId => _atmId;
  set atmId(String _value) {
    _atmId = _value;
    secureStorage.setString('ff_atmId', _value);
  }

  void deleteAtmId() {
    secureStorage.delete(key: 'ff_atmId');
  }

  bool _atmInfoState = false;
  bool get atmInfoState => _atmInfoState;
  set atmInfoState(bool _value) {
    _atmInfoState = _value;
    secureStorage.setBool('ff_atmInfoState', _value);
  }

  void deleteAtmInfoState() {
    secureStorage.delete(key: 'ff_atmInfoState');
  }

  bool _awardState = true;
  bool get awardState => _awardState;
  set awardState(bool _value) {
    _awardState = _value;
    secureStorage.setBool('ff_awardState', _value);
  }

  void deleteAwardState() {
    secureStorage.delete(key: 'ff_awardState');
  }

  bool _targetIncState = false;
  bool get targetIncState => _targetIncState;
  set targetIncState(bool _value) {
    _targetIncState = _value;
    secureStorage.setBool('ff_targetIncState', _value);
  }

  void deleteTargetIncState() {
    secureStorage.delete(key: 'ff_targetIncState');
  }

  dynamic _machineDownJson;
  dynamic get machineDownJson => _machineDownJson;
  set machineDownJson(dynamic _value) {
    _machineDownJson = _value;
    secureStorage.setString('ff_machineDownJson', jsonEncode(_value));
  }

  void deleteMachineDownJson() {
    secureStorage.delete(key: 'ff_machineDownJson');
  }

  dynamic _transactionDipJson;
  dynamic get transactionDipJson => _transactionDipJson;
  set transactionDipJson(dynamic _value) {
    _transactionDipJson = _value;
    secureStorage.setString('ff_transactionDipJson', jsonEncode(_value));
  }

  void deleteTransactionDipJson() {
    secureStorage.delete(key: 'ff_transactionDipJson');
  }

  dynamic _LastUpdatedBankDataJson;
  dynamic get LastUpdatedBankDataJson => _LastUpdatedBankDataJson;
  set LastUpdatedBankDataJson(dynamic _value) {
    _LastUpdatedBankDataJson = _value;
    secureStorage.setString('ff_LastUpdatedBankDataJson', jsonEncode(_value));
  }

  void deleteLastUpdatedBankDataJson() {
    secureStorage.delete(key: 'ff_LastUpdatedBankDataJson');
  }

  dynamic _allMachineDetails;
  dynamic get allMachineDetails => _allMachineDetails;
  set allMachineDetails(dynamic _value) {
    _allMachineDetails = _value;
    secureStorage.setString('ff_allMachineDetails', jsonEncode(_value));
  }

  void deleteAllMachineDetails() {
    secureStorage.delete(key: 'ff_allMachineDetails');
  }

  String _searchValue1 = '';
  String get searchValue1 => _searchValue1;
  set searchValue1(String _value) {
    _searchValue1 = _value;
    secureStorage.setString('ff_searchValue1', _value);
  }

  void deleteSearchValue1() {
    secureStorage.delete(key: 'ff_searchValue1');
  }

  String _searchValue2 = '';
  String get searchValue2 => _searchValue2;
  set searchValue2(String _value) {
    _searchValue2 = _value;
    secureStorage.setString('ff_searchValue2', _value);
  }

  void deleteSearchValue2() {
    secureStorage.delete(key: 'ff_searchValue2');
  }

  String _searchValue3 = '';
  String get searchValue3 => _searchValue3;
  set searchValue3(String _value) {
    _searchValue3 = _value;
    secureStorage.setString('ff_searchValue3', _value);
  }

  void deleteSearchValue3() {
    secureStorage.delete(key: 'ff_searchValue3');
  }

  String _sortByFilter = '';
  String get sortByFilter => _sortByFilter;
  set sortByFilter(String _value) {
    _sortByFilter = _value;
    secureStorage.setString('ff_sortByFilter', _value);
  }

  void deleteSortByFilter() {
    secureStorage.delete(key: 'ff_sortByFilter');
  }

  String _gradeFilter = '';
  String get gradeFilter => _gradeFilter;
  set gradeFilter(String _value) {
    _gradeFilter = _value;
    secureStorage.setString('ff_gradeFilter', _value);
  }

  void deleteGradeFilter() {
    secureStorage.delete(key: 'ff_gradeFilter');
  }

  String _reasonFilter = '';
  String get reasonFilter => _reasonFilter;
  set reasonFilter(String _value) {
    _reasonFilter = _value;
    secureStorage.setString('ff_reasonFilter', _value);
  }

  void deleteReasonFilter() {
    secureStorage.delete(key: 'ff_reasonFilter');
  }

  String _transactionTrendFilter = '';
  String get transactionTrendFilter => _transactionTrendFilter;
  set transactionTrendFilter(String _value) {
    _transactionTrendFilter = _value;
    secureStorage.setString('ff_transactionTrendFilter', _value);
  }

  void deleteTransactionTrendFilter() {
    secureStorage.delete(key: 'ff_transactionTrendFilter');
  }

  String _uptimeTrendFilter = '';
  String get uptimeTrendFilter => _uptimeTrendFilter;
  set uptimeTrendFilter(String _value) {
    _uptimeTrendFilter = _value;
    secureStorage.setString('ff_uptimeTrendFilter', _value);
  }

  void deleteUptimeTrendFilter() {
    secureStorage.delete(key: 'ff_uptimeTrendFilter');
  }

  String _downTimeFilter = '';
  String get downTimeFilter => _downTimeFilter;
  set downTimeFilter(String _value) {
    _downTimeFilter = _value;
    secureStorage.setString('ff_downTimeFilter', _value);
  }

  void deleteDownTimeFilter() {
    secureStorage.delete(key: 'ff_downTimeFilter');
  }

  String _bankFilter = '';
  String get bankFilter => _bankFilter;
  set bankFilter(String _value) {
    _bankFilter = _value;
    secureStorage.setString('ff_bankFilter', _value);
  }

  void deleteBankFilter() {
    secureStorage.delete(key: 'ff_bankFilter');
  }

  String _locationFilter = '';
  String get locationFilter => _locationFilter;
  set locationFilter(String _value) {
    _locationFilter = _value;
    secureStorage.setString('ff_locationFilter', _value);
  }

  void deleteLocationFilter() {
    secureStorage.delete(key: 'ff_locationFilter');
  }

  bool _sortByFilterTab = false;
  bool get sortByFilterTab => _sortByFilterTab;
  set sortByFilterTab(bool _value) {
    _sortByFilterTab = _value;
    secureStorage.setBool('ff_sortByFilterTab', _value);
  }

  void deleteSortByFilterTab() {
    secureStorage.delete(key: 'ff_sortByFilterTab');
  }

  bool _reasonFilterTab = false;
  bool get reasonFilterTab => _reasonFilterTab;
  set reasonFilterTab(bool _value) {
    _reasonFilterTab = _value;
    secureStorage.setBool('ff_reasonFilterTab', _value);
  }

  void deleteReasonFilterTab() {
    secureStorage.delete(key: 'ff_reasonFilterTab');
  }

  bool _gradeFilterTab = false;
  bool get gradeFilterTab => _gradeFilterTab;
  set gradeFilterTab(bool _value) {
    _gradeFilterTab = _value;
    secureStorage.setBool('ff_gradeFilterTab', _value);
  }

  void deleteGradeFilterTab() {
    secureStorage.delete(key: 'ff_gradeFilterTab');
  }

  bool _uptimeTrendFilterTab = false;
  bool get uptimeTrendFilterTab => _uptimeTrendFilterTab;
  set uptimeTrendFilterTab(bool _value) {
    _uptimeTrendFilterTab = _value;
    secureStorage.setBool('ff_uptimeTrendFilterTab', _value);
  }

  void deleteUptimeTrendFilterTab() {
    secureStorage.delete(key: 'ff_uptimeTrendFilterTab');
  }

  bool _transactionTrendFilterTab = false;
  bool get transactionTrendFilterTab => _transactionTrendFilterTab;
  set transactionTrendFilterTab(bool _value) {
    _transactionTrendFilterTab = _value;
    secureStorage.setBool('ff_transactionTrendFilterTab', _value);
  }

  void deleteTransactionTrendFilterTab() {
    secureStorage.delete(key: 'ff_transactionTrendFilterTab');
  }

  bool _downTimeFilterTab = false;
  bool get downTimeFilterTab => _downTimeFilterTab;
  set downTimeFilterTab(bool _value) {
    _downTimeFilterTab = _value;
    secureStorage.setBool('ff_downTimeFilterTab', _value);
  }

  void deleteDownTimeFilterTab() {
    secureStorage.delete(key: 'ff_downTimeFilterTab');
  }

  bool _bankFilterTab = false;
  bool get bankFilterTab => _bankFilterTab;
  set bankFilterTab(bool _value) {
    _bankFilterTab = _value;
    secureStorage.setBool('ff_bankFilterTab', _value);
  }

  void deleteBankFilterTab() {
    secureStorage.delete(key: 'ff_bankFilterTab');
  }

  bool _locationFilterTab = false;
  bool get locationFilterTab => _locationFilterTab;
  set locationFilterTab(bool _value) {
    _locationFilterTab = _value;
    secureStorage.setBool('ff_locationFilterTab', _value);
  }

  void deleteLocationFilterTab() {
    secureStorage.delete(key: 'ff_locationFilterTab');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
