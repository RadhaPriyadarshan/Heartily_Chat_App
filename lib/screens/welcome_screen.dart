import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:heartily_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static  const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState ();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = CurvedAnimation(parent:controller ,curve:Curves.easeIn );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("images/logo.png"), context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value * 120,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  'Heartily Chat',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Bulgatti',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Rounded_Button(colour: Colors.pinkAccent[400],title: 'login', onPressed:  () {
              //Go to login screen.
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            Rounded_Button(colour:Colors.pink[900],title: 'Register',onPressed: () {
              //Go to registration screen.
              Navigator.pushNamed(context, RegistrationScreen.id);
            })

          ],
        ),
      ),
    );
  }
}


