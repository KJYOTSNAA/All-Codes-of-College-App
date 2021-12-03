import 'package:flutter/material.dart';
import 'package:flutter_application_2/Login_page.dart';
import 'package:flutter_application_2/singup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hello friends welcome to Arka Jain University App , here you can login or signin in this App... Enjoy The Day!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.brown[700],
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/4207.jpg"))),
            ),
            Column(
              children: [
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black
                    ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "LogIn",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                    ) ,
                  ),

                ),
                SizedBox(height: 20,),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  color: Colors.orange[800],
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                    ) ,
                  ),

                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
