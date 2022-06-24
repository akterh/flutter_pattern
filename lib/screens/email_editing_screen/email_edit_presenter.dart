import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ridealike_demo/repositories/api_repositories.dart';
import 'package:ridealike_demo/screens/email_editing_screen/email_edit_interface.dart';

import '../../helpers/local_data_store.dart';

class EmailEditPresenter {
  EmailEditInterface? _interface;
  ApiRepository? _apiRepository;
  String? message;

  EmailEditPresenter(EmailEditInterface interface) {
    _interface = interface;
    _apiRepository = ApiRepository();
  }

   updateEmail(BuildContext context, String newEmail) async {
    String userId = await StoredData().readData("userId");
    String email = await StoredData().readData("email");
    try {
      print("service call started");
      var response = await _apiRepository?.getUpdateEmail(context,
          {"Email": email, "NewEmail": newEmail, "UserID": userId});
      print("respnse from presenter${response.status.success}");
      _interface?.onSuccess(response.status.success);
    } catch (e) {
      _interface?.onError("$e");
      print(e);
    }
  }
}
