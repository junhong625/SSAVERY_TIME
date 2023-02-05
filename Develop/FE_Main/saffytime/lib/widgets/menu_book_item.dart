import 'package:flutter/material.dart';

// 메뉴북 스크린 단일 위젯
class MIW extends StatefulWidget {

  final String imgUrl;
  final String mainMenu;
  final List subMenuList; // 서브 메뉴이름(String)을 원소로하는 리스트
  final int foodKcal;

  const MIW({Key? key,
    required this.imgUrl,
    required this.foodKcal,
    required this.mainMenu,
    required this.subMenuList}) : super(key: key);

  @override
  State<MIW> createState() => _MIWState();
}

class _MIWState extends State<MIW> {
  @override
  Widget build(BuildContext context) {

    String imgUrl = widget.imgUrl;
    String mainMenu = widget.mainMenu;
    List subMenuList = widget.subMenuList;
    int foodKcal = widget.foodKcal;

    return Container(
      margin: EdgeInsets.all(5),
      width: 358,
      height: 180,
      decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Container(width: 179, height: 163,
            padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                // option1 imgUrl
                child: Image.network(imgUrl, fit: BoxFit.fill
                )
            ),
          ),
          Container(
            width: 162, height: 155,
            padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // option2 mainMenu
                Text(mainMenu,
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w900),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5,),
                Container(
                  width: 146, height: 58,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // option3 subMenuList
                        for (int i = 0; i < subMenuList.length; i++)
                          Text(subMenuList[i],
                            style: TextStyle(fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: Colors.black54),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 146,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10,),
                      Text('1타에 xx칼로리 소모!!',
                        style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.black54),
                      ),
                      SizedBox(height: 5,),
                      // option4 foodKcal
                      Text(foodKcal.toString() + 'Kcal',
                        style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.black26),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


