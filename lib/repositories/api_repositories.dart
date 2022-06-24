import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ridealike_demo/data_model/car_details_response.dart';
import 'package:ridealike_demo/data_model/swap_car_recommend_response.dart';
import 'package:ridealike_demo/helpers/local_data_store.dart';
import '../app_constants.dart';
import '../data_model/upcoming_trips_response.dart';
import '../data_model/update_email_response.dart';
import '../data_model/user_response.dart';
import '../helpers/api_client.dart';

class ApiRepository {
  Future<UserResponse> getUserData(BuildContext context, dynamic data) async {
    try {
      final response = await ApiClient.post(AppConstant.getProfileUrl, data);
      var responseData = UserResponse.fromJson(response);
      return responseData;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future getUpdateEmail(BuildContext context, dynamic data) async {
    String jwt = await StoredData().readData("jwt");
    try {
      final response = await ApiClient.post(
          AppConstant.updateEmailUrl, json.encode(data),
          token: jwt);
      return UpdateEmailResponse.fromJson(response);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future getTripsData(BuildContext context, dynamic data) async {
    String jwt = await StoredData().readData("jwt");
    try {
      final response = await ApiClient.post(
          AppConstant.tripsUrl, json.encode(data),
          token: jwt);

      return UpcomingTripsResponse.fromJson(response);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future getCarData(BuildContext context, dynamic data) async {
    String jwt = await StoredData().readData("jwt");
    try {
      final response = await ApiClient.post(
          AppConstant.carUrl, json.encode(data),
          token: jwt);

      CarResponse carResponse = CarResponse.fromJson(response);
      return carResponse;
    } catch (e) {
      if (kDebugMode) {
        print("exception from repository$e");
      }
      return Future.error(e);
    }
  }

  Future getSwapAvailableCarsByUserId(
      BuildContext context, dynamic data) async {
    String jwt = await StoredData().readData("jwt");
    try {
      final response = await ApiClient.post(
          AppConstant.swapCarUrl, json.encode(data),
          token: jwt);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("exception from repository$e");
      }
      return Future.error(e);
    }
  }

  Future getSwapRecommendationCars(BuildContext context, dynamic data) async {
    String jwt = await StoredData().readData("jwt");
    try {
      final response = await ApiClient.post(
          AppConstant.swapCarRecommendationUrl, json.encode(data),
          token: jwt);
      SwapCarRecommendResponse swapCarRecommendResponse =
          SwapCarRecommendResponse.fromJson(response);
      return swapCarRecommendResponse;
    } catch (e) {
      if (kDebugMode) {
        print("exception from repository$e");
      }
      return Future.error(e);
    }
  }
}
