import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
          child: Column(
        children: [
          // thông tin người nhận tin nhắn (button back, tên, avt, trạng thái hoạt động, button call, button video call)
          _buildTopInformation(),
          // _buildMyMessageSection("I love you"),
          // _buildUserMessageSection("No xia xia"),
          // _buildMessageInputSection(),
        ],
      )),
    );
  }

  Widget _buildTopInformation() {
    return Container(
      width: 327,
      height: 44,
      margin: EdgeInsets.only(top: 16, bottom: 20, left: 24, right: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildButtonBack(), // button back
          _buildUserAvt(), //user avt
          _buildUserInfo(), // tên, trạng thái hoạt động
          _buildButtonCall(),
          _buildButtonVideoCall(),
        ],
      ),
    );
  }

  Widget _buildButtonBack() {
    return Container(
      width: 24,
      height: 24,
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 10),
      child: Image.asset("assets/images/back_icon.png"),
    );
  }

  Widget _buildUserAvt() {
    return Container(
      width: 44,
      height: 44,
      margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 12),
      child: Image.asset("assets/images/avt_user.png"),
    );
  }

  Widget _buildUserInfo() {
    return SizedBox(
        width: 165,
        height: 40,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text("Jhon Abraham",
                      style: TextStyle(
                          fontFamily: "Caros",
                          fontWeight: FontWeight.w600,
                          fontSize: 16))),
              Expanded(
                child: Text(
                  "Active now",
                  style: TextStyle(
                      fontFamily: "Circular-Std",
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              )
            ]));
  }

  Widget _buildButtonCall() {
    return Container(
      width: 24,
      height: 24,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Image.asset("assets/images/call_icon.png"),
    );
  }

  Widget _buildButtonVideoCall() {
    return Container(
      width: 24,
      height: 24,
      margin: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 0),
      child: Image.asset("assets/images/video_call_icon.png"),
    );
  }
// _buildMyMessageSection(String message) {}
//
// _buildUserMessageSection(String message) {}
//
// _buildMessageInputSection() {}
}
