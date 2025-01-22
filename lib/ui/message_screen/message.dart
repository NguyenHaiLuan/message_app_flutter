import 'package:chatscreen/model/message.dart';
import 'package:flutter/material.dart';

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
        content: "You did your job well!", time: "09:25 AM", isMyMessage: true),
    Message(
        content: "Have a great working week!",
        time: "09:25 AM",
        isMyMessage: false),
    Message(content: "Yeah!", time: "09:25 AM", isMyMessage: true),
  ];

  // Ham them 1 Message vao list messages
  void addMessage(String content, String time, bool isMyMessage) {
    setState(() {
      messages
          .add(Message(content: content, time: time, isMyMessage: isMyMessage));
    });
  }

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
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              // xây dựng UI phần tin nhắn
              return _buildMessageItem(message);
            },
          ))
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

  Widget _buildMessageItem(Message message) {
    return Container(
      alignment:
          message.isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      margin: message.isMyMessage
          ? EdgeInsets.only(bottom: 30, right: 24)
          : EdgeInsets.only(bottom: 30, left: 24),
      child: Column(
        children: [
          _buildMessageContent(message), // Phan noi dung tin nhan
          _buildMessageTime(message) // phan gio
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
}
