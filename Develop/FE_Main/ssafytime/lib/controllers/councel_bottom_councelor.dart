import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ssafytime/controllers/councel_bottom_date.dart';
import 'dart:convert';
import '../model/councel_bottom_councelor.dart';
import 'councel_bottom_time.dart';


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
    print('카카');
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
    print('후');
    return ;
  }

  void select(int idx) {
    // 관리자가 다시 선택되면 날짜 컨트롤러 값 초기화 시킴
    Get.find<CBDatePickController>().myPick.value = '';
    Get.find<CBDatePickController>().myDate.value = '';
    Get.find<CBTimeController>().myPick.value = ''; // 시간 선택 컨트롤러도 초기화
    if (myPick.value == idx) {
      myPick.value = 0;
    } else {
      myPick.value = idx;
    }
  }
}