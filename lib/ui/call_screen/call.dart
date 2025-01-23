import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          // anh background
          _buildBackGroundImage(),
          // button back
          _buildButtonBack(context),
          //man hinh nho goc tren ben phai
          _buildSmallScreen(),
          // hang lenh o duoi
          _buildBottomButtons(context)
        ],
      ),
    );
  }

  Widget _buildBackGroundImage() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        "assets/images/call_man.png",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildButtonBack(BuildContext context) {
    return Positioned(
        height: 24,
        width: 24,
        top: 60,
        left: 24,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/back_icon.png",
          ),
        ));
  }

  Widget _buildSmallScreen() {
    return Positioned(
        height: 98,
        width: 86,
        top: 60,
        right: 24,
        child: Image.asset("assets/images/call_girl.png"));
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Positioned(
      width: 320,
      height: 48,
      bottom: 40,
      right: 27,
      child: Row(
        children: [
          _buildMicButton(), //button mic
          _buildVolumnButton(), //button volumn
          _buildVideoCamButton(), //button video
          _buildMessageButton(), //button message
          _buildCloseButton(context) //button close
        ],
      ),
    );
  }

  Widget _buildMicButton() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(48 / 2)),
          color: Color(0xFF333E39)),
      margin: EdgeInsets.only(right: 20),
      child: Image.asset("assets/images/mic_rec_icon.png"),
    );
  }

  Widget _buildVolumnButton() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(48 / 2)),
          color: Color(0xFF333E39)),
      margin: EdgeInsets.only(right: 20),
      child: Image.asset("assets/images/music_icon.png"),
    );
  }

  Widget _buildVideoCamButton() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(48 / 2)),
          color: Color(0xFF333E39)),
      margin: EdgeInsets.only(right: 20),
      child: Image.asset("assets/images/video_icon.png"),
    );
  }

  Widget _buildMessageButton() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(48 / 2)),
          color: Color(0xFF20A090)),
      margin: EdgeInsets.only(right: 20),
      child: Image.asset("assets/images/chat_message_icon.png"),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Positioned(
        child: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(48 / 2)),
            color: Color(0xFFEA3736)),
        child: Image.asset("assets/images/remove_icon.png"),
      ),
    ));
  }
}
