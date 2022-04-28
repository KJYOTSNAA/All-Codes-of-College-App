// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController nameController,
      emailController,
      passwordController,
      cnfPasswordController;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cnfPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Creat your AJU account...",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                children: [
                  inputFile(lable: "Full name", controller: nameController),
                  inputFile(lable: "Email", controller: emailController),
                  inputFile(
                      lable: "Password",
                      obsureText: true,
                      controller: passwordController),
                  inputFile(
                      lable: "Confirm Password",
                      obsureText: true,
                      controller: cnfPasswordController),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: const Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    if (_validateEmptyFields()) {
                      //if All fields are not empty
                      if (_validateName()) {
                        //check for valid name (Not containing any number or special character
                        //If Name is valid check for Email
                        if (_validateEmail()) {
                          //Valid Email
                          //Check for Password and Confirm Password are same or not
                          if (_validatePassword()) {
                            //Navigate to Other page
                          } else {
                            //display Message 'Password Mismatching' Using Toast
                          }
                        } else {
                          //display Message 'Invalid Email' Using Toast
                        }
                      } else {
                        //display Message 'Invalid Name' Using Toast
                      }
                    } else {
                      //If any field is empty display an error message using Toast/Alert Dialog
                    }
                  },
                  color: Colors.purple,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "SignUp Now",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account??"),
                  const Text(
                    "LogIn",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateEmptyFields() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        cnfPasswordController.text.isEmpty) return false;
    return true;
  }

  _validateName() {
    if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
        .hasMatch(nameController.text)) return false;
    return true;
  }

  _validateEmail() {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) return true;
    return false;
  }

  _validatePassword() {
    if (passwordController.text == cnfPasswordController.text) return false;
    return true;
  }
}

Widget inputFile({lable, obsureText = false, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        lable,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
