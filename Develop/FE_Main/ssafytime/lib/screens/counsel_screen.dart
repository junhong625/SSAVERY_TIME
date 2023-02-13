// check and regist counsel screen

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ssafytime/services/auth_service.dart';
import 'package:ssafytime/widgets/councel_admin_councel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ssafytime/controllers/loading_controller.dart';

import '../widgets/councel_my_councel.dart';
import '../widgets/councel_bottom_total.dart';

class CounselScreen extends StatefulWidget {
  const CounselScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CounselScreenStates();
}

class _CounselScreenStates extends State<CounselScreen> {
  int userCode = AuthService.to.user.value.isAdmin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("상담"),
        ),
        floatingActionButton: _getFAB(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        // body: Container(color: Colors.black12, child: CMyCouncel()));
        body: Stack(
          children: [
            Container(
                color: Colors.white,
                child: userCode == 1 ? CMyCouncel() : CAdminCouncel()),
            Obx(() =>
                Offstage(
                    offstage: !loadingController.to.isLoading,
                    child: Center(
                      child: Container(
                        color: Color(0x50000000),
                        width: double.infinity, height: double.infinity,
                        // width: 200, height: 200,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    )
                )
            )
          ],
        ));
  }

  // admin == 1 일때, 학생일때만 상담 신청 버튼이 있고 관리자는 없음
  Widget _getFAB() {
    if (AuthService.to.user.value.isAdmin == 0) {
      return SizedBox();
    } else {
      return FloatingActionButton(
        backgroundColor: Color(0xffD3E4FF),
        onPressed: () {
          openCouncelBottomSheet(context);
        },
        child: Icon(Icons.add, color: Color(0xff0079D1)),
      );
    }
  }
}
