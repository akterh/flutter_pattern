// To parse this JSON data, do
//
//     final swapCarRecommendResponse = swapCarRecommendResponseFromJson(jsonString);

import 'dart:convert';

SwapCarRecommendResponse swapCarRecommendResponseFromJson(String str) => SwapCarRecommendResponse.fromJson(json.decode(str));

String swapCarRecommendResponseToJson(SwapCarRecommendResponse data) => json.encode(data.toJson());

class SwapCarRecommendResponse {
  SwapCarRecommendResponse({
    this.status,
    this.skip,
    this.cars,
  });

  Status? status;
  String? skip;
  List<Car>? cars;

  factory SwapCarRecommendResponse.fromJson(Map<String, dynamic> json) => SwapCarRecommendResponse(
    status: Status.fromJson(json["Status"]),
    skip: json["Skip"],
    cars: List<Car>.from(json["Cars"].map((x) => Car.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Status": status?.toJson(),
    "Skip": skip,
    "Cars": List<dynamic>.from(cars!.map((x) => x.toJson())),
  };
}

class Car {
  Car({
    this.id,
    this.hostUserId,
    this.rating,
    this.numberOfTrips,
    this.title,
    this.year,
    this.location,
    this.currentKilometers,
    this.numberOfSeats,
    this.numberOfDoors,
    this.transmission,
    this.fuelType,
    this.pricePerDay,
    this.yourCarPricePerDay,
    this.imageIDs,
  });

  String? id;
  String? hostUserId;
  double? rating;
  String? numberOfTrips;
  String? title;
  String? year;
  Location? location;
  String? currentKilometers;
  int? numberOfSeats;
  int? numberOfDoors;
  Transmission? transmission;
  String? fuelType;
  int? pricePerDay;
  int? yourCarPricePerDay;
  List<String>? imageIDs;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    id: json["ID"],
    hostUserId: json["HostUserID"],
    rating: json["Rating"].toDouble(),
    numberOfTrips: json["NumberOfTrips"],
    title: json["Title"],
    year: json["Year"],
    location: locationValues.map[json["Location"]],
    currentKilometers: json["CurrentKilometers"],
    numberOfSeats: json["NumberOfSeats"],
    numberOfDoors: json["NumberOfDoors"],
    transmission: transmissionValues.map[json["Transmission"]],
    fuelType: json["FuelType"],
    pricePerDay: json["PricePerDay"],
    yourCarPricePerDay: json["YourCarPricePerDay"],
    imageIDs: List<String>.from(json["ImageIDs"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "HostUserID": hostUserId,
    "Rating": rating,
    "NumberOfTrips": numberOfTrips,
    "Title": title,
    "Year": year,
    "Location": locationValues.reverse![location],
    "CurrentKilometers": currentKilometers,
    "NumberOfSeats": numberOfSeats,
    "NumberOfDoors": numberOfDoors,
    "Transmission": transmissionValues.reverse![transmission],
    "FuelType": fuelType,
    "PricePerDay": pricePerDay,
    "YourCarPricePerDay": yourCarPricePerDay,
    "ImageIDs": List<dynamic>.from(imageIDs!.map((x) => x)),
  };
}

enum Location { DHAKA, DHAKA_BANGLADESH, CHITTAGONG_BANGLADESH }

final locationValues = EnumValues({
  "Chittagong, Bangladesh": Location.CHITTAGONG_BANGLADESH,
  "Dhaka": Location.DHAKA,
  "Dhaka, Bangladesh": Location.DHAKA_BANGLADESH
});

enum Transmission { AUTOMATIC, MANUAL }

final transmissionValues = EnumValues({
  "automatic": Transmission.AUTOMATIC,
  "manual": Transmission.MANUAL
});

class Status {
  Status({
    this.success,
    this.error,
  });

  bool? success;
  String? error;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    success: json["success"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error": error,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap;
    return reverseMap;
  }
}
