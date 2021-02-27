import 'package:flutter/material.dart';
import 'package:our_mobile_app/components/reusable_card.dart';
import 'package:our_mobile_app/constants.dart';
import 'signup_page.dart';
import 'login_page.dart';

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('our 😷✌️', style: TextStyle(
              fontFamily: 'Akaya Kanadaka',
              fontSize: 50.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
           )
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text('Honestly...this app does nothing for now!', style: TextStyle(
                fontFamily: 'RocknRollOne',
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold
            )),
          ),
          SizedBox(height: 200,),
          AfterSplashButton(buttonText: 'CREATE ACCOUNT', onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage(
            )));
          },),
          AfterSplashButton(buttonText: 'LOGIN', onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(
            )));
          },),
          SizedBox(height: 50.0,),
       ],

      ),
    );
  }
}

class AfterSplashButton extends StatelessWidget {
  AfterSplashButton({@required this.buttonText, this.onPress});

  final String buttonText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.deepPurpleAccent,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: ListTile(
                title: Center(
                  child: Text(buttonText,
                    style: TextStyle(
                        fontFamily: 'RocknRollOne',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),
          )
      ),
    );
  }
}
