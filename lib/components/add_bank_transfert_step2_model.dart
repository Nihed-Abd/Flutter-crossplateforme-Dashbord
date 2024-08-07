import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_bank_transfert_step2_widget.dart' show AddBankTransfertStep2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddBankTransfertStep2Model
    extends FlutterFlowModel<AddBankTransfertStep2Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for montant widget.
  FocusNode? montantFocusNode1;
  TextEditingController? montantTextController1;
  String? Function(BuildContext, String?)? montantTextController1Validator;
  // State field(s) for montant widget.
  FocusNode? montantFocusNode2;
  TextEditingController? montantTextController2;
  String? Function(BuildContext, String?)? montantTextController2Validator;
  // State field(s) for remarque widget.
  FocusNode? remarqueFocusNode;
  TextEditingController? remarqueTextController;
  String? Function(BuildContext, String?)? remarqueTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    montantFocusNode1?.dispose();
    montantTextController1?.dispose();

    montantFocusNode2?.dispose();
    montantTextController2?.dispose();

    remarqueFocusNode?.dispose();
    remarqueTextController?.dispose();
  }
}
