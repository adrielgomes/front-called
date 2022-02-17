import 'package:get/get.dart';
import 'package:health/shared/rest_client.dart';

class HomeBindinds implements Bindings {
  @override
  void dependencies() {
    Get.put(RestClient());
  }
}
