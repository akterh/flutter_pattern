import 'package:flutter/material.dart';
import 'package:ridealike_demo/data_model/car_details_response.dart';
import 'package:ridealike_demo/data_model/upcoming_trips_response.dart';
import 'package:ridealike_demo/screens/swap_screen/swap_view.dart';
import 'package:ridealike_demo/screens/trips_screen/trips_interface.dart';
import 'package:ridealike_demo/screens/trips_screen/trips_presenter.dart';


class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> implements TripsInterFace {
  List? _carList;
  TripsPresenter? _presenter;

  @override
  void initState() {
    //return futureBuilder connectionState.none value if i use schedulerBindings
    super.initState();
    _presenter = TripsPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: FutureBuilder<UpcomingTripsResponse?>(
          future: _presenter?.getTripData(context),
          builder: (context, tripSnapshot) {
            if (tripSnapshot.hasError) {
              return const Text("Something Error");
            } else if (tripSnapshot.hasData) {
              var tripData = tripSnapshot.data?.trips as List;
              return buildUpcomingCarListView(tripData);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const SwapCar())); },
      child: const Text("Swap Cars"),),
    );
  }

  ListView buildUpcomingCarListView(List<dynamic> tripData) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        //have to declare count
        itemCount: tripData.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.network(
                        // "",
                        "https://api.storage.stg.ridealike.com/${_carList![getCar(tripData[index].carId)].imagesAndDocuments.images.mainImageId}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "${_carList![getCar(tripData[index].carId)].about.make}"),
                    Text("${tripData[index].startDateTime}"),
                    Text("${tripData[index].endDateTime}")
                  ],
                ),
              ),
            ));
  }

  @override
  void onLoadedCarData(List<Car>? carList) {
    // TODO: implement onLoadedCarData

    _carList = carList as List;

  }

  int getCar(carId) {
    int carIndex = _carList!.indexWhere((element) => element.id == carId);
    return carIndex;
  }
}
