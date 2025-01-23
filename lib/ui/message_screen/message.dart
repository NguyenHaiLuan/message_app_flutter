import 'package:chatscreen/model/message.dart';
import 'package:flutter/material.dart';

import '../call_screen/call.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<Message> messages = [
    Message(
        content: "Hello! Jhon Abraham", time: "09:25 AM", isMyMessage: true),
    Message(
        content: "Hello ! Nazrul How are you?",
        time: "09:25 AM",
        isMyMessage: false),
    Message(
        content: "You did your job well!", time: "09:26 AM", isMyMessage: true),
    Message(
        content: "Have a great working week!",
        time: "09:27 AM",
        isMyMessage: false),
    Message(content: "Yeah!", time: "09:27 AM", isMyMessage: true),
    Message(
        content: "Can you speak Vietnamese?!",
        time: "09:27 AM",
        isMyMessage: false),
    Message(content: "Yes! I can!", time: "09:28 AM", isMyMessage: true),
    Message(
        content: "Khi nào bạn nghỉ tết?", time: "09:29 AM", isMyMessage: false),
    Message(content: "Sớm thôi!", time: "09:35 AM", isMyMessage: true),
  ];

  // Ham them 1 Message vao list messages
  void addMessage(String content, String time, bool isMyMessage) {
    setState(() {
      messages
          .add(Message(content: content, time: time, isMyMessage: isMyMessage));
    });
  }

  // Giao dien chinh
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
          child: Column(
        children: [
          // thông tin người nhận tin nhắn (button back, tên, avt, trạng thái hoạt động, button call, button video call)
          _buildTopInformation(),

          // Thêm listview tin nhắn
          Expanded(
              child: ListView.builder(
            reverse: true, //đảo ngược thứ tự hiển thị
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages.reversed.toList()[index];
              // xây dựng UI phần tin nhắn
              return _buildMessageItem(message, index);
            },
          )),

          // Xay dunwg UI phần nhập tin nhắn
          _buildInputSection()
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
          _buildButtonCall(), // button call
          _buildButtonVideoCall(), // button call video
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
        height: 46,
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
                      color: const Color(0xFF797C7B),
                      fontWeight: FontWeight.w400),
                ),
              )
            ]));
  }

  Widget _buildButtonCall() {
    return GestureDetector(
      onTap: () {
        // Xu li su kien khi nguoi dung an vao button call
        onCallButtonClickHandled();
      },
      child: Container(
        width: 24,
        height: 24,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: Image.asset("assets/images/call_icon.png"),
      ),
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

  Widget _buildMessageItem(Message message, int index) {
    return Container(
      alignment:
          message.isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      margin: message.isMyMessage
          ? EdgeInsets.only(bottom: 20, right: 24)
          : EdgeInsets.only(bottom: 20, left: 24),
      child: Column(
        children: [
          _buildMessageContent(message), // Phan noi dung tin nhan
          _buildMessageTime(message) // build phan gio
        ],
      ),
    );
  }

  Widget _buildMessageContent(Message message) {
    return Container(
      height: 45,
      padding: message.isMyMessage
          ? EdgeInsets.only(top: 12, bottom: 12, right: 12, left: 14)
          : EdgeInsets.only(top: 12, bottom: 12, right: 14, left: 12),
      constraints: BoxConstraints(
          maxWidth: 200, minHeight: 36), // dài nhất: 200, rộng ít nhất: 36
      decoration: BoxDecoration(
        color: message.isMyMessage ? Color(0xFF20A090) : Color(0xFFF2F7FB),
        borderRadius: message.isMyMessage
            ? BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))
            : BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
      ),
      child: Text(message.content,
          style: TextStyle(
              fontFamily: "Circular-Std",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color:
                  message.isMyMessage ? Color(0xFFFFFFFF) : Color(0xFF000E08))),
    );
  }

  Widget _buildMessageTime(Message message) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Text(
        message.time,
        style: TextStyle(
            color: Color(0xFF797C7B),
            fontSize: 10,
            fontFamily: "Circular-Std",
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
      height: 90,
      width: double.infinity,
      margin: EdgeInsets.only(top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildButtonAttach(), // UI button dinh kem
          _buildInputMessageFrame(), // UI khung nhap lieu
          _buildSendButton(), // UI button send message
        ],
      ),
    );
  }

  Widget _buildButtonAttach() {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 11),
      child: Image.asset("assets/images/attached_icon.png"),
    );
  }

  Widget _buildInputMessageFrame() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
            //Hien thi icon o cuoi   // o dau = prefixIcon
            suffixIcon: Container(
              width: 24,
              height: 24,
              margin: EdgeInsets.only(right: 8),
              child: Image.asset("assets/images/show_icon_icon.png"),
            ),
            filled: true,
            fillColor: Color(0xFFF3F6F6),
            enabledBorder: OutlineInputBorder(
                // Khi text field duoc hien thi len
                borderSide: BorderSide(width: 1, color: Color(0xFFF3F6F6)),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
              // Khi duoc focus
              borderSide: BorderSide(color: Color(0xFFF3F6F6), width: 2.0),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
                // khung mac dinh
                borderSide: BorderSide(
                    width: 1, color: Color(0xFFF3F6F6)), // custom canh
                borderRadius: BorderRadius.circular(20)),
            hintText: "Write your message",
            hintStyle: TextStyle(
                fontSize: 12,
                color: Color(0xFF797C7B),
                fontFamily: "Circular-Std",
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  Widget _buildSendButton() {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.only(right: 24, left: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xFF20A090)),
      child: Image.asset("assets/images/send_icon.png"),
    );
  }

  //chuyen sang man hinh CallScreen
  void onCallButtonClickHandled() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(),
        ));
  }
}
