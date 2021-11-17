import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_flash_chat/constants.dart';
import 'package:flutter_course_flash_chat/widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _textEditingController = TextEditingController();
  User? loggedInUser;
  String? messageTxt;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    loggedInUser = _auth.currentUser;
  }

  // void messageStream() async {
  //   _firestore.collection('messages').snapshots().listen((event) {
  //     event.
  //   })
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.of(context).pop();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            messagesStream(),
            messageInput(),
          ],
        ),
      ),
    );
  }

  Container messageInput() {
    return Container(
      decoration: kMessageContainerDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController,
              onChanged: (value) {
                messageTxt = value;
              },
              decoration: kMessageTextFieldDecoration,
            ),
          ),
          FlatButton(
            onPressed: () {
              _textEditingController.clear();
              _firestore
                  .collection('messages')
                  .add({'sender': loggedInUser!.email ?? 'no email', 'text': messageTxt ?? ''});
              //Implement send functionality.
            },
            child: Text(
              'Send',
              style: kSendButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> messagesStream() {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          List<MessageBubble> messageWidgets = [];
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages) {
            final messageData = message.data() as Map<String, dynamic>;
            final messageTxt = messageData['text'] as String;
            final messageSender = messageData['sender'] as String;
            final messageWidget = MessageBubble(
                messageTxt: messageTxt,
                messageSender: messageSender,
                isCurrentUser: loggedInUser!.email == messageSender);
            messageWidgets.add(messageWidget);
          }
          // return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: messageWidgets);
          return Expanded(
              child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageWidgets,
          ));
        });
  }
}
