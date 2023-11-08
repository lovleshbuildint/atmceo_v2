import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

Color? colorChange(int? transactionTrendInt) {
  // return color #B1000E if transactionTrendInt is less then 0 else return #3AB100
  if (transactionTrendInt != null && transactionTrendInt < 0) {
    return Color(0xFFB1000E);
  } else {
    return Color(0xFF3AB100);
  }
}

dynamic filter(
  dynamic mainData,
  String? searchValue,
  String? transactionTrendFilter,
  String? gradeFilter,
  String? uptimeTrendFilter,
  String? bankFilter,
  String? locationFilter,
  String? downTimeFilter,
  String? sortByFilter,
  String? reasonByFilter,
) {
  bool isFilterMultipleEnabled = false;
  int filterCount =
      (transactionTrendFilter != null && transactionTrendFilter.isNotEmpty
              ? 1
              : 0) +
          (gradeFilter != null && gradeFilter.isNotEmpty ? 1 : 0) +
          (uptimeTrendFilter != null && uptimeTrendFilter.isNotEmpty ? 1 : 0) +
          (locationFilter != null && locationFilter.isNotEmpty ? 1 : 0) +
          (bankFilter != null && bankFilter.isNotEmpty ? 1 : 0) +
          (reasonByFilter != null && reasonByFilter.isNotEmpty ? 1 : 0);

  isFilterMultipleEnabled = filterCount > 1 ? true : false;

  List<dynamic> sortBy(List<dynamic> filteredData, String sortByFilter) {
    if (sortByFilter == "Transaction: High to Low") {
      filteredData.sort(
          (a, b) => b['transactionTrend'].compareTo(a['transactionTrend']));
    } else if (sortByFilter == "Transaction: Low to High") {
      filteredData.sort(
          (a, b) => a['transactionTrend'].compareTo(b['transactionTrend']));
    } else if (sortByFilter == "Uptime: High to Low") {
      filteredData.sort((a, b) => b['uptimeTrend'].compareTo(a['uptimeTrend']));
    } else if (sortByFilter == "Uptime: Low to High") {
      filteredData.sort((a, b) => a['uptimeTrend'].compareTo(b['uptimeTrend']));
    } else if (sortByFilter == "Downtime: High to Low") {
      filteredData.sort((a, b) => b['downTime'].compareTo(a['downTime']));
    } else if (sortByFilter == "Downtime: Low to High") {
      filteredData.sort((a, b) => a['downTime'].compareTo(b['downTime']));
    }
    return filteredData;
  }

  if (searchValue == null || searchValue.isEmpty) {
    List<dynamic> filteredData1 = [];
    if (transactionTrendFilter != null && transactionTrendFilter.isNotEmpty) {
      if (transactionTrendFilter.startsWith('-(') &&
          transactionTrendFilter.endsWith(')')) {
        var range = transactionTrendFilter.substring(
            2, transactionTrendFilter.length - 1);
        var rangeValues = range.split(' - ');
        var upperBound =
            int.tryParse(rangeValues[0].replaceAll('%', '').trim());
        upperBound = -1 * upperBound!;
        var lowerBound =
            int.tryParse(rangeValues[1].replaceAll('%', '').trim());
        lowerBound = -1 * lowerBound!;
        for (dynamic data in mainData['data']) {
          if (data['transactionTrend'] <= lowerBound &&
              data['transactionTrend'] >= upperBound) {
            filteredData1.add(data);
          }
        }
      } else if (transactionTrendFilter.startsWith('+(') &&
          transactionTrendFilter.endsWith(')')) {
        var range = transactionTrendFilter.substring(
            2, transactionTrendFilter.length - 1);
        var rangeValues = range.split(' - ');
        var upperBound =
            int.tryParse(rangeValues[0].replaceAll('%', '').trim());
        var lowerBound =
            int.tryParse(rangeValues[1].replaceAll('%', '').trim());
        for (dynamic data in mainData['data']) {
          if (data['transactionTrend'] >= lowerBound &&
              data['transactionTrend'] <= upperBound) {
            filteredData1.add(data);
          }
        }
      } else if (transactionTrendFilter.startsWith('M')) {
        for (dynamic data in mainData['data']) {
          if (data['transactionTrend'] >= 100) {
            filteredData1.add(data);
          }
        }
      } else if (transactionTrendFilter.startsWith('L')) {
        for (dynamic data in mainData['data']) {
          if (data['transactionTrend'] <= -100) {
            filteredData1.add(data);
          }
        }
      }
      if (!isFilterMultipleEnabled) {
        if (sortByFilter != null && sortByFilter.isNotEmpty) {
          dynamic result = sortBy(filteredData1, sortByFilter);
          return {'userId': mainData['userId'], 'data': result};
        } else {
          return {'userId': mainData['userId'], 'data': filteredData1};
        }
      }
    }

    if (uptimeTrendFilter != null && uptimeTrendFilter.isNotEmpty) {
      if (uptimeTrendFilter.startsWith('-(') &&
          uptimeTrendFilter.endsWith(')')) {
        var range =
            uptimeTrendFilter.substring(2, uptimeTrendFilter.length - 1);
        var rangeValues = range.split(' - ');
        var upperBound =
            int.tryParse(rangeValues[0].replaceAll('%', '').trim());
        upperBound = -1 * upperBound!;
        var lowerBound =
            int.tryParse(rangeValues[1].replaceAll('%', '').trim());
        lowerBound = -1 * lowerBound!;
        for (dynamic data in mainData['data']) {
          if (data['uptimeTrend'] <= lowerBound &&
              data['uptimeTrend'] >= upperBound) {
            filteredData1.add(data);
          }
        }
      } else if (uptimeTrendFilter.startsWith('+(') &&
          uptimeTrendFilter.endsWith(')')) {
        var range =
            uptimeTrendFilter.substring(2, uptimeTrendFilter.length - 1);
        var rangeValues = range.split(' - ');
        var upperBound =
            int.tryParse(rangeValues[0].replaceAll('%', '').trim());
        var lowerBound =
            int.tryParse(rangeValues[1].replaceAll('%', '').trim());
        for (dynamic data in mainData['data']) {
          if (data['uptimeTrend'] >= lowerBound &&
              data['uptimeTrend'] <= upperBound) {
            filteredData1.add(data);
          }
        }
      } else if (uptimeTrendFilter.startsWith('M')) {
        for (dynamic data in mainData['data']) {
          if (data['uptimeTrend'] >= 100) {
            filteredData1.add(data);
          }
        }
      } else if (uptimeTrendFilter.startsWith('L')) {
        for (dynamic data in mainData['data']) {
          if (data['uptimeTrend'] <= -100) {
            filteredData1.add(data);
          }
        }
      }

      if (!isFilterMultipleEnabled) {
        if (sortByFilter != null && sortByFilter.isNotEmpty) {
          dynamic result = sortBy(filteredData1, sortByFilter);
          return {'userId': mainData['userId'], 'data': result};
        } else {
          return {'userId': mainData['userId'], 'data': filteredData1};
        }
      }
    }

    if (downTimeFilter != null && downTimeFilter.isNotEmpty) {
      if (downTimeFilter.startsWith('>')) {
        for (dynamic data in mainData['data']) {
          if (data['downTime'] >= 72) {
            filteredData1.add(data);
          }
        }
      } else {
        var range = downTimeFilter.substring(0, downTimeFilter.length - 3);
        var rangeValues = range.split(' - ');
        var lowerBound = int.tryParse(rangeValues[0]);
        var upperBound = int.tryParse(rangeValues[1]);
        for (dynamic data in mainData['data']) {
          if (data['downTime'] >= lowerBound &&
              data['downTime'] <= upperBound) {
            filteredData1.add(data);
          }
        }
      }

      if (!isFilterMultipleEnabled) {
        if (sortByFilter != null && sortByFilter.isNotEmpty) {
          dynamic result = sortBy(filteredData1, sortByFilter);
          return {'userId': mainData['userId'], 'data': result};
        } else {
          return {'userId': mainData['userId'], 'data': filteredData1};
        }
      }
    }

    if (gradeFilter != null && gradeFilter.isNotEmpty) {
      for (dynamic data in mainData['data']) {
        if (data['grade'].contains(gradeFilter)) {
          filteredData1.add(data);
        }
      }
      if (!isFilterMultipleEnabled) {
        if (sortByFilter != null && sortByFilter.isNotEmpty) {
          dynamic result = sortBy(filteredData1, sortByFilter);
          return {'userId': mainData['userId'], 'data': result};
        } else {
          return {'userId': mainData['userId'], 'data': filteredData1};
        }
      }
    }

    if (reasonByFilter != null && reasonByFilter.isNotEmpty) {
      for (dynamic data in mainData['data']) {
        if (data['reason'].contains(reasonByFilter)) {
          filteredData1.add(data);
        }
      }
      if (!isFilterMultipleEnabled) {
        if (sortByFilter != null && sortByFilter.isNotEmpty) {
          dynamic result = sortBy(filteredData1, sortByFilter);
          return {'userId': mainData['userId'], 'data': result};
        } else {
          return {'userId': mainData['userId'], 'data': filteredData1};
        }
      }
    }

    if (bankFilter != null && bankFilter.isNotEmpty) {
      for (dynamic data in mainData['data']) {
        if (data['bankName'].contains(bankFilter)) {
          filteredData1.add(data);
        }
      }
      if (!isFilterMultipleEnabled) {
        if (sortByFilter != null && sortByFilter.isNotEmpty) {
          dynamic result = sortBy(filteredData1, sortByFilter);
          return {'userId': mainData['userId'], 'data': result};
        } else {
          return {'userId': mainData['userId'], 'data': filteredData1};
        }
      }
    }

    if (locationFilter != null && locationFilter.isNotEmpty) {
      for (dynamic data in mainData['data']) {
        if (data['location'].contains(locationFilter)) {
          filteredData1.add(data);
        }
      }
      if (!isFilterMultipleEnabled) {
        if (sortByFilter != null && sortByFilter.isNotEmpty) {
          dynamic result = sortBy(filteredData1, sortByFilter);
          return {'userId': mainData['userId'], 'data': result};
        } else {
          return {'userId': mainData['userId'], 'data': filteredData1};
        }
      }
    }

    if (filteredData1.isEmpty) {
      if (sortByFilter != null && sortByFilter.isNotEmpty) {
        dynamic result = sortBy(mainData['data'], sortByFilter);
        return {'userId': mainData['userId'], 'data': result};
      } else {
        return mainData;
      }
    } else if (isFilterMultipleEnabled) {
      Map<String, int> atmIdCountMap = {}; // To count occurrences of atmId
      for (dynamic data in filteredData1) {
        String atmId = data['atmId'];
        atmIdCountMap[atmId] = (atmIdCountMap[atmId] ?? 0) + 1;
      }

      List<dynamic> commonAtmIdList = [];
      for (dynamic data in filteredData1) {
        String atmId = data['atmId'];
        if (atmIdCountMap[atmId]! == filterCount) {
          commonAtmIdList.add(data);
          atmIdCountMap[atmId] = 0; // To avoid duplicate entries
        }
      }
      if (sortByFilter != null && sortByFilter.isNotEmpty) {
        dynamic result = sortBy(commonAtmIdList, sortByFilter);
        return {'userId': mainData['userId'], 'data': result};
      } else {
        return {'userId': mainData['userId'], 'data': commonAtmIdList};
      }
    }
  }

  List<dynamic> filteredData = [];

  for (dynamic data in mainData['data']) {
    if (data['atmId'].contains(searchValue)) {
      filteredData.add(data);
    }
  }

  int itemCount = filteredData.length;

  return {
    'userId': mainData['userId'],
    'data': filteredData,
    'itemCount': itemCount,
    'filter': filterCount
  };
}

dynamic getCommon(
  dynamic mainData,
  String? category,
) {
  // Map<String, dynamic> jsonDataMap = json.decode(mainData);
  // List<dynamic> dataList = jsonDataMap['data'];

  List<dynamic> commonAtmIdList = [];
  List<dynamic> seenAtmIds = [];
  List<dynamic> finalData = [];

  for (dynamic data in mainData['data']) {
    if (seenAtmIds.contains(data[category])) {
      commonAtmIdList.add(data[category]);
    } else {
      seenAtmIds.add(data[category]);
      finalData.add(data);
    }
  }
  int itemCount = finalData.length;
  return {
    'userId': mainData['userId'],
    'data': finalData,
    'itemCount': itemCount
  };
}

bool? newCustomFunction(
  DateTime? currentDateTime,
  DateTime? tokenDateTime,
) {
  // if difference of current datetime and stored datetime is grater then 24hr return true
  if (currentDateTime == null || tokenDateTime == null) {
    return true;
  }

  final difference = currentDateTime.difference(tokenDateTime);
  final differenceInHours = difference.inHours;

  if (differenceInHours > 24) {
    return true;
  } else {
    return false;
  }
}

dynamic getCommonReason(
  dynamic mainData,
  String? category,
) {
  // Map<String, dynamic> jsonDataMap = json.decode(mainData);
  // List<dynamic> dataList = jsonDataMap['data'];

  List<dynamic> commonAtmIdList = [];
  List<dynamic> seenAtmIds = [];
  List<dynamic> finalData = [];
  List<dynamic> reasonList = [];
  dynamic getCommaSaparated(String reasons) {
    List<dynamic> list = reasons.split(',');
    for (dynamic data in list) {
      reasonList.add(data);
    }
  }

  ;
  for (dynamic data in mainData['data']) {
    getCommaSaparated(data[category]);
  }
  for (dynamic data in reasonList) {
    if (seenAtmIds.contains(data)) {
      commonAtmIdList.add(data);
    } else {
      seenAtmIds.add(data);
      finalData.add(data);
    }
  }
  int itemCount = finalData.length;
  return {
    'userId': mainData['userId'],
    'data': finalData,
    'itemCount': itemCount
  };
}

Color? colorChange2(int? mtdperformance) {
  if (mtdperformance != null && mtdperformance < 100) {
    return Color(0xFFB1000E);
  } else if (mtdperformance != null &&
      mtdperformance < 101 &&
      mtdperformance > 99) {
    return Color(0xFFFF9900);
  } else if (mtdperformance != null && mtdperformance > 100) {
    return Color(0xFF3AB100);
  }
}
