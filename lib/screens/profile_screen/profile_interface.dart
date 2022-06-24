import '../../data_model/user_response.dart';

class ProfileInterface {
  void onError() {}

  void onLoading(bool? loading) {}

  void onLoadedProfileData(UserResponse response) {}
}
