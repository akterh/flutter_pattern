import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridealike_demo/controllers/auth_controller/auth_user.dart';
import 'package:ridealike_demo/helpers/input_validator.dart';
import 'package:ridealike_demo/my_themes.dart';
import 'package:ridealike_demo/screens/profile_screen/profile_view.dart';
import 'package:ridealike_demo/screens/swap_screen/swap_view.dart';
import '../../custom_widgets_decor/custom_button.dart';
import '../../custom_widgets_decor/custom_textfield.dart';
import '../../custom_widgets_decor/custom_toast.dart';
import '../../helpers/mixpanel.dart';
import '../trips_screen/trips_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _email = "";
  String? _pass = "";
  AuthController? authController;

  void onPressedLoginBtn() async {
    if (_email == '') {
      ToastComponent.showToast(
        "Enter Email",
        context,
      );
    } else if (_pass == '') {
      ToastComponent.showToast(
        "Enter Password",
        context,
      );
    } else {
      await authController?.loginUser(email: _email!, password: _pass!);
      if (authController?.resMessage == "Login successfull!") {
        ToastComponent.showToast(
          "${authController?.resMessage}",
          context,
        );
        authController?.clear();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Trips()));
      } else {
        ToastComponent.showToast(
          "${authController?.resMessage}",
          context,
        );
      }
    }
    MixpanelEvent.logDetect("log in",properties:{"email":_email});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    authController = Provider.of<AuthController>(context, listen: true);
    print("print from build method");

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        elevation: 0.0,
        title: const Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'images/logo_login.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                "Go Farther",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                CustomTextField(
                  hintText: "Please Enter Email",
                  fillColor: AppColors.whiteColor,
                  inputType: TextInputType.emailAddress,
                  label: "Email",
                  onChanged: (val) {
                    Validator.emailChecker(val);
                    authController?.errorText();
                    if (kDebugMode) {
                      print("warning Text:${authController?.error}");
                    }
                    _email = val;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Please provide Password",
                  fillColor: AppColors.whiteColor,
                  inputType: TextInputType.visiblePassword,
                  // controller: _passwordController,
                  onChanged: (val) {
                    setState(() {
                      _pass = val;
                    });
                  },
                  isShowSuffixIcon: true,
                  isPassword: true,
                  label: "Password",
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: AppColors.mediumGrey),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                authController?.error == null
                    ? Container()
                    : Text(
                        "${authController?.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: CustomButton(
                      btnTxt: "Login",
                      backgroundColor: _email == "" || _pass == ""
                          ? Colors.grey
                          : AppColors.accentColor,
                      onLoading: authController?.isLoading,
                      onTap: _email == "" || _pass == ""
                          ? null
                          : onPressedLoginBtn,
                    )),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
