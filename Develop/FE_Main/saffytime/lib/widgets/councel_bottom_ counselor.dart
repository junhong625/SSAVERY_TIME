import 'package:flutter/material.dart';

class CBCounselor extends StatelessWidget {
  const CBCounselor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71, height: 84,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: FittedBox(
              fit: BoxFit.contain,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('asset/person.jpg'),),
            ),
          ),
          Container(
            child: Text('김싸피1', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 11),),
          ),
          Container(
            child: Text('컨설턴트', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),),
          ),
        ],
      ),
    );
  }
}
