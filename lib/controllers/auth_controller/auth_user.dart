import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:ridealike_demo/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:ridealike_demo/data_model/login_response.dart';
import 'package:ridealike_demo/helpers/local_data_store.dart';
import 'dart:convert';

import '../../helpers/input_validator.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  String resMessage = '';
  String? error;
  String? email;

  void errorText() {
    var _error = Validator.isMatch;
    if (_error) {
      error = "";
    } else {
      error = "Invalid email format";
    }
    print('print from errortext method');

    notifyListeners();
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    print("1:$isLoading");
    notifyListeners();

    String url = AppConstant.loginUrl;

    final body = {"Email": email, "Password": password};
    print(body);

    try {
      http.Response req =
          await http.post(Uri.parse(url), body: json.encode(body));

      if (req.statusCode == 200 || req.statusCode == 201) {
        print(req.body);
        final res = json.decode(req.body);

        print("print from auth controller $email");
        LoginResponse.fromJson(res);

        isLoading = false;
        print("2:$isLoading");
        resMessage = "Login successfull!";
        print(resMessage);
        notifyListeners();

        final userId = res['User']['UserID'];
        final profileId = res['User']['ProfileID'];
        final token = res['JWT'];
        email = res['User']['Email'];

        StoredData().writeData("email", email);
        StoredData().writeData("profileId", profileId);
        StoredData().writeData("jwt", token);
        StoredData().writeData("userId",userId );
      } else {
        final res = json.decode(req.body);

        resMessage = res['message'];

        print(res);

        isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      isLoading = false;
      resMessage = "Internet connection is not available`";
      // notifyListeners();
    } catch (e) {
      isLoading = false;
      resMessage = "Please try again`";
      notifyListeners();

      print("$e");
    }

  }

  void clear() {
    resMessage = "";
    // notifyListeners();
  }
}
