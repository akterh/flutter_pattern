import 'package:mixpanel_flutter/mixpanel_flutter.dart';
class MixpanelEvent{
  static Mixpanel? _mixpanel;

  static Future<void> initMixpanel() async {
    _mixpanel = await Mixpanel?.init("59a1477d93a6ab4845ad2ed1f2f6b5e2",
        optOutTrackingDefault: false);
  }

  static void logDetect(String event, {Map<String, dynamic>? properties}) {
    if (_mixpanel != null) {
      _mixpanel?.track(event, properties: properties);
    }
  }
}