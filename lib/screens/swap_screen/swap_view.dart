import 'package:flutter/material.dart';
import 'package:ridealike_demo/screens/swap_screen/swap_interface.dart';
import 'package:ridealike_demo/screens/swap_screen/swap_presenter.dart';

class SwapCar extends StatefulWidget {
  const SwapCar({Key? key}) : super(key: key);

  @override
  State<SwapCar> createState() => _SwapCarState();
}

class _SwapCarState extends State<SwapCar> implements SwapInterface {
  SwapPresenter? _presenter;
  List? _carList;
  int _index= 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = SwapPresenter(this);
    _presenter?.getSwapRecommendedCarsData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _carList == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(

                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            child:
                            Image.network(

                              // "",
                              "https://api.storage.stg.ridealike.com/${_carList![_index].imageIDs[0]}",
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  height: 200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  ),
                                );
                              },

                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("${_carList![_index].title}"),
                          Text("${_carList![_index].fuelType}"),
                          Text("${_carList![_index].location}")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {

                              setState(() {
                              _index+=1;
                            });
                            },

                          child: const Text('Skip'),
                        ),
                        ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text('Like'),
                        ),
                      ],
                    ),
                  )
                ],
              ));
  }

  @override
  void onLoadedSwapCars(List? swapCarList) {
    setState(() {
      _carList = swapCarList;
    });
  }
}
