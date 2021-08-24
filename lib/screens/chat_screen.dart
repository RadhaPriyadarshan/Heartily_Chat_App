import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heartily_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';


final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth =FirebaseAuth.instance;

  String messagesText;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }


 void getCurrentUser() {
    try {
      final user =   _auth.currentUser;
      if (user != null) {
        loggedInUser = user;

      }
    }
    catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
       Scaffold(
         backgroundColor: Colors.transparent,
        appBar: AppBar(

          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {

                  _auth.signOut();
                  Navigator.pop(context);
                  //Implement logout functionality
                }),
          ],
          title: Text('❤  Heartily Chat'),
          centerTitle: true,
          shadowColor: Colors.pink,
          backgroundColor: Colors.pink,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessagesStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          //Do something with the user input.
                          messagesText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        messageTextController.clear();
                        //Implement send functionality.
                        _firestore.collection('messages').add({
                          'text': messagesText,
                          'sender': loggedInUser.email,
                        });
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]
    );
  }
}

class MessagesStream extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pinkAccent,
              )
          );
        }
        List<MessageBubble> messageBubbles = [];
        final messages = snapshot.data.docs.reversed;
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text:messageText,
            isMe: currentUser==messageSender,
          );


          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}




class MessageBubble extends StatelessWidget {

  MessageBubble({this.sender,this.text,this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text('$sender',
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.pink[800],
            ),
          ),
          Material(
            borderRadius: isMe? BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(50.0),
              bottomLeft: Radius.circular(30.0),
            ):BorderRadius.only(

              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(30.0),
            ),
            elevation: 10.0,
            color: isMe?  Colors.pink[900] : Colors.pinkAccent,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                  '$text',
                  style: TextStyle(
                    color: Colors.white,
                  fontSize: 20.0,
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
