import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {

  double width = 50;
  double height = 50;


  CustomElevatedButton({Key? key,
  width, height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = this.width;
    double height = this.height;
    return Container(
      width: width, height: height,
      child: ElevatedButton(
        onPressed: () {

        },
        child: Text('잉'),
      ),
    );
  }
}
