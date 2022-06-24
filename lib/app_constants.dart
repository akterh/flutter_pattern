class AppConstant {
  static const baseUrl = "https://api.user.stg.ridealike.com";
  static const loginUrl = baseUrl + "/v1/user.UserService/Login";
  static const updateEmailUrl = baseUrl + "/v1/user.UserService/UpdateEmail";

  //profile
  static const profileBaseUrl = "https://api.profile.stg.ridealike.com";
  static const getProfileUrl =
      profileBaseUrl + "/v1/profile.ProfileService/GetProfile";

//trips url
  static const tripsUrl =
      "https://api.trip.stg.ridealike.com/v1/trip.TripService/GetAllUserTripsByStatusGroup";

  //car url
  static const carServer = "https://api.car.stg.ridealike.com";
  static const carUrl = "$carServer/v1/car.CarService/GetCarsByCarIDs";
  static const swapCarUrl = "$carServer/v1/car.CarService/GetAllSwapAvailabilityByUserID";
  static const swapCarRecommendationUrl = "$carServer/v1/car.CarService/GetSwapRecommendation";
}
