import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ssafytime/widgets/custom_text.dart';
import 'package:ssafytime/widgets/menu_detail_percentbar.dart';
import 'dart:convert';

import '../model/menu_detail.dart';

void openMenuDetail(BuildContext context, int id) async {

  var res = await http.get(Uri.parse('http://i8a602.p.ssafy.io:9090/menu/detail?id=${id}'));
  var data = json.decode(res.body);

  if (res.statusCode != 200) {
    print('api 오류');
    return ;
  }


  MenuDetail myMenu = MenuDetail(
    region: data['data']["region"],
    course: data['data']["course"],
    mainMenu: data['data']["mainMenu"],
    sideMenu: List<String>.from(data['data']["sideMenu"].map((x) => x)),
    cho: data['data']["cho"],
    kcal: data['data']["kcal"],
    fat: data['data']["fat"],
    protein: data['data']["protein"],
    sodium: data['data']["sodium"],
    imageUrl: data['data']["imageUrl"],
  );


  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0)
          )
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: 365,
          height: 683,
          // height: MediaQuery.of(context).size.height * 1.0,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          padding: EdgeInsets.fromLTRB(12.5, 17, 12.5, 0),
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            children: [
              Container(width: 365, height: 288,
                decoration: BoxDecoration(
                  color: Color(0x08000000),
                  border: Border.all(width: 2, color: Color(0x05000000)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(myMenu.imageUrl, fit: BoxFit.contain
                ),
              ),

              Container(
                width: 365, height: 354,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                color: Colors.lightGreen,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(content: myMenu.mainMenu, fontSize: 16,), // 메인메뉴
                    SizedBox(height: 10,),

                    // 사이드 메뉴 목록
                    Container(
                      color: Colors.lightBlue,
                      height: 100,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 5,

                        children: [
                          for (int i=0; i < myMenu.sideMenu.length; i++) ... [
                            CustomText(content: myMenu.sideMenu[i],
                              fontSize: 12, color: 0x60000000,)
                          ],
                        ]
                      ),
                    ),

                    // 영양소 percent
                    Container(
                      width: 345,
                      height: 190,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MDetailPercentBar(
                            title: '탄수화물',
                            amount: 100,
                            total: 248,
                            unit: 'g',
                          ),
                          MDetailPercentBar(
                            title: '단백질',
                            amount: myMenu.protein,
                            total: 83,
                            unit: 'g',
                          ),
                          MDetailPercentBar(
                            title: '지방',
                            amount: myMenu.fat,
                            total: 220,
                            unit: 'g',
                          ),
                          MDetailPercentBar(
                            title: '나트륨',
                            amount: myMenu.sodium,
                            total: 3000,
                            unit: 'mg',
                          ),
                          MDetailPercentBar(
                            title: '총 Kcal',
                            amount: myMenu.kcal,
                            total: 2200,
                            unit: 'Kcal',
                          )
                        ],
                      )
                    )



                  ],
                ),
              ),
            ],
          ),
        );
      }
  );

  // Get.bottomSheet(
  //   // isScrollControlled: true,
  //   Container(
  //     width: 365, height: 700,
  //     margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
  //     padding: EdgeInsets.fromLTRB(12.5, 17, 12.5, 0),
  //     decoration: BoxDecoration(
  //       color: Colors.yellow,
  //       borderRadius: BorderRadius.circular(10.0)
  //     ),
  //     child: Column(
  //       children: [
  //         Container(width: 365, height: 288,
  //           decoration: BoxDecoration(
  //             color: Color(0x08000000),
  //             border: Border.all(width: 2, color: Color(0x05000000)),
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: Image.network(myMenu.imageUrl, fit: BoxFit.contain
  //           ),
  //         ),
  //
  //         Container(
  //           width: 365, height: 354,
  //           color: Colors.lightGreen,
  //           child: Column(
  //             children: [
  //
  //             ],
  //           ),
  //         ),
  //
  //
  //
  //         Text(myMenu.mainMenu),
  //         Text('탄수화물 : ${myMenu.cho}g'),
  //         Text('지방 : ${myMenu.fat}g'),
  //         Text('단백질 : ${myMenu.protein}g'),
  //         Text('나트륨 : ${myMenu.sodium}mg'),
  //         Text('등등..')
  //         // 디자인 협의 해야될듯
  //       ],
  //     ),
  //   ),
  // );
}