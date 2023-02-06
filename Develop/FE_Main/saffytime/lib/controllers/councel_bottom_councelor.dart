import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saffytime/controllers/councel_bottom_date.dart';
import 'dart:convert';
import '../model/councel_bottom_councelor.dart';


// 상담자 선택 컨트롤러
class CBCouncelorController extends GetxController {
  // 선택한 관리자의 ID 를 myPick 에 저장함으로써 반응함
  RxInt myPick = 0.obs;
  // 내 관리자 리스트
  RxList councelorList = <MyCouncelor>[].obs;


  // 컨트롤러 생성시 내 담당 관리자들 목록 호출
  @override
  void onInit() {
    super.onInit();
    initialRun();
  }

  void initialRun() async {
    await requestCouncelor(1, 2);
  }

  // [반] 과 [지역코드] 로 그 반 관리자들 호출
  Future requestCouncelor(int classNum, int region) async {
    var res = await http.get(Uri.parse('http://i8a602.p.ssafy.io:9090/reserve/info?classNum=${classNum}&regionCode=${region}'));
    List data = json.decode(res.body);
    
    councelorList = <MyCouncelor>[].obs;
    data.forEach((ele) {
      councelorList.add(
          MyCouncelor(
            isAdmin: ele["is_admin"],
            userName: ele["user_name"],
            userIdx: ele["user_idx"],
            userImg: ele["user_img"],
          )
        );
      }
    );

    return ;
  }

  void select(int idx) {
    // 아하의 컨드롤러 다 죽일 수 있나? -> 있다!
    // 관리자가 다시 선택되면 날짜 컨트롤러 죽임
    Get.delete<CBDatePickController>();

    if (myPick.value == idx) {
      myPick.value = 0;
    } else {
      myPick.value = idx;
    }
  }
}