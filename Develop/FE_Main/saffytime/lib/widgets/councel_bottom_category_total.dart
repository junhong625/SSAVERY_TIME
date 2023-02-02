import 'package:flutter/material.dart';

import '../model/councel_bottom.dart';
import 'councel_bottom_category_item.dart';

class CBCategoryTotal extends StatelessWidget {
  const CBCategoryTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    staticCategory table = staticCategory();
    return Container(
      color: Colors.grey,
      width: 390, height: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('상담 카테고리 선택',
              style: TextStyle(fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: Colors.brown,
            width: 358, height: 146,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 10,
              children: [
                for (int i = 0; i < table.table.length; i++ ) ... [
                  CBCategoryItem(category: table.table[i],)
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
