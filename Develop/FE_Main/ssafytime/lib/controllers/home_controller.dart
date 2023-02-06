import 'package:get/get.dart';
import 'package:ssafytime/models/home_jobs_model.dart';
import 'package:ssafytime/models/home_menu_model.dart';
import 'package:http/http.dart' as http;
import 'package:ssafytime/models/schedule_now_model.dart';

class HomeController extends GetxController {
  Rx<HomeMenu?> homeMenu = Rx<HomeMenu?>(null);
  Rx<ScheduleNow?> scheduleNow = Rx<ScheduleNow?>(null);
  Rx<JobInfo?> jobInfo = Rx<JobInfo?>(null);
  final int? userIdx;
  final int? region;
  final String? token;
  final int? trackCode;
  var headers = null;

  HomeController(this.userIdx, this.region, this.token, this.trackCode) {
    headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token}"
    };
  }

  @override
  void onInit() async {
    await fetchHomeMenu();
    await fetchScheduleNow();
    super.onInit();
  }

  Future<void> fetchHomeMenu() async {
    var response = await http.get(
        Uri.parse("http://i8a602.p.ssafy.io:9090/menu/today"),
        headers: headers);

    if (response.statusCode == 200) {
      homeMenu.value = HomeMenu.fromRawJson(response.body);
    }
  }

  Future<void> fetchScheduleNow() async {
    var response = await http.get(
        Uri.parse("http://i8a602.p.ssafy.io:9090/schedule/now"),
        headers: headers);

    if (response.statusCode == 200) {
      scheduleNow.value = ScheduleNow.fromRawJson(response.body);
    }
  }
}
