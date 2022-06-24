import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart' as permission_handler;

Future getCurrentLocation() async {
  // permission
  permission_handler.PermissionStatus permissionStatus = await checkPermission();
  if(permissionStatus != permission_handler.PermissionStatus.granted){
    requestPermission();
  }
  Location location = Location();
  LocationData _locationData;
  _locationData = await location.getLocation();
  return _locationData;
}

Future<permission_handler.PermissionStatus>  checkPermission() async {
  permission_handler.PermissionStatus permissionStatus = await permission_handler.Permission.locationWhenInUse.status;

  return permissionStatus;
}
Future<permission_handler.PermissionStatus> requestPermission() async {

  permission_handler.PermissionStatus permission =
  await checkPermission();
  if (permission != permission_handler.PermissionStatus.granted) {
    permission = await permission_handler.Permission.locationWhenInUse.request();
    if (kDebugMode) {
      print(permission);
    }

  }
  return permission;
}
