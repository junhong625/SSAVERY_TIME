import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ssafytime/services/auth_service.dart';
import 'dart:convert';
import '../model/menu_week_v2.dart';

// 주간 식단표 컨트롤러 =============================================
class MenuPickDayController extends GetxController {
  RxInt myPick = 0.obs; // 월 ~ 금
  List dayofweek = [0, 0, 0, 0, 0];
  DateTime today = DateTime.now();
  var menusofweek = <List>[].obs;
  var menuofday = [].obs;

  @override
  void onInit() {
    initialRun();
    super.onInit();
  }

  void initialRun() async {
    print('생성!!!!!!!!!!!!!');
    // 이번주 식단 가져오기 =======================
    // 지역 번호 넣어서
    await requstMenuWeek(AuthService.to.user.value.regionCode ?? 0);

    // 오늘 날짜 확인하기 ========================
    for (int i = 0; i < 5; i++) {
      DateTime tmp = today.subtract(Duration(days: today.weekday - (i + 1)));
      dayofweek[i] == tmp.day;
    }
    selectDay(0); // 주말의 경우 월요일꺼 보여주기
    for (int i = 0; i < 5; i++) {
      if (today.day == dayofweek[i]) {
        myPick.value == i;
        selectDay(i);
      }
    }
  }

  Future requstMenuWeek(int region) async {
    menusofweek = <List>[].obs;
    var res = await http.get(
        Uri.parse("http://i8a602.p.ssafy.io:9090/menu/week/?region=${region}"));
    var data = json.decode(res.body);

    final dataList = data['data'].values.map((x) => x).toList();

    for (int i = 0; i < dataList.length; i++) {
      var menus = <MenuWeekV2>[].obs;
      for (int j = 0; j < dataList[i].length; j++) {
        menus.add(MenuWeekV2(
          id: dataList[i][j]["id"],
          mainMenu: dataList[i][j]["mainMenu"],
          sideMenu: List<String>.from(dataList[i][j]["sideMenu"].map((x) => x)),
          kcal: dataList[i][j]["kcal"],
          imageUrl: dataList[i][j]["imageUrl"],
        ));
      }
      menusofweek.add(menus);
    }
    ;
    return;
  }

  void selectDay(int idx) {
    myPick.value = idx;
    // requstMenuWeek(0);
    menuofday = menusofweek[idx].obs;
    print('menuofday 길이 : ${menuofday.length}');
  }
}
