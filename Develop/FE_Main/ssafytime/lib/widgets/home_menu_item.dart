import 'package:flutter/material.dart';

// 홈스크린 메뉴 항목 위젯
class HMIW extends StatefulWidget {
  final String imgUrl; // option1 이미지 url
  final String mainMenu; // option2-1 메인메뉴
  final String subMenuA; // option2-2 서브메뉴 1
  final String subMenuB; // option2-3 서브메뉴 2
  final double foodKcal; // option3 음식칼로리

  const HMIW(
      {Key? key,
      required this.imgUrl,
      required this.mainMenu,
      required this.subMenuA,
      required this.subMenuB,
      required this.foodKcal})
      : super(key: key);

  @override
  State<HMIW> createState() => _HMIWState();
}

class _HMIWState extends State<HMIW> {
  @override
  Widget build(BuildContext context) {
    String imgUrl = widget.imgUrl;
    String mainMenu = widget.mainMenu;
    String subMenuA = widget.subMenuA;
    String subMenuB = widget.subMenuB;
    double foodKcal = widget.foodKcal;

    return Center(
      child: Container(
        width: 173,
        height: 211,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2),
            color: Colors.black12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imgUrl, fit: BoxFit.fill, // option1
                width: 173, height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // option2-1
                  Text(
                    mainMenu,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                  // option2-2
                  Text(
                    subMenuA,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: Color(0xff73777F),
                    ),
                  ),
                  // option2-3
                  Text(
                    '$subMenuB ...',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: Color(0xff73777F),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // option 3
                  Text(
                    '${foodKcal}kcal',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
