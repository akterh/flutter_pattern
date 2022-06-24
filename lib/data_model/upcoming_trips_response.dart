// To parse this JSON data, do
//
//     final upcomingTripsResponse = upcomingTripsResponseFromJson(jsonString);

import 'dart:convert';

// UpcomingTripsResponse upcomingTripsResponseFromJson(String str) => UpcomingTripsResponse.fromJson(json.decode(str));


class UpcomingTripsResponse {
  UpcomingTripsResponse({
    this.trips,
    this.totalCount,
    this.limit,
    this.skip,
    this.userId,
    this.carId,
    this.tripStatusGroup,
    this.status,
  });

  List<Trip>? trips;
  String? totalCount;
  String? limit;
  String? skip;
  String? userId;
  String? carId;
  String? tripStatusGroup;
  Status? status;

  factory UpcomingTripsResponse.fromJson(Map<String, dynamic> json) => UpcomingTripsResponse(
    trips: List<Trip>.from(json["Trips"].map((x) => Trip.fromJson(x))),
    totalCount: json["TotalCount"],
    limit: json["Limit"],
    skip: json["Skip"],
    userId: json["UserID"],
    carId: json["CarID"],
    tripStatusGroup: json["TripStatusGroup"],
    status: Status.fromJson(json["Status"]),
  );

  Map<String, dynamic> toJson() => {
    "Trips": List<dynamic>.from(trips!.map((x) => x.toJson())),
    "TotalCount": totalCount,
    "Limit": limit,
    "Skip": skip,
    "UserID": userId,
    "CarID": carId,
    "TripStatusGroup": tripStatusGroup,
    "Status": status?.toJson(),
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

class Trip {
  Trip({
    this.tripId,
    this.bookingId,
    this.location,
    this.tripStatus,
    this.carId,
    this.hostUserId,
    this.guestUserId,
    this.tripPayout,
    this.freeCancelBeforeDateTime,
    this.startDateTime,
    this.endDateTime,
    this.deliveryNeeded,
    this.hostRatingReviewAdded,
    this.guestRatingReviewAdded,
    this.carRatingReviewAdded,
    this.tripType,
    this.swapData,
    this.bookingEventId,
    this.rbn,
    this.guestTotal,
    this.hostTotal,
    this.rentAgreementId,
    this.swapAgreementId,
    this.cancellationFee,
    this.otherFees,
    this.startedAt,
    this.endedAt,
    this.reimbursementStatus,
  });

  String? tripId;
  String? bookingId;
  Location? location;
  TripStatus? tripStatus;
  String? carId;
  String? hostUserId;
  String? guestUserId;
  double? tripPayout;
  DateTime? freeCancelBeforeDateTime;
  DateTime? startDateTime;
  DateTime? endDateTime;
  bool? deliveryNeeded;
  bool? hostRatingReviewAdded;
  bool? guestRatingReviewAdded;
  bool? carRatingReviewAdded;
  TripType? tripType;
  SwapData? swapData;
  String? bookingEventId;
  String? rbn;
  double? guestTotal;
  double? hostTotal;
  String? rentAgreementId;
  String? swapAgreementId;
  dynamic cancellationFee;
  dynamic otherFees;
  dynamic startedAt;
  dynamic endedAt;
  ReimbursementStatus? reimbursementStatus;

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
    tripId: json["TripID"],
    bookingId: json["BookingID"],
    location: Location.fromJson(json["Location"]),
    tripStatus: tripStatusValues.map![json["TripStatus"]],
    carId: json["CarID"],
    hostUserId: json["HostUserID"],
    guestUserId: json["GuestUserID"],
    tripPayout: json["TripPayout"].toDouble(),
    freeCancelBeforeDateTime: DateTime.parse(json["FreeCancelBeforeDateTime"]),
    startDateTime: DateTime.parse(json["StartDateTime"]),
    endDateTime: DateTime.parse(json["EndDateTime"]),
    deliveryNeeded: json["DeliveryNeeded"],
    hostRatingReviewAdded: json["HostRatingReviewAdded"],
    guestRatingReviewAdded: json["GuestRatingReviewAdded"],
    carRatingReviewAdded: json["CarRatingReviewAdded"],
    tripType: tripTypeValues.map![json["TripType"]],
    swapData: json["SwapData"] == null ? null : SwapData.fromJson(json["SwapData"]),
    bookingEventId: json["BookingEventID"],
    rbn: json["RBN"],
    guestTotal: json["GuestTotal"].toDouble(),
    hostTotal: json["HostTotal"].toDouble(),
    rentAgreementId: json["RentAgreementID"],
    swapAgreementId: json["SwapAgreementID"],
    cancellationFee: json["CancellationFee"],
    otherFees: json["OtherFees"],
    startedAt: json["StartedAt"],
    endedAt: json["EndedAt"],
    reimbursementStatus: reimbursementStatusValues.map![json["ReimbursementStatus"]],
  );

  Map<String, dynamic> toJson() => {
    "TripID": tripId,
    "BookingID": bookingId,
    "Location": location?.toJson(),
    "TripStatus": tripStatusValues.reverse![tripStatus],
    "CarID": carId,
    "HostUserID": hostUserId,
    "GuestUserID": guestUserId,
    "TripPayout": tripPayout,
    "FreeCancelBeforeDateTime": freeCancelBeforeDateTime?.toIso8601String(),
    "StartDateTime": startDateTime?.toIso8601String(),
    "EndDateTime": endDateTime?.toIso8601String(),
    "DeliveryNeeded": deliveryNeeded,
    "HostRatingReviewAdded": hostRatingReviewAdded,
    "GuestRatingReviewAdded": guestRatingReviewAdded,
    "CarRatingReviewAdded": carRatingReviewAdded,
    "TripType": tripTypeValues.reverse![tripType],
    "SwapData": swapData == null ? null : swapData?.toJson(),
    "BookingEventID": bookingEventId,
    "RBN": rbn,
    "GuestTotal": guestTotal,
    "HostTotal": hostTotal,
    "RentAgreementID": rentAgreementId,
    "SwapAgreementID": swapAgreementId,
    "CancellationFee": cancellationFee,
    "OtherFees": otherFees,
    "StartedAt": startedAt,
    "EndedAt": endedAt,
    "ReimbursementStatus": reimbursementStatusValues.reverse![reimbursementStatus],
  };
}

class Location {
  Location({
    this.address,
    this.formattedAddress,
    this.latLng,
    this.customLoc,
  });

  String? address;
  String? formattedAddress;
  LatLng? latLng;
  bool? customLoc;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address: json["Address"],
    formattedAddress: json["FormattedAddress"],
    latLng: LatLng.fromJson(json["LatLng"]),
    customLoc: json["CustomLoc"],
  );

  Map<String, dynamic> toJson() => {
    "Address": address,
    "FormattedAddress": formattedAddress,
    "LatLng": latLng?.toJson(),
    "CustomLoc": customLoc,
  };
}

class LatLng {
  LatLng({
    this.latitude,
    this.longitude,
  });

  double? latitude;
  double? longitude;

  factory LatLng.fromJson(Map<String, dynamic> json) => LatLng(
    latitude: json["Latitude"].toDouble(),
    longitude: json["Longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "Latitude": latitude,
    "Longitude": longitude,
  };
}

enum ReimbursementStatus { UNAPPROVED }

final reimbursementStatusValues = EnumValues({
  "Unapproved": ReimbursementStatus.UNAPPROVED
});

class SwapData {
  SwapData({
    this.myCarId,
    this.otherTripId,
    this.otherBookingId,
    this.sbn,
  });

  String? myCarId;
  String? otherTripId;
  String? otherBookingId;
  String? sbn;

  factory SwapData.fromJson(Map<String, dynamic> json) => SwapData(
    myCarId: json["MyCarID"],
    otherTripId: json["OtherTripID"],
    otherBookingId: json["OtherBookingID"],
    sbn: json["SBN"],
  );

  Map<String, dynamic> toJson() => {
    "MyCarID": myCarId,
    "OtherTripID": otherTripId,
    "OtherBookingID": otherBookingId,
    "SBN": sbn,
  };
}

enum TripStatus { BOOKED }

final tripStatusValues = EnumValues({
  "Booked": TripStatus.BOOKED
});

enum TripType { RENT, SWAP }

final tripTypeValues = EnumValues({
  "Rent": TripType.RENT,
  "Swap": TripType.SWAP
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
