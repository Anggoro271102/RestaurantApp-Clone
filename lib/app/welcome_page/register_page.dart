import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_welcome/register_controller.dart';
import 'package:flutter_application_1/app/modules/home/widget/my_textfield.dart';
import 'package:flutter_application_1/app/welcome_page/login_page.dart';
import 'package:flutter_application_1/app/welcome_page/welcome_page.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.to(const WelcomePage());
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
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
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Create an account ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      MyTextField(
                        icons: Icons.person,
                        lable: "Enter name",
                        Onchange: controller.name,
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
                      MyTextField(
                        icons: Icons.email,
                        lable: "Enter email",
                        Onchange: controller.email,
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
                      MyTextField(
                        icons: Icons.key,
                        lable: "Enter password",
                        Onchange: controller.password,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      MyTextField(
                        icons: Icons.key,
                        lable: "Re-Enter password",
                        Onchange: controller.confirmPassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
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
                        )),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        controller.onSignUp();
                      },
                      color: const Color(0xff0095FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          " Login ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ) // Your Scaffold goes here.
        );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false, Function(String)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        width: 420,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: TextField(
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
