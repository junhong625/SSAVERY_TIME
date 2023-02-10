import 'package:flutter/material.dart';

// 마이 스크린 사진 학번 있는 위젯
class MUI extends StatefulWidget {
  final String? imgURL;
  final int? studentID;
  final String? name;

  const MUI({
    Key? key,
    this.name,
    this.imgURL,
    this.studentID,
  }) : super(key: key);

  @override
  State<MUI> createState() => _MUIState();
}

class _MUIState extends State<MUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 80,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Container(
            child: FittedBox(
              fit: BoxFit.contain,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: widget.imgURL != null
                    ? NetworkImage(widget.imgURL ?? "")
                    : AssetImage("assets/image/no_profile_image.png")
                        as ImageProvider,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
              child: Text('${widget.studentID} ${widget.name}',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24)))
        ],
      ),
    );
  }
}
