import 'package:flutter/material.dart';
import 'package:ridealike_demo/data_model/user_response.dart';
import 'package:ridealike_demo/helpers/local_data_store.dart';
import 'package:ridealike_demo/screens/profile_screen/profile_interface.dart';
import 'package:ridealike_demo/screens/profile_screen/profile_presenter.dart';
import 'package:ridealike_demo/screens/profile_screen/widgets/profile_btn.dart';

import '../../controllers/auth_controller/auth_user.dart';
import '../email_editing_screen/email_edit_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  // static String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    implements ProfileInterface {
  bool? isLoading;
  ProfilePresenter? _presenter;
  UserResponse? user;
  String? email;

   Future<String> getEmail()async{
   return email =await StoredData().readData("email");
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _presenter = ProfilePresenter(this);
    _presenter?.getProfileData(context);
    getEmail();

  }

  @override
  Widget build(BuildContext context) {
    print("print from profile view page${user?.profile?.email}");
    print(
        "print from profile view page for login controller$email");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : user != null
                ? Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      ProfileButton(
                        titleText: "First Name",
                        txtData: user?.profile?.firstName,
                        isClickable: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProfileButton(
                        titleText: "Last Name",
                        txtData: user?.profile?.lastName,
                        isClickable: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProfileButton(
                        titleText: "Email",
                        txtData: user?.profile?.email != ""
                            ? user?.profile?.email
                            : email.toString(),
                        isClickable: true,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmailEdit(
                                        email:
                                            user?.profile?.email!= ""? user?.profile?.email:
                                               email,
                                      )));
                        },
                      )
                    ],
                  )
                : const Center(
                    child: Text("Something Wrong"),
                  ),
      ),
    );
  }

  @override
  onError() {

  }

  @override
  onLoading(bool? loading) {

    setState(() {
      isLoading = loading;
    });
  }

  @override
  onLoadedProfileData(response) {

    setState(() {
      user = response;
    });

  }
}
