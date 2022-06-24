
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ridealike_demo/data_model/upcoming_trips_response.dart';
import 'package:ridealike_demo/repositories/api_repositories.dart';
import 'package:ridealike_demo/screens/trips_screen/trips_interface.dart';

import '../../data_model/car_details_response.dart';
import '../../helpers/local_data_store.dart';
import '../../helpers/mixpanel.dart';

class TripsPresenter {
  ApiRepository? _apiRepository;
  TripsInterFace? _interFace;

  TripsPresenter(TripsInterFace interFace) {
    _apiRepository = ApiRepository();
    _interFace = interFace;
  }

  Future<UpcomingTripsResponse?> getTripData(BuildContext context) async {
    String userId = await StoredData().readData("userId");
    List<String?> carIds = [];
    try {
      UpcomingTripsResponse upcomingTripsResponse = await _apiRepository
          ?.getTripsData(context, {
        "Limit": "200",
        "Skip": "0",
        "UserID": userId,
        "TripStatusGroup": "Upcoming"
      });

      for (var i in upcomingTripsResponse.trips!) {
        carIds.add(i.carId);
      }

      CarResponse carResponse =
          await _apiRepository?.getCarData(context, {"carIDs": carIds});

      _interFace?.onLoadedCarData(carResponse.cars);
      MixpanelEvent.logDetect("trips",properties:{"cars":carResponse.cars?.length});
      return upcomingTripsResponse;
    } catch (e) {
      if (kDebugMode) {
        print("error from presenter$e");
      }
      return Future.error(e);
    }
  }

}
