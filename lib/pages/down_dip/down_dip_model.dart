import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/transaction_dip/transaction_dip_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'down_dip_widget.dart' show DownDipWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DownDipModel extends FlutterFlowModel<DownDipWidget> {
  ///  Local state fields for this page.

  bool autosearch = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (TransectionDip)] action in Down_Dip widget.
  ApiCallResponse? transactionDipResponse;
  // Stores action output result for [Backend Call - API (Machine Down UAT)] action in Down_Dip widget.
  ApiCallResponse? machineDownResponse;
  // State field(s) for searchfield widget.
  FocusNode? searchfieldFocusNode;
  TextEditingController? searchfieldController;
  String? Function(BuildContext, String?)? searchfieldControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    searchfieldFocusNode?.dispose();
    searchfieldController?.dispose();

    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
