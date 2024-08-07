import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_client_widget.dart' show AddClientWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddClientModel extends FlutterFlowModel<AddClientWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for password widget.
  FocusNode? passwordFocusNode1;
  TextEditingController? passwordTextController1;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode2;
  TextEditingController? passwordTextController2;
  String? Function(BuildContext, String?)? passwordTextController2Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode3;
  TextEditingController? passwordTextController3;
  String? Function(BuildContext, String?)? passwordTextController3Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode4;
  TextEditingController? passwordTextController4;
  String? Function(BuildContext, String?)? passwordTextController4Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode5;
  TextEditingController? passwordTextController5;
  String? Function(BuildContext, String?)? passwordTextController5Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode6;
  TextEditingController? passwordTextController6;
  String? Function(BuildContext, String?)? passwordTextController6Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    passwordFocusNode1?.dispose();
    passwordTextController1?.dispose();

    passwordFocusNode2?.dispose();
    passwordTextController2?.dispose();

    passwordFocusNode3?.dispose();
    passwordTextController3?.dispose();

    passwordFocusNode4?.dispose();
    passwordTextController4?.dispose();

    passwordFocusNode5?.dispose();
    passwordTextController5?.dispose();

    passwordFocusNode6?.dispose();
    passwordTextController6?.dispose();
  }
}
