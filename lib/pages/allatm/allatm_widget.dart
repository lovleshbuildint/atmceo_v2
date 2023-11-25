import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/all_a_t_m_filter/all_a_t_m_filter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'allatm_model.dart';
export 'allatm_model.dart';

class AllatmWidget extends StatefulWidget {
  const AllatmWidget({
    Key? key,
    required this.tabBar,
  }) : super(key: key);

  final int? tabBar;

  @override
  _AllatmWidgetState createState() => _AllatmWidgetState();
}

class _AllatmWidgetState extends State<AllatmWidget>
    with TickerProviderStateMixin {
  late AllatmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllatmModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().deleteSortByFilter();
        FFAppState().sortByFilter = '';

        FFAppState().deleteGradeFilter();
        FFAppState().gradeFilter = '';

        FFAppState().deleteReasonFilter();
        FFAppState().reasonFilter = '';

        FFAppState().deleteTransactionTrendFilter();
        FFAppState().transactionTrendFilter = '';

        FFAppState().deleteUptimeTrendFilter();
        FFAppState().uptimeTrendFilter = '';

        FFAppState().deleteDownTimeFilter();
        FFAppState().downTimeFilter = '';

        FFAppState().deleteBankFilter();
        FFAppState().bankFilter = '';

        FFAppState().deleteLocationFilter();
        FFAppState().locationFilter = '';

        FFAppState().sortByFilterTab = true;
        FFAppState().reasonFilterTab = false;
        FFAppState().gradeFilterTab = false;
        FFAppState().uptimeTrendFilterTab = false;
        FFAppState().transactionTrendFilterTab = false;
        FFAppState().downTimeFilterTab = false;
        FFAppState().bankFilterTab = false;
        FFAppState().locationFilterTab = false;
      });
      _model.allBankDataResponse = await AllAtmCall.call(
        userId: FFAppState().userId,
        token: FFAppState().token,
      );
      if ((_model.allBankDataResponse?.succeeded ?? true)) {
        if ((String responseDescription) {
          return responseDescription == "Invalid Token !" ? true : false;
        }(getJsonField(
          (_model.allBankDataResponse?.jsonBody ?? ''),
          r'''$.responseDescription''',
        ).toString().toString())) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                title: Text('Alert'),
                content: Text('Session Expired - Please Log in again.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ));
            },
          );

          context.goNamed('login_page');

          setState(() {
            FFAppState().deleteToken();
            FFAppState().token = '';
          });
          return;
        } else {
          setState(() {
            FFAppState().allMachineDetails =
                (_model.allBankDataResponse?.jsonBody ?? '');
          });
          return;
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              title: Text('Alert'),
              content: Text('Session Expired - Please Log in again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ));
          },
        );

        context.goNamed('login_page');

        setState(() {
          FFAppState().deleteToken();
          FFAppState().token = '';
        });
        return;
      }
    });

    _model.searchFieldController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: min(
          valueOrDefault<int>(
            widget.tabBar,
            0,
          ),
          2),
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF2D2D2D),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: Color(0xFF2D2D2D),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset(
                    'assets/images/bg.png',
                  ).image,
                ),
              ),
              alignment: AlignmentDirectional(0.00, -1.00),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 55.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.goNamed(
                                    'MainScreen',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );

                                  setState(() {
                                    FFAppState().atmInfoState = false;
                                  });
                                },
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Color(0xFFFF0026),
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 4.0, 0.0, 0.0),
                              child: AutoSizeText(
                                'Assigned ATM’s',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Helvetica',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  'Last trx updated: ${getJsonField(
                                    FFAppState().LastUpdatedBankDataJson,
                                    r'''$.data[0].date''',
                                  ).toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Helvetica',
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.search,
                              color: Color(0xFF757575),
                              size: 20.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.searchFieldController,
                                focusNode: _model.searchFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.searchFieldController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    if (_model.tabBarCurrentIndex == 0) {
                                      setState(() {
                                        FFAppState().searchValue1 =
                                            _model.searchFieldController.text;
                                        FFAppState().deleteSearchValue2();
                                        FFAppState().searchValue2 = '';

                                        FFAppState().deleteSearchValue3();
                                        FFAppState().searchValue3 = '';

                                        FFAppState().countFilter = getJsonField(
                                          functions.filter(
                                              FFAppState().allMachineDetails,
                                              FFAppState().searchValue1,
                                              FFAppState()
                                                  .transactionTrendFilter,
                                              FFAppState().gradeFilter,
                                              FFAppState().uptimeTrendFilter,
                                              FFAppState().bankFilter,
                                              FFAppState().locationFilter,
                                              FFAppState().downTimeFilter,
                                              FFAppState().sortByFilter,
                                              FFAppState().reasonFilter),
                                          r'''$.itemCount''',
                                        );
                                      });
                                      setState(() {
                                        _model.autosearch = true;
                                      });
                                    } else {
                                      if (_model.tabBarCurrentIndex == 1) {
                                        setState(() {
                                          FFAppState().deleteSearchValue1();
                                          FFAppState().searchValue1 = '';

                                          FFAppState().searchValue2 =
                                              _model.searchFieldController.text;
                                          FFAppState().deleteSearchValue3();
                                          FFAppState().searchValue3 = '';

                                          FFAppState().countFilter =
                                              getJsonField(
                                            functions.filter(
                                                FFAppState().allMachineDetails,
                                                () {
                                              if (_model.tabBarCurrentIndex ==
                                                  0) {
                                                return FFAppState()
                                                    .searchValue1;
                                              } else if (_model
                                                      .tabBarCurrentIndex ==
                                                  1) {
                                                return FFAppState()
                                                    .searchValue2;
                                              } else if (_model
                                                      .tabBarCurrentIndex ==
                                                  2) {
                                                return FFAppState()
                                                    .searchValue3;
                                              } else {
                                                return null;
                                              }
                                            }(),
                                                FFAppState()
                                                    .transactionTrendFilter,
                                                FFAppState().gradeFilter,
                                                FFAppState().uptimeTrendFilter,
                                                FFAppState().bankFilter,
                                                FFAppState().locationFilter,
                                                FFAppState().downTimeFilter,
                                                FFAppState().sortByFilter,
                                                FFAppState().reasonFilter),
                                            r'''$.itemCount''',
                                          );
                                        });
                                        setState(() {
                                          _model.autosearch = true;
                                        });
                                      } else {
                                        setState(() {
                                          FFAppState().deleteSearchValue1();
                                          FFAppState().searchValue1 = '';

                                          FFAppState().deleteSearchValue2();
                                          FFAppState().searchValue2 = '';

                                          FFAppState().searchValue3 =
                                              _model.searchFieldController.text;
                                          FFAppState().countFilter =
                                              getJsonField(
                                            functions.filter(
                                                FFAppState().allMachineDetails,
                                                () {
                                              if (_model.tabBarCurrentIndex ==
                                                  0) {
                                                return FFAppState()
                                                    .searchValue1;
                                              } else if (_model
                                                      .tabBarCurrentIndex ==
                                                  1) {
                                                return FFAppState()
                                                    .searchValue2;
                                              } else if (_model
                                                      .tabBarCurrentIndex ==
                                                  2) {
                                                return FFAppState()
                                                    .searchValue3;
                                              } else {
                                                return null;
                                              }
                                            }(),
                                                FFAppState()
                                                    .transactionTrendFilter,
                                                FFAppState().gradeFilter,
                                                FFAppState().uptimeTrendFilter,
                                                FFAppState().bankFilter,
                                                FFAppState().locationFilter,
                                                FFAppState().downTimeFilter,
                                                FFAppState().sortByFilter,
                                                FFAppState().reasonFilter),
                                            r'''$.itemCount''',
                                          );
                                        });
                                        setState(() {
                                          _model.autosearch = true;
                                        });
                                      }
                                    }
                                  },
                                ),
                                textCapitalization:
                                    TextCapitalization.characters,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintText: 'Search by ATM ID',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Helvetica',
                                        color: Color(0xFF757575),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.searchFieldControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 13.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.searchFieldController?.clear();
                                });
                                setState(() {
                                  _model.autosearch = false;
                                });
                                setState(() {
                                  FFAppState().deleteSearchValue1();
                                  FFAppState().searchValue1 = '';

                                  FFAppState().deleteSearchValue2();
                                  FFAppState().searchValue2 = '';

                                  FFAppState().deleteSearchValue3();
                                  FFAppState().searchValue3 = '';
                                });
                              },
                              child: Icon(
                                Icons.clear,
                                color: Color(0xFFFF0026),
                                size: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                              unselectedLabelStyle: TextStyle(),
                              indicatorColor: Color(0xFFFF0026),
                              indicatorWeight: 4.0,
                              tabs: [
                                Tab(
                                  text: 'All',
                                ),
                                Tab(
                                  text: 'Transaction',
                                ),
                                Tab(
                                  text: 'Uptime',
                                ),
                              ],
                              controller: _model.tabBarController,
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 19.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    '${FFAppState().totalMachinesManaged} Assigned ATM',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFF2D2D2D),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: AlignedTooltip(
                                                    content: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Text(
                                                          'The listed ATMs are currently underperforming. Analyze the performance issue and implement necessary actions to ensure seamless transactions.',
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Helvetica',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                        )),
                                                    offset: 4.0,
                                                    preferredDirection:
                                                        AxisDirection.down,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    backgroundColor:
                                                        Color(0xFF4D4D4D),
                                                    elevation: 4.0,
                                                    tailBaseWidth: 20.0,
                                                    tailLength: 18.0,
                                                    waitDuration: Duration(
                                                        milliseconds: 100),
                                                    showDuration: Duration(
                                                        milliseconds: 1500),
                                                    triggerMode:
                                                        TooltipTriggerMode.tap,
                                                    child: Icon(
                                                      Icons.info_outline,
                                                      color: Color(0xFF737373),
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.white,
                                                      enableDrag: false,
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                AllATMFilterWidget(
                                                              tabBar: 0,
                                                              filterCount:
                                                                  getJsonField(
                                                                (_model.allBankDataResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.filterCount''',
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    width: 87.0,
                                                    height: 38.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFF2F2F2),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Filter',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            FFIcons.ksliders,
                                                            color: Color(
                                                                0xFF959595),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (FFAppState().allMachineDetails !=
                                          null)
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: (FFAppState()
                                                                          .atmInfoState
                                                                      ? 450
                                                                      : 190)
                                                                  .toDouble(),
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFF3B3B3C),
                                                                    Colors.black
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          6.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'ATM Information',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                  if (!FFAppState()
                                                                      .atmInfoState)
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().atmInfoState =
                                                                              true;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_right,
                                                                        color: Color(
                                                                            0xFFFF0026),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                      .atmInfoState)
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().atmInfoState =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_left,
                                                                        color: Color(
                                                                            0xFFFF0026),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.5,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 283.0,
                                                                height: 46.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF3B3B3C),
                                                                      Colors
                                                                          .black
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            6.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Text(
                                                                  'ATM Performance',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 130.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'ATM ID',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 60.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Text(
                                                                'Grade',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                            if (FFAppState()
                                                                .atmInfoState)
                                                              Container(
                                                                width: 120.0,
                                                                height: 46.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Bank',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (FFAppState()
                                                                .atmInfoState)
                                                              Container(
                                                                width: 140.0,
                                                                height: 46.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Location',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Container(
                                                              width: 100.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'MTD Trx Performance',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 102.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Transaction Trend',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 82.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Uptime Trend',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final data =
                                                                      getJsonField(
                                                                    functions.filter(
                                                                        FFAppState()
                                                                            .allMachineDetails,
                                                                        FFAppState()
                                                                            .searchValue1,
                                                                        FFAppState()
                                                                            .transactionTrendFilter,
                                                                        FFAppState()
                                                                            .gradeFilter,
                                                                        FFAppState()
                                                                            .uptimeTrendFilter,
                                                                        FFAppState()
                                                                            .bankFilter,
                                                                        FFAppState()
                                                                            .locationFilter,
                                                                        FFAppState()
                                                                            .downTimeFilter,
                                                                        FFAppState()
                                                                            .sortByFilter,
                                                                        FFAppState()
                                                                            .reasonFilter),
                                                                    r'''$.data''',
                                                                  ).toList();
                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          data.length,
                                                                          (dataIndex) {
                                                                        final dataItem =
                                                                            data[dataIndex];
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: Color(0xFFF2F2F2),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 130.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.pushNamed(
                                                                                              'ATMdetails',
                                                                                              queryParameters: {
                                                                                                'atmId': serializeParam(
                                                                                                  getJsonField(
                                                                                                    dataItem,
                                                                                                    r'''$..atmId''',
                                                                                                  ).toString(),
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              dataItem,
                                                                                              r'''$..atmId''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Helvetica2',
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 60.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if ((String grade) {
                                                                                            return grade == "Silver" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Silver.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Presidential" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Presidential.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Gold" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Gold.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Platinum" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Platinum.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Bronze" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Bronze.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "New" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/New.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    if (FFAppState().atmInfoState)
                                                                                      Container(
                                                                                        width: 120.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              dataItem,
                                                                                              r'''$..bankName''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if (FFAppState().atmInfoState)
                                                                                      Container(
                                                                                        width: 140.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              dataItem,
                                                                                              r'''$..location''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(1.00, 0.00),
                                                                                              child: Text(
                                                                                                '${getJsonField(
                                                                                                  dataItem,
                                                                                                  r'''$..mtdperformance''',
                                                                                                ).toString()}%',
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: functions.colorChange2(getJsonField(
                                                                                                        dataItem,
                                                                                                        r'''$..mtdperformance''',
                                                                                                      )),
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          if ((int transactionTrend) {
                                                                                            return transactionTrend < 100 ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..mtdperformance''',
                                                                                          )))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                    child: Image.asset(
                                                                                                      'assets/images/MTD_Down.png',
                                                                                                      width: 24.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if ((int transactionTrend) {
                                                                                            return transactionTrend > 100 ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..mtdperformance''',
                                                                                          )))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                    child: Image.asset(
                                                                                                      'assets/images/MTD_Up.png',
                                                                                                      width: 24.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if ((int transactionTrend) {
                                                                                            return (transactionTrend == 100) ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..mtdperformance''',
                                                                                          )))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                    child: Image.asset(
                                                                                                      'assets/images/MTD_Achive.png',
                                                                                                      width: 24.0,
                                                                                                      fit: BoxFit.scaleDown,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Text(
                                                                                        '${getJsonField(
                                                                                          dataItem,
                                                                                          r'''$..transactionTrend''',
                                                                                        ).toString()}%',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: functions.colorChange(getJsonField(
                                                                                                dataItem,
                                                                                                r'''$..transactionTrend''',
                                                                                              )),
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 82.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Text(
                                                                                        '${getJsonField(
                                                                                          dataItem,
                                                                                          r'''$..uptimeTrend''',
                                                                                        ).toString()}%',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: functions.colorChange(getJsonField(
                                                                                                dataItem,
                                                                                                r'''$..uptimeTrend''',
                                                                                              )),
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      }),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().allMachineDetails ==
                                          null)
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Lottie.asset(
                                              'assets/lottie_animations/preLoader.json',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.15,
                                              fit: BoxFit.fitHeight,
                                              animate: true,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 19.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    '${FFAppState().totalMachinesManaged} Assigned ATM',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFF2D2D2D),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: AlignedTooltip(
                                                    content: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Text(
                                                          'The listed ATMs are currently underperforming. Analyze the performance issue and implement necessary actions to ensure seamless transactions.',
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Helvetica',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                        )),
                                                    offset: 4.0,
                                                    preferredDirection:
                                                        AxisDirection.down,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    backgroundColor:
                                                        Color(0xFF4D4D4D),
                                                    elevation: 4.0,
                                                    tailBaseWidth: 20.0,
                                                    tailLength: 18.0,
                                                    waitDuration: Duration(
                                                        milliseconds: 100),
                                                    showDuration: Duration(
                                                        milliseconds: 1500),
                                                    triggerMode:
                                                        TooltipTriggerMode.tap,
                                                    child: Icon(
                                                      Icons.info_outline,
                                                      color: Color(0xFF737373),
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.white,
                                                      enableDrag: false,
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                AllATMFilterWidget(
                                                              tabBar: 0,
                                                              filterCount:
                                                                  getJsonField(
                                                                (_model.allBankDataResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.filterCount''',
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    width: 87.0,
                                                    height: 38.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFF2F2F2),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Filter',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            FFIcons.ksliders,
                                                            color: Color(
                                                                0xFF959595),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (FFAppState().allMachineDetails !=
                                          null)
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: (FFAppState()
                                                                          .atmInfoState
                                                                      ? 450
                                                                      : 310)
                                                                  .toDouble(),
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFF3B3B3C),
                                                                    Colors.black
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          6.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'ATM Information',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                  if (!FFAppState()
                                                                      .atmInfoState)
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().atmInfoState =
                                                                              true;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_right,
                                                                        color: Color(
                                                                            0xFFFF0026),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                      .atmInfoState)
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().atmInfoState =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_left,
                                                                        color: Color(
                                                                            0xFFFF0026),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.5,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 46.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF3B3B3C),
                                                                      Colors
                                                                          .black
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Text(
                                                                  'MTD Performance',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.5,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 102.0,
                                                                height: 46.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF3B3B3C),
                                                                      Colors
                                                                          .black
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            6.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Text(
                                                                  'Transaction Trend',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 130.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'ATM ID',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 60.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Text(
                                                                'Grade',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 120.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Bank',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (FFAppState()
                                                                .atmInfoState)
                                                              Container(
                                                                width: 140.0,
                                                                height: 46.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Location',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Container(
                                                              width: 100.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                            ),
                                                            Container(
                                                              width: 103.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final data =
                                                                      getJsonField(
                                                                    functions.filter(
                                                                        FFAppState()
                                                                            .allMachineDetails,
                                                                        FFAppState()
                                                                            .searchValue2,
                                                                        FFAppState()
                                                                            .transactionTrendFilter,
                                                                        FFAppState()
                                                                            .gradeFilter,
                                                                        FFAppState()
                                                                            .uptimeTrendFilter,
                                                                        FFAppState()
                                                                            .bankFilter,
                                                                        FFAppState()
                                                                            .locationFilter,
                                                                        FFAppState()
                                                                            .downTimeFilter,
                                                                        FFAppState()
                                                                            .sortByFilter,
                                                                        FFAppState()
                                                                            .reasonFilter),
                                                                    r'''$.data''',
                                                                  ).toList();
                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          data.length,
                                                                          (dataIndex) {
                                                                        final dataItem =
                                                                            data[dataIndex];
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: Color(0xFFF2F2F2),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 130.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.pushNamed(
                                                                                              'ATMdetails',
                                                                                              queryParameters: {
                                                                                                'atmId': serializeParam(
                                                                                                  getJsonField(
                                                                                                    dataItem,
                                                                                                    r'''$..atmId''',
                                                                                                  ).toString(),
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              dataItem,
                                                                                              r'''$..atmId''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 60.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if ((String grade) {
                                                                                            return grade == "Silver" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Silver.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Presidential" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Presidential.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Gold" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Gold.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Platinum" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Platinum.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Bronze" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Bronze.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "New" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/New.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 120.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..bankName''',
                                                                                          ).toString(),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    if (FFAppState().atmInfoState)
                                                                                      Container(
                                                                                        width: 140.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              dataItem,
                                                                                              r'''$..location''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(1.00, 0.00),
                                                                                              child: Text(
                                                                                                '${getJsonField(
                                                                                                  dataItem,
                                                                                                  r'''$..mtdperformance''',
                                                                                                ).toString()}%',
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: functions.colorChange2(getJsonField(
                                                                                                        dataItem,
                                                                                                        r'''$..mtdperformance''',
                                                                                                      )),
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          if ((int transactionTrend) {
                                                                                            return transactionTrend < 100 ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..mtdperformance''',
                                                                                          )))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                    child: Image.asset(
                                                                                                      'assets/images/MTD_Down.png',
                                                                                                      width: 24.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if ((int transactionTrend) {
                                                                                            return transactionTrend > 100 ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..mtdperformance''',
                                                                                          )))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                    child: Image.asset(
                                                                                                      'assets/images/MTD_Up.png',
                                                                                                      width: 24.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if ((int transactionTrend) {
                                                                                            return transactionTrend == 100 ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..mtdperformance''',
                                                                                          )))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                    child: Image.asset(
                                                                                                      'assets/images/MTD_Achive.png',
                                                                                                      width: 24.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Text(
                                                                                        '${getJsonField(
                                                                                          dataItem,
                                                                                          r'''$..transactionTrend''',
                                                                                        ).toString()}%',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: functions.colorChange(getJsonField(
                                                                                                dataItem,
                                                                                                r'''$..transactionTrend''',
                                                                                              )),
                                                                                              fontSize: 14.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      }),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().allMachineDetails ==
                                          null)
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Lottie.asset(
                                              'assets/lottie_animations/preLoader.json',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.15,
                                              fit: BoxFit.fitHeight,
                                              animate: true,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 19.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    '${FFAppState().totalMachinesManaged} Assigned ATM',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFF2D2D2D),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: AlignedTooltip(
                                                    content: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Text(
                                                          'The listed ATMs are currently underperforming. Analyze the performance issue and implement necessary actions to ensure seamless transactions.',
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Helvetica',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                        )),
                                                    offset: 4.0,
                                                    preferredDirection:
                                                        AxisDirection.down,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    backgroundColor:
                                                        Color(0xFF4D4D4D),
                                                    elevation: 4.0,
                                                    tailBaseWidth: 20.0,
                                                    tailLength: 18.0,
                                                    waitDuration: Duration(
                                                        milliseconds: 100),
                                                    showDuration: Duration(
                                                        milliseconds: 1500),
                                                    triggerMode:
                                                        TooltipTriggerMode.tap,
                                                    child: Icon(
                                                      Icons.info_outline,
                                                      color: Color(0xFF737373),
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.white,
                                                      enableDrag: false,
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                AllATMFilterWidget(
                                                              tabBar: 0,
                                                              filterCount:
                                                                  getJsonField(
                                                                (_model.allBankDataResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.filterCount''',
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    width: 87.0,
                                                    height: 38.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFF2F2F2),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Filter',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            FFIcons.ksliders,
                                                            color: Color(
                                                                0xFF959595),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (FFAppState().allMachineDetails !=
                                          null)
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: (FFAppState()
                                                                          .atmInfoState
                                                                      ? 450
                                                                      : 310)
                                                                  .toDouble(),
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFF3B3B3C),
                                                                    Colors.black
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          6.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'ATM Information',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                  if (!FFAppState()
                                                                      .atmInfoState)
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().atmInfoState =
                                                                              true;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_right,
                                                                        color: Color(
                                                                            0xFFFF0026),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                      .atmInfoState)
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().atmInfoState =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_left,
                                                                        color: Color(
                                                                            0xFFFF0026),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.5,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 102.0,
                                                                height: 46.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF3B3B3C),
                                                                      Colors
                                                                          .black
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            6.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Text(
                                                                  'Uptime Trend',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 130.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'ATM ID',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 60.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Text(
                                                                'Grade',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 120.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Bank',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (FFAppState()
                                                                .atmInfoState)
                                                              Container(
                                                                width: 140.0,
                                                                height: 46.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Location',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Container(
                                                              width: 102.0,
                                                              height: 46.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final data =
                                                                      getJsonField(
                                                                    functions.filter(
                                                                        FFAppState()
                                                                            .allMachineDetails,
                                                                        FFAppState()
                                                                            .searchValue2,
                                                                        FFAppState()
                                                                            .transactionTrendFilter,
                                                                        FFAppState()
                                                                            .gradeFilter,
                                                                        FFAppState()
                                                                            .uptimeTrendFilter,
                                                                        FFAppState()
                                                                            .bankFilter,
                                                                        FFAppState()
                                                                            .locationFilter,
                                                                        FFAppState()
                                                                            .downTimeFilter,
                                                                        FFAppState()
                                                                            .sortByFilter,
                                                                        FFAppState()
                                                                            .reasonFilter),
                                                                    r'''$.data''',
                                                                  ).toList();
                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          data.length,
                                                                          (dataIndex) {
                                                                        final dataItem =
                                                                            data[dataIndex];
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: Color(0xFFF2F2F2),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 130.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.pushNamed(
                                                                                              'ATMdetails',
                                                                                              queryParameters: {
                                                                                                'atmId': serializeParam(
                                                                                                  getJsonField(
                                                                                                    dataItem,
                                                                                                    r'''$..atmId''',
                                                                                                  ).toString(),
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              dataItem,
                                                                                              r'''$..atmId''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 60.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if ((String grade) {
                                                                                            return grade == "Silver" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Silver.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Presidential" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Presidential.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Gold" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Gold.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Platinum" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Platinum.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "Bronze" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Bronze.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          if ((String grade) {
                                                                                            return grade == "New" ? true : false;
                                                                                          }(getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..grade''',
                                                                                          ).toString()))
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/New.png',
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 120.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            dataItem,
                                                                                            r'''$..bankName''',
                                                                                          ).toString(),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    if (FFAppState().atmInfoState)
                                                                                      Container(
                                                                                        width: 140.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              dataItem,
                                                                                              r'''$..location''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Text(
                                                                                        '${getJsonField(
                                                                                          dataItem,
                                                                                          r'''$..uptimeTrend''',
                                                                                        ).toString()}%',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: functions.colorChange(getJsonField(
                                                                                                dataItem,
                                                                                                r'''$..uptimeTrend''',
                                                                                              )),
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      }),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().allMachineDetails ==
                                          null)
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Lottie.asset(
                                              'assets/lottie_animations/preLoader.json',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.15,
                                              fit: BoxFit.fitHeight,
                                              animate: true,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (FFAppState().visibilityState == true)
              Align(
                alignment: AlignmentDirectional(0.71, -0.76),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(70.0, 0.0, 15.0, 0.0),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    decoration: BoxDecoration(
                      color: Color(0xFF4D4D4D),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 15.0, 20.0, 10.0),
                      child: Builder(
                        builder: (context) {
                          final latestBankData = getJsonField(
                            FFAppState().LastUpdatedBankDataJson,
                            r'''$.data''',
                          ).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: latestBankData.length,
                            itemBuilder: (context, latestBankDataIndex) {
                              final latestBankDataItem =
                                  latestBankData[latestBankDataIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          '${getJsonField(
                                            latestBankDataItem,
                                            r'''$..bankName''',
                                          ).toString()} -',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Colors.white,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '${getJsonField(
                                              latestBankDataItem,
                                              r'''$..date''',
                                            ).toString()},${getJsonField(
                                              latestBankDataItem,
                                              r'''$..time''',
                                            ).toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: Color(0xFFB3B3B3),
                                                  fontSize: 12.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 0.1,
                                    color: Color(0x83FFFFFF),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            if ((_model.searchFieldController.text != null &&
                    _model.searchFieldController.text != '') &&
                _model.autosearch)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 160.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${FFAppState().countFilter.toString()} found',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                final data2 = getJsonField(
                                  functions.filter(
                                      FFAppState().allMachineDetails, () {
                                    if (_model.tabBarCurrentIndex == 0) {
                                      return FFAppState().searchValue1;
                                    } else if (_model.tabBarCurrentIndex == 1) {
                                      return FFAppState().searchValue2;
                                    } else if (_model.tabBarCurrentIndex == 2) {
                                      return FFAppState().searchValue3;
                                    } else {
                                      return null;
                                    }
                                  }(),
                                      FFAppState().transactionTrendFilter,
                                      FFAppState().gradeFilter,
                                      FFAppState().uptimeTrendFilter,
                                      FFAppState().bankFilter,
                                      FFAppState().locationFilter,
                                      FFAppState().downTimeFilter,
                                      FFAppState().sortByFilter,
                                      FFAppState().reasonFilter),
                                  r'''$.data''',
                                ).toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: data2.length,
                                  itemBuilder: (context, data2Index) {
                                    final data2Item = data2[data2Index];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.searchFieldController
                                                      ?.text = getJsonField(
                                                    data2Item,
                                                    r'''$..atmId''',
                                                  ).toString();
                                                });
                                                setState(() {
                                                  _model.autosearch = false;
                                                });
                                                if (_model.tabBarCurrentIndex ==
                                                    0) {
                                                  setState(() {
                                                    FFAppState().searchValue1 =
                                                        _model
                                                            .searchFieldController
                                                            .text;
                                                    FFAppState()
                                                        .deleteSearchValue2();
                                                    FFAppState().searchValue2 =
                                                        '';

                                                    FFAppState()
                                                        .deleteSearchValue3();
                                                    FFAppState().searchValue3 =
                                                        '';
                                                  });
                                                } else {
                                                  if (_model
                                                          .tabBarCurrentIndex ==
                                                      1) {
                                                    setState(() {
                                                      FFAppState()
                                                          .deleteSearchValue1();
                                                      FFAppState()
                                                          .searchValue1 = '';

                                                      FFAppState()
                                                              .searchValue2 =
                                                          _model
                                                              .searchFieldController
                                                              .text;
                                                      FFAppState()
                                                          .deleteSearchValue3();
                                                      FFAppState()
                                                          .searchValue3 = '';
                                                    });
                                                  } else {
                                                    setState(() {
                                                      FFAppState()
                                                          .deleteSearchValue1();
                                                      FFAppState()
                                                          .searchValue1 = '';

                                                      FFAppState()
                                                          .deleteSearchValue2();
                                                      FFAppState()
                                                          .searchValue2 = '';

                                                      FFAppState()
                                                              .searchValue3 =
                                                          _model
                                                              .searchFieldController
                                                              .text;
                                                    });
                                                  }
                                                }
                                              },
                                              child: Text(
                                                getJsonField(
                                                  data2Item,
                                                  r'''$..atmId''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFF2D2D2D),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  1.00, 0.00),
                                              child: Text(
                                                getJsonField(
                                                  data2Item,
                                                  r'''$..location''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFF737373),
                                                          fontSize: 12.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
