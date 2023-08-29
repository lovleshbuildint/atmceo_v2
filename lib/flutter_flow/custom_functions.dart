import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

dynamic newCustomFunction(String? userDatastr) {
  if (userDatastr != null) {
    dynamic json = jsonDecode(userDatastr);
    return json;
  }
  return null;
}

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
) {
  bool isFilterMultipleEnabled = false;
  int filterCount =
      (transactionTrendFilter != null && transactionTrendFilter.isNotEmpty
              ? 1
              : 0) +
          (gradeFilter != null && gradeFilter.isNotEmpty ? 1 : 0) +
          (uptimeTrendFilter != null && uptimeTrendFilter.isNotEmpty ? 1 : 0) +
          (locationFilter != null && locationFilter.isNotEmpty ? 1 : 0) +
          (bankFilter != null && bankFilter.isNotEmpty ? 1 : 0);

  isFilterMultipleEnabled = filterCount > 1 ? true : false;

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
        return {'userId': mainData['userId'], 'data': filteredData1};
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
          if (data['transactionTrend'] >= 100) {
            filteredData1.add(data);
          }
        }
      } else if (uptimeTrendFilter.startsWith('L')) {
        for (dynamic data in mainData['data']) {
          if (data['transactionTrend'] <= -100) {
            filteredData1.add(data);
          }
        }
      }

      if (!isFilterMultipleEnabled) {
        return {'userId': mainData['userId'], 'data': filteredData1};
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
        return {'userId': mainData['userId'], 'data': filteredData1};
      }
    }

    if (gradeFilter != null && gradeFilter.isNotEmpty) {
      for (dynamic data in mainData['data']) {
        if (data['grade'].contains(gradeFilter)) {
          filteredData1.add(data);
        }
      }
      if (!isFilterMultipleEnabled) {
        return {'userId': mainData['userId'], 'data': filteredData1};
      }
    }

    if (bankFilter != null && bankFilter.isNotEmpty) {
      for (dynamic data in mainData['data']) {
        if (data['bankName'].contains(bankFilter)) {
          filteredData1.add(data);
        }
      }
      if (!isFilterMultipleEnabled) {
        return {'userId': mainData['userId'], 'data': filteredData1};
      }
    }

    if (locationFilter != null && locationFilter.isNotEmpty) {
      for (dynamic data in mainData['data']) {
        if (data['location'].contains(locationFilter)) {
          filteredData1.add(data);
        }
      }
      if (!isFilterMultipleEnabled) {
        return {'userId': mainData['userId'], 'data': filteredData1};
      }
    }

    if (filteredData1.isEmpty) {
      return mainData;
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
      return {'userId': mainData['userId'], 'data': commonAtmIdList};
    }
  }

  List<dynamic> filteredData = [];

  for (dynamic data in mainData['data']) {
    if (data['atmId'].contains(searchValue)) {
      filteredData.add(data);
    }
  }

  return {'userId': mainData['userId'], 'data': filteredData};
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

  return {'userId': mainData['userId'], 'data': finalData};
}
