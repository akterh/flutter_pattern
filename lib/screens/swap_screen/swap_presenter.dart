import 'package:flutter/cupertino.dart';
import 'package:ridealike_demo/screens/swap_screen/swap_interface.dart';

import '../../helpers/local_data_store.dart';
import '../../helpers/location_helper.dart';
import '../../repositories/api_repositories.dart';
import 'package:location/location.dart';

class SwapPresenter {
  ApiRepository? _apiRepository;
  SwapInterface? _interFace;

  SwapPresenter(SwapInterface interFace) {
    _apiRepository = ApiRepository();
    _interFace = interFace;
  }

  Future getSwapRecommendedCarsData(BuildContext context) async {
    LocationData _locationData = await getCurrentLocation();
    String carToSwapId;
    int skip = 0;
    List? swapRecommendCarList;

    String userId = await StoredData().readData("userId");
    try {
      var swapAvailableCarsResponse =
          await _apiRepository?.getSwapAvailableCarsByUserId(context, {
        "UserID": userId,
      });
      if (swapAvailableCarsResponse['CarToSwapID'] != '') {
        List availDataList = swapAvailableCarsResponse['SwapAvailabilitys'];
        carToSwapId = swapAvailableCarsResponse['CarToSwapID'];
        List carIds = [];
        for (var data in availDataList) {
          carIds.add(data['CarID']);
        }
        if (carIds.contains(carToSwapId)) {
          var swapRecommendCars =
              await _apiRepository?.getSwapRecommendationCars(context, {
            "UserID": userId,
            "LatLng": {
              "Latitude": _locationData.latitude,
              "Longitude": _locationData.longitude
            },
            "Skip": "$skip"
          });
          swapRecommendCarList = swapRecommendCars.cars;
          swapRecommendCarList = swapRecommendCarList
              ?.map((element) {
                if(element.hostUserId != userId){
                  return element;
                }
          }).toList();

        }
      }
      _interFace?.onLoadedSwapCars(swapRecommendCarList);

    } catch (e) {
      print("from swap presenter $e");
    }
  }
}
