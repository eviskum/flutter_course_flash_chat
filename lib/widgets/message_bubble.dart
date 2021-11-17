import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.messageTxt, required this.messageSender, required this.isCurrentUser})
      : super(key: key);

  final String messageTxt;
  final String messageSender;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text('$messageSender', style: TextStyle(fontSize: 12.0, color: Colors.black54)),
          Material(
            color: isCurrentUser ? Colors.lightBlueAccent : Colors.white,
            elevation: 10.0,
            borderRadius: BorderRadius.only(
              topLeft: isCurrentUser ? Radius.circular(30) : Radius.zero,
              topRight: isCurrentUser ? Radius.zero : Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                '$messageTxt',
                style: TextStyle(color: isCurrentUser ? Colors.white : Colors.black54, fontSize: 15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
