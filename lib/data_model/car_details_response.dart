// To parse this JSON data, do
//
//     final carResponse = carResponseFromJson(jsonString);

import 'dart:convert';

CarResponse carResponseFromJson(String str) =>
    CarResponse.fromJson(json.decode(str));

String carResponseToJson(CarResponse data) => json.encode(data.toJson());

class CarResponse {
  CarResponse({
    this.cars,
    this.status,
  });

  List<Car>? cars;
  Status? status;

  factory CarResponse.fromJson(Map<String, dynamic> json) => CarResponse(
        cars: List<Car>.from(json["Cars"].map((x) => Car.fromJson(x))),
        status: Status.fromJson(json["Status"]),
      );

  Map<String, dynamic> toJson() => {
        "Cars": List<dynamic>.from(cars!.map((x) => x.toJson())),
        "Status": status?.toJson(),
      };
}

class Car {
  Car({
    this.id,
    this.name,
    this.about,
    this.imagesAndDocuments,
    this.features,
    this.preference,
    this.availability,
    this.pricing,
    this.calendarId,
    this.verification,
    this.userId,
    this.createdAt,
    this.submittedAt,
    this.updatedAt,
    // this.rating,
    this.numberOfTrips,
    this.totalRatingCount,
    this.numberOfCancelledTrips,
    this.swapStatus,
    this.saveAndExitInfo,
  });

  String? id;
  String? name;
  About? about;
  ImagesAndDocuments? imagesAndDocuments;
  Features? features;
  Preference? preference;
  Availability? availability;
  Pricing? pricing;
  String? calendarId;
  Verification? verification;
  String? userId;
  DateTime? createdAt;
  DateTime? submittedAt;
  DateTime? updatedAt;
  // int? rating;
  String? numberOfTrips;
  String? totalRatingCount;
  String? numberOfCancelledTrips;
  String? swapStatus;
  SaveAndExitInfo? saveAndExitInfo;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["ID"],
        name: json["Name"],
        about: About.fromJson(json["About"]),
        imagesAndDocuments:
            ImagesAndDocuments.fromJson(json["ImagesAndDocuments"]),
        features: Features.fromJson(json["Features"]),
        preference: Preference.fromJson(json["Preference"]),
        availability: Availability.fromJson(json["Availability"]),
        pricing: Pricing.fromJson(json["Pricing"]),
        calendarId: json["CalendarID"],
        verification: Verification.fromJson(json["Verification"]),
        userId: json["UserID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        submittedAt: DateTime.parse(json["SubmittedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        // rating: json["Rating"],
        numberOfTrips: json["NumberOfTrips"],
        totalRatingCount: json["TotalRatingCount"],
        numberOfCancelledTrips: json["NumberOfCancelledTrips"],
        swapStatus: json["SwapStatus"],
        saveAndExitInfo: SaveAndExitInfo.fromJson(json["SaveAndExitInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "About": about?.toJson(),
        "ImagesAndDocuments": imagesAndDocuments?.toJson(),
        "Features": features?.toJson(),
        "Preference": preference?.toJson(),
        "Availability": availability?.toJson(),
        "Pricing": pricing?.toJson(),
        "CalendarID": calendarId,
        "Verification": verification?.toJson(),
        "UserID": userId,
        "CreatedAt": createdAt?.toIso8601String(),
        "SubmittedAt": submittedAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        // "Rating": rating,
        "NumberOfTrips": numberOfTrips,
        "TotalRatingCount": totalRatingCount,
        "NumberOfCancelledTrips": numberOfCancelledTrips,
        "SwapStatus": swapStatus,
        "SaveAndExitInfo": saveAndExitInfo?.toJson(),
      };
}

class About {
  About({
    this.year,
    this.carType,
    this.make,
    this.model,
    this.carBodyTrim,
    this.style,
    this.vehicleDescription,
    this.location,
    this.carOwnedBy,
    this.neverBrandedOrSalvageTitle,
    this.completed,
  });

  String? year;
  String? carType;
  String? make;
  String? model;
  String? carBodyTrim;
  String? style;
  String? vehicleDescription;
  Location? location;
  String? carOwnedBy;
  bool? neverBrandedOrSalvageTitle;
  bool? completed;

  factory About.fromJson(Map<String, dynamic> json) => About(
        year: json["Year"],
        carType: json["CarType"],
        make: json["Make"],
        model: json["Model"],
        carBodyTrim: json["CarBodyTrim"],
        style: json["Style"],
        vehicleDescription: json["VehicleDescription"],
        location: Location.fromJson(json["Location"]),
        carOwnedBy: json["CarOwnedBy"],
        neverBrandedOrSalvageTitle: json["NeverBrandedOrSalvageTitle"],
        completed: json["Completed"],
      );

  Map<String, dynamic> toJson() => {
        "Year": year,
        "CarType": carType,
        "Make": make,
        "Model": model,
        "CarBodyTrim": carBodyTrim,
        "Style": style,
        "VehicleDescription": vehicleDescription,
        "Location": location?.toJson(),
        "CarOwnedBy": carOwnedBy,
        "NeverBrandedOrSalvageTitle": neverBrandedOrSalvageTitle,
        "Completed": completed,
      };
}

class Location {
  Location({
    this.address,
    this.formattedAddress,
    this.locality,
    this.region,
    this.postalCode,
    this.latLng,
    this.notes,
  });

  String? address;
  String? formattedAddress;
  String? locality;
  String? region;
  String? postalCode;
  LatLng? latLng;
  String? notes;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["Address"],
        formattedAddress: json["FormattedAddress"],
        locality: json["Locality"],
        region: json["Region"],
        postalCode: json["PostalCode"],
        latLng: LatLng.fromJson(json["LatLng"]),
        notes: json["Notes"],
      );

  Map<String, dynamic> toJson() => {
        "Address": address,
        "FormattedAddress": formattedAddress,
        "Locality": locality,
        "Region": region,
        "PostalCode": postalCode,
        "LatLng": latLng?.toJson(),
        "Notes": notes,
      };
}

class LatLng {
  LatLng({
    this.latitude,
    this.longitude,
    this.formattedAddress,
  });

  double? latitude;
  double? longitude;
  String? formattedAddress;

  factory LatLng.fromJson(Map<String, dynamic> json) => LatLng(
        latitude: json["Latitude"].toDouble(),
        longitude: json["Longitude"].toDouble(),
        formattedAddress: json["FormattedAddress"],
      );

  Map<String, dynamic> toJson() => {
        "Latitude": latitude,
        "Longitude": longitude,
        "FormattedAddress": formattedAddress,
      };
}

class Availability {
  Availability({
    this.rentalAvailability,
    this.swapAvailability,
    this.completed,
  });

  RentalAvailability? rentalAvailability;
  SwapAvailability? swapAvailability;
  bool? completed;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        rentalAvailability:
            RentalAvailability.fromJson(json["RentalAvailability"]),
        swapAvailability: json["SwapAvailability"] == null
            ? null
            : SwapAvailability.fromJson(json["SwapAvailability"]),
        completed: json["Completed"],
      );

  Map<String, dynamic> toJson() => {
        "RentalAvailability": rentalAvailability?.toJson(),
        "SwapAvailability":
            swapAvailability == null ? null : swapAvailability?.toJson(),
        "Completed": completed,
      };
}

class RentalAvailability {
  RentalAvailability({
    this.advanceNotice,
    this.sameDayCutOffTime,
    this.bookingWindow,
    this.shortestTrip,
    this.longestTrip,
  });

  String? advanceNotice;
  SameDayCutOffTime? sameDayCutOffTime;
  String? bookingWindow;
  int? shortestTrip;
  int? longestTrip;

  factory RentalAvailability.fromJson(Map<String, dynamic> json) =>
      RentalAvailability(
        advanceNotice: json["AdvanceNotice"],
        sameDayCutOffTime:
            SameDayCutOffTime.fromJson(json["SameDayCutOffTime"]),
        bookingWindow: json["BookingWindow"],
        shortestTrip: json["ShortestTrip"],
        longestTrip: json["LongestTrip"],
      );

  Map<String, dynamic> toJson() => {
        "AdvanceNotice": advanceNotice,
        "SameDayCutOffTime": sameDayCutOffTime?.toJson(),
        "BookingWindow": bookingWindow,
        "ShortestTrip": shortestTrip,
        "LongestTrip": longestTrip,
      };
}

class SameDayCutOffTime {
  SameDayCutOffTime({
    this.hours,
    this.minutes,
    this.seconds,
    this.nanos,
  });

  int? hours;
  int? minutes;
  int? seconds;
  int? nanos;

  factory SameDayCutOffTime.fromJson(Map<String, dynamic> json) =>
      SameDayCutOffTime(
        hours: json["hours"],
        minutes: json["minutes"],
        seconds: json["seconds"],
        nanos: json["nanos"],
      );

  Map<String, dynamic> toJson() => {
        "hours": hours,
        "minutes": minutes,
        "seconds": seconds,
        "nanos": nanos,
      };
}

class SwapAvailability {
  SwapAvailability({
    this.swapWithin,
    this.swapVehiclesType,
  });

  int? swapWithin;
  SwapVehiclesType? swapVehiclesType;

  factory SwapAvailability.fromJson(Map<String, dynamic> json) =>
      SwapAvailability(
        swapWithin: json["SwapWithin"],
        swapVehiclesType: SwapVehiclesType.fromJson(json["SwapVehiclesType"]),
      );

  Map<String, dynamic> toJson() => {
        "SwapWithin": swapWithin,
        "SwapVehiclesType": swapVehiclesType?.toJson(),
      };
}

class SwapVehiclesType {
  SwapVehiclesType({
    this.economy,
    this.midFullSize,
    this.sports,
    this.suv,
    this.pickupTruck,
    this.minivan,
    this.van,
  });

  bool? economy;
  bool? midFullSize;
  bool? sports;
  bool? suv;
  bool? pickupTruck;
  bool? minivan;
  bool? van;

  factory SwapVehiclesType.fromJson(Map<String, dynamic> json) =>
      SwapVehiclesType(
        economy: json["Economy"],
        midFullSize: json["MidFullSize"],
        sports: json["Sports"],
        suv: json["SUV"],
        pickupTruck: json["PickupTruck"],
        minivan: json["Minivan"],
        van: json["Van"],
      );

  Map<String, dynamic> toJson() => {
        "Economy": economy,
        "MidFullSize": midFullSize,
        "Sports": sports,
        "SUV": suv,
        "PickupTruck": pickupTruck,
        "Minivan": minivan,
        "Van": van,
      };
}

class Features {
  Features({
    this.fuelType,
    this.transmission,
    this.numberOfDoors,
    this.numberOfSeats,
    this.truckBoxSize,
    this.interior,
    this.exterior,
    this.comfort,
    this.safetyAndPrivacy,
    this.customFeatures,
    this.completed,
  });

  String? fuelType;
  String? transmission;
  int? numberOfDoors;
  int? numberOfSeats;
  String? truckBoxSize;
  Interior? interior;
  Exterior? exterior;
  Comfort? comfort;
  SafetyAndPrivacy? safetyAndPrivacy;
  List<dynamic>? customFeatures;
  bool? completed;

  factory Features.fromJson(Map<String, dynamic> json) => Features(
        fuelType: json["FuelType"],
        transmission: json["Transmission"],
        numberOfDoors: json["NumberOfDoors"],
        numberOfSeats: json["NumberOfSeats"],
        truckBoxSize: json["TruckBoxSize"],
        interior: Interior.fromJson(json["Interior"]),
        exterior: Exterior.fromJson(json["Exterior"]),
        comfort: Comfort.fromJson(json["Comfort"]),
        safetyAndPrivacy: SafetyAndPrivacy.fromJson(json["SafetyAndPrivacy"]),
        customFeatures:
            List<dynamic>.from(json["CustomFeatures"].map((x) => x)),
        completed: json["Completed"],
      );

  Map<String, dynamic> toJson() => {
        "FuelType": fuelType,
        "Transmission": transmission,
        "NumberOfDoors": numberOfDoors,
        "NumberOfSeats": numberOfSeats,
        "TruckBoxSize": truckBoxSize,
        "Interior": interior?.toJson(),
        "Exterior": exterior?.toJson(),
        "Comfort": comfort?.toJson(),
        "SafetyAndPrivacy": safetyAndPrivacy?.toJson(),
        "CustomFeatures": List<dynamic>.from(customFeatures!.map((x) => x)),
        "Completed": completed,
      };
}

class Comfort {
  Comfort({
    this.remoteStart,
    this.freeWifi,
  });

  bool? remoteStart;
  bool? freeWifi;

  factory Comfort.fromJson(Map<String, dynamic> json) => Comfort(
        remoteStart: json["RemoteStart"],
        freeWifi: json["FreeWifi"],
      );

  Map<String, dynamic> toJson() => {
        "RemoteStart": remoteStart,
        "FreeWifi": freeWifi,
      };
}

class Exterior {
  Exterior({
    this.hasAllWheelDrive,
    this.hasBikeRack,
    this.hasSkiRack,
    this.hasSnowTires,
  });

  bool? hasAllWheelDrive;
  bool? hasBikeRack;
  bool? hasSkiRack;
  bool? hasSnowTires;

  factory Exterior.fromJson(Map<String, dynamic> json) => Exterior(
        hasAllWheelDrive: json["HasAllWheelDrive"],
        hasBikeRack: json["HasBikeRack"],
        hasSkiRack: json["HasSkiRack"],
        hasSnowTires: json["HasSnowTires"],
      );

  Map<String, dynamic> toJson() => {
        "HasAllWheelDrive": hasAllWheelDrive,
        "HasBikeRack": hasBikeRack,
        "HasSkiRack": hasSkiRack,
        "HasSnowTires": hasSnowTires,
      };
}

class Interior {
  Interior({
    this.hasAirConditioning,
    this.hasHeatedSeats,
    this.hasVentilatedSeats,
    this.hasBluetoothAudio,
    this.hasAppleCarPlay,
    this.hasAndroidAuto,
    this.hasSunroof,
    this.hasUsbChargingPort,
  });

  bool? hasAirConditioning;
  bool? hasHeatedSeats;
  bool? hasVentilatedSeats;
  bool? hasBluetoothAudio;
  bool? hasAppleCarPlay;
  bool? hasAndroidAuto;
  bool? hasSunroof;
  bool? hasUsbChargingPort;

  factory Interior.fromJson(Map<String, dynamic> json) => Interior(
        hasAirConditioning: json["HasAirConditioning"],
        hasHeatedSeats: json["HasHeatedSeats"],
        hasVentilatedSeats: json["HasVentilatedSeats"],
        hasBluetoothAudio: json["HasBluetoothAudio"],
        hasAppleCarPlay: json["HasAppleCarPlay"],
        hasAndroidAuto: json["HasAndroidAuto"],
        hasSunroof: json["HasSunroof"],
        hasUsbChargingPort: json["HasUsbChargingPort"],
      );

  Map<String, dynamic> toJson() => {
        "HasAirConditioning": hasAirConditioning,
        "HasHeatedSeats": hasHeatedSeats,
        "HasVentilatedSeats": hasVentilatedSeats,
        "HasBluetoothAudio": hasBluetoothAudio,
        "HasAppleCarPlay": hasAppleCarPlay,
        "HasAndroidAuto": hasAndroidAuto,
        "HasSunroof": hasSunroof,
        "HasUsbChargingPort": hasUsbChargingPort,
      };
}

class SafetyAndPrivacy {
  SafetyAndPrivacy({
    this.hasChildSeat,
    this.hasSpareTire,
    this.hasGpsTrackingDevice,
    this.hasDashCamera,
  });

  bool? hasChildSeat;
  bool? hasSpareTire;
  bool? hasGpsTrackingDevice;
  bool? hasDashCamera;

  factory SafetyAndPrivacy.fromJson(Map<String, dynamic> json) =>
      SafetyAndPrivacy(
        hasChildSeat: json["HasChildSeat"],
        hasSpareTire: json["HasSpareTire"],
        hasGpsTrackingDevice: json["HasGPSTrackingDevice"],
        hasDashCamera: json["HasDashCamera"],
      );

  Map<String, dynamic> toJson() => {
        "HasChildSeat": hasChildSeat,
        "HasSpareTire": hasSpareTire,
        "HasGPSTrackingDevice": hasGpsTrackingDevice,
        "HasDashCamera": hasDashCamera,
      };
}

class ImagesAndDocuments {
  ImagesAndDocuments({
    this.license,
    this.currentKilometers,
    this.carOwnershipDocumentId,
    this.carOwnershipStatus,
    this.insuranceDocumentId,
    this.insuranceDocStatus,
    this.insuranceCertId,
    this.insuranceCertStatus,
    this.vin,
    this.images,
    this.completed,
  });

  License? license;
  String? currentKilometers;
  String? carOwnershipDocumentId;
  String? carOwnershipStatus;
  String? insuranceDocumentId;
  String? insuranceDocStatus;
  String? insuranceCertId;
  String? insuranceCertStatus;
  String? vin;
  Images? images;
  bool? completed;

  factory ImagesAndDocuments.fromJson(Map<String, dynamic> json) =>
      ImagesAndDocuments(
        license: License.fromJson(json["License"]),
        currentKilometers: json["CurrentKilometers"],
        carOwnershipDocumentId: json["CarOwnershipDocumentID"],
        carOwnershipStatus: json["CarOwnershipStatus"],
        insuranceDocumentId: json["InsuranceDocumentID"],
        insuranceDocStatus: json["InsuranceDocStatus"],
        insuranceCertId: json["InsuranceCertID"],
        insuranceCertStatus: json["InsuranceCertStatus"],
        vin: json["Vin"],
        images: Images.fromJson(json["Images"]),
        completed: json["Completed"],
      );

  Map<String, dynamic> toJson() => {
        "License": license?.toJson(),
        "CurrentKilometers": currentKilometers,
        "CarOwnershipDocumentID": carOwnershipDocumentId,
        "CarOwnershipStatus": carOwnershipStatus,
        "InsuranceDocumentID": insuranceDocumentId,
        "InsuranceDocStatus": insuranceDocStatus,
        "InsuranceCertID": insuranceCertId,
        "InsuranceCertStatus": insuranceCertStatus,
        "Vin": vin,
        "Images": images?.toJson(),
        "Completed": completed,
      };
}

class Images {
  Images({
    this.mainImageId,
    this.additionalImages,
  });

  String? mainImageId;
  AdditionalImages? additionalImages;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        mainImageId: json["MainImageID"],
        additionalImages: AdditionalImages.fromJson(json["AdditionalImages"]),
      );

  Map<String, dynamic> toJson() => {
        "MainImageID": mainImageId,
        "AdditionalImages": additionalImages?.toJson(),
      };
}

class AdditionalImages {
  AdditionalImages({
    this.imageId1,
    this.imageId2,
    this.imageId3,
    this.imageId4,
    this.imageId5,
    this.imageId6,
    this.imageId7,
    this.imageId8,
    this.imageId9,
  });

  String? imageId1;
  String? imageId2;
  String? imageId3;
  String? imageId4;
  String? imageId5;
  String? imageId6;
  String? imageId7;
  String? imageId8;
  String? imageId9;

  factory AdditionalImages.fromJson(Map<String, dynamic> json) =>
      AdditionalImages(
        imageId1: json["ImageID1"],
        imageId2: json["ImageID2"],
        imageId3: json["ImageID3"],
        imageId4: json["ImageID4"],
        imageId5: json["ImageID5"],
        imageId6: json["ImageID6"],
        imageId7: json["ImageID7"],
        imageId8: json["ImageID8"],
        imageId9: json["ImageID9"],
      );

  Map<String, dynamic> toJson() => {
        "ImageID1": imageId1,
        "ImageID2": imageId2,
        "ImageID3": imageId3,
        "ImageID4": imageId4,
        "ImageID5": imageId5,
        "ImageID6": imageId6,
        "ImageID7": imageId7,
        "ImageID8": imageId8,
        "ImageID9": imageId9,
      };
}

class License {
  License({
    this.province,
    this.plateNumber,
  });

  String? province;
  String? plateNumber;

  factory License.fromJson(Map<String, dynamic> json) => License(
        province: json["Province"],
        plateNumber: json["PlateNumber"],
      );

  Map<String, dynamic> toJson() => {
        "Province": province,
        "PlateNumber": plateNumber,
      };
}

class Preference {
  Preference({
    this.isSmokingAllowed,
    this.isSuitableForPets,
    this.dailyMileageAllowance,
    this.limit,
    this.listingType,
    this.completed,
  });

  bool? isSmokingAllowed;
  bool? isSuitableForPets;
  String? dailyMileageAllowance;
  int? limit;
  ListingType? listingType;
  bool? completed;

  factory Preference.fromJson(Map<String, dynamic> json) => Preference(
        isSmokingAllowed: json["IsSmokingAllowed"],
        isSuitableForPets: json["IsSuitableForPets"],
        dailyMileageAllowance: json["DailyMileageAllowance"],
        limit: json["Limit"],
        listingType: ListingType.fromJson(json["ListingType"]),
        completed: json["Completed"],
      );

  Map<String, dynamic> toJson() => {
        "IsSmokingAllowed": isSmokingAllowed,
        "IsSuitableForPets": isSuitableForPets,
        "DailyMileageAllowance": dailyMileageAllowance,
        "Limit": limit,
        "ListingType": listingType?.toJson(),
        "Completed": completed,
      };
}

class ListingType {
  ListingType({
    this.rentalEnabled,
    this.swapEnabled,
  });

  bool? rentalEnabled;
  bool? swapEnabled;

  factory ListingType.fromJson(Map<String, dynamic> json) => ListingType(
        rentalEnabled: json["RentalEnabled"],
        swapEnabled: json["SwapEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "RentalEnabled": rentalEnabled,
        "SwapEnabled": swapEnabled,
      };
}

class Pricing {
  Pricing({
    this.rentalPricing,
    this.swapPricing,
    this.msrp,
    this.completed,
  });

  RentalPricing? rentalPricing;
  SwapPricing? swapPricing;
  int? msrp;
  bool? completed;

  factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
        rentalPricing: RentalPricing.fromJson(json["RentalPricing"]),
        swapPricing: json["SwapPricing"] == null
            ? null
            : SwapPricing.fromJson(json["SwapPricing"]),
        msrp: json["MSRP"],
        completed: json["Completed"],
      );

  Map<String, dynamic> toJson() => {
        "RentalPricing": rentalPricing?.toJson(),
        "SwapPricing": swapPricing == null ? null : swapPricing?.toJson(),
        "MSRP": msrp,
        "Completed": completed,
      };
}

class RentalPricing {
  RentalPricing({
    this.perHour,
    this.perDay,
    this.perExtraKmOverLimit,
    this.enableCustomDelivery,
    this.perKmRentalDeliveryFee,
    this.bookForWeekDiscountPercentage,
    this.bookForMonthDiscountPercentage,
    this.oneTime20DiscountForFirst3Users,
  });

  int? perHour;
  int? perDay;
  double? perExtraKmOverLimit;
  bool? enableCustomDelivery;
  int? perKmRentalDeliveryFee;
  int? bookForWeekDiscountPercentage;
  int? bookForMonthDiscountPercentage;
  bool? oneTime20DiscountForFirst3Users;

  factory RentalPricing.fromJson(Map<String, dynamic> json) => RentalPricing(
        perHour: json["PerHour"],
        perDay: json["PerDay"],
        perExtraKmOverLimit: json["PerExtraKMOverLimit"].toDouble(),
        enableCustomDelivery: json["EnableCustomDelivery"],
        perKmRentalDeliveryFee: json["PerKMRentalDeliveryFee"],
        bookForWeekDiscountPercentage: json["BookForWeekDiscountPercentage"],
        bookForMonthDiscountPercentage: json["BookForMonthDiscountPercentage"],
        oneTime20DiscountForFirst3Users:
            json["OneTime20DiscountForFirst3Users"],
      );

  Map<String, dynamic> toJson() => {
        "PerHour": perHour,
        "PerDay": perDay,
        "PerExtraKMOverLimit": perExtraKmOverLimit,
        "EnableCustomDelivery": enableCustomDelivery,
        "PerKMRentalDeliveryFee": perKmRentalDeliveryFee,
        "BookForWeekDiscountPercentage": bookForWeekDiscountPercentage,
        "BookForMonthDiscountPercentage": bookForMonthDiscountPercentage,
        "OneTime20DiscountForFirst3Users": oneTime20DiscountForFirst3Users,
      };
}

class SwapPricing {
  SwapPricing();

  factory SwapPricing.fromJson(Map<String, dynamic> json) => SwapPricing();

  Map<String, dynamic> toJson() => {};
}

class SaveAndExitInfo {
  SaveAndExitInfo({
    this.saveAndExit,
    this.saveAndExitStatus,
  });

  bool? saveAndExit;
  String? saveAndExitStatus;

  factory SaveAndExitInfo.fromJson(Map<String, dynamic> json) =>
      SaveAndExitInfo(
        saveAndExit: json["SaveAndExit"],
        saveAndExitStatus: json["SaveAndExitStatus"],
      );

  Map<String, dynamic> toJson() => {
        "SaveAndExit": saveAndExit,
        "SaveAndExitStatus": saveAndExitStatus,
      };
}

class Verification {
  Verification({
    this.carId,
    this.carOwnershipDocumentId,
    this.verificationStatus,
    this.approvedAt,
    this.approvedBy,
  });

  String? carId;
  String? carOwnershipDocumentId;
  String? verificationStatus;
  String? approvedAt;
  String? approvedBy;

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        carId: json["CarID"],
        carOwnershipDocumentId: json["CarOwnershipDocumentID"],
        verificationStatus: json["VerificationStatus"],
        approvedAt: json["ApprovedAt"],
        approvedBy: json["ApprovedBy"],
      );

  Map<String, dynamic> toJson() => {
        "CarID": carId,
        "CarOwnershipDocumentID": carOwnershipDocumentId,
        "VerificationStatus": verificationStatus,
        "ApprovedAt": approvedAt,
        "ApprovedBy": approvedBy,
      };
}

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
