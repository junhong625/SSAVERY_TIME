// login screen
import 'package:flutter/material.dart';
import 'package:saffytime/widgets/login_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassWord = TextEditingController();
  bool? _autoLogin = false; // 자동로그인 값
  final bool _btnFlag = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: 50,
                height: 100,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.blue[400],
              ), // 앱 로고
              Form(
                  child: Column(
                children: [
                  CustomInputData(
                    userInfo: userEmail,
                    labelText: '이메일',
                    placeholderText: '이메일을 입력해 주세요.',
                    inputType: TextInputType.emailAddress,
                    isObscureText: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  CustomInputData(
                    userInfo: userPassWord,
                    labelText: '비밀번호',
                    placeholderText: '비밀번호를 입력해 주세요.',
                    inputType: TextInputType.text,
                    isObscureText: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(

                      /// toDo : 로그인 기능 구현 ///
                      onPressed: _btnFlag
                          ? () {
                              print(userEmail.text);
                              print(userPassWord.text);
                              wrongUserInfo(context, '에러메세지 쓰기', 2); // 스낵바 예시
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          minimumSize: const Size(330, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  ///////////////자동 로그인 및 비밀번호 찾기///////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 30)),
                          Checkbox(
                              value: _autoLogin,
                              onChanged: (value) {
                                setState(() {
                                  _autoLogin = value;
                                  print(_autoLogin);
                                });
                              }),
                          const Text(
                            '자동로그인',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextButton(

                            /// toDo : 비밀번호 찾기 기능 구현 //
                            onPressed: () {},
                            child: const Text(
                              '비밀번호 찾기',
                              style: TextStyle(fontSize: 15),
                            )),
                      )
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

// 이메일 or 비번 오류시에 스낵바로 표현
// 함수 인자 context 는 변경 ㄴㄴ
// erroMsg 에는 출력할 에러 메세지 작성
// sec 는 몇 초 동안 스백바 를 띄울  것인지
void wrongUserInfo(BuildContext context, String errorMsg, int sec) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMsg), // 띄울 에러 메세지
      duration: Duration(seconds: sec), // 몇 초 동안 띄울 것인가
      backgroundColor: Colors.redAccent,
    ),
  );
}
