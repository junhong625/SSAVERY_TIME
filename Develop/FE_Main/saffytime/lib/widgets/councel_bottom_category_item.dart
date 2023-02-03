// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controllers/councel_bottom.dart';
//
// class CBCategoryItem extends StatelessWidget {
//   final String category;
//
//   CBCategoryItem({Key? key,
//     required this.category}) : super(key: key);
//
//   CBCategoryController controller = Get.put(CBCategoryController());
//
//   @override
//   Widget build(BuildContext context) {
//     String category = this.category;
//     return Obx(() => SizedBox(
//       height: 35,
//       child: FittedBox(
//           fit: BoxFit.fitHeight,
//           child: OutlinedButton(
//             style: OutlinedButton.styleFrom(
//               padding: EdgeInsets.zero,
//               side: BorderSide(width: 1,
//                   color: Color(0xff0079D1)),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//               backgroundColor: controller.myPick.contains(category) ? Color(0xff0079D1) : Colors.white,
//             ),
//             onPressed: () {
//               controller.select(category);
//               print(controller.myPick);
//             },
//             child: Text(category,
//               style: TextStyle(fontWeight: FontWeight.w900,
//                   fontSize: 11,
//                   color: controller.myPick.contains(category) ? Colors.white : Color(0xff0079D1)
//               ),
//             ),
//           ),
//         ),
//     ),
//     );
//   }
// }
