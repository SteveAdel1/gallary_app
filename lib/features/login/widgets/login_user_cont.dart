import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/routes_pages_names.dart';
import '../view_model/login_cubit.dart';

class LoginUserCont extends StatefulWidget {
  const LoginUserCont({super.key});

  @override
  State<LoginUserCont> createState() => _LoginUserContState();
}

class _LoginUserContState extends State<LoginUserCont> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    var passwordController = TextEditingController();
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "you must enter E-mail";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                hintText: 'email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "enter password";
                }
                return null;
              },
              controller: passwordController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                hintText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  print(emailController.text);
                  if (formKey.currentState!.validate()) {
                    LoginCubit()
                        .login(emailController.text, passwordController.text)
                        .then((value) {
                      if (value == true) {
                        if (kDebugMode) {
                          print("well done");
                        }
                        print("done");
                        Navigator.pushReplacementNamed(
                            context, RoutesPagesNames.homeView);
                      }
                    });
                  }
                },
                child: Text("submit"))
          ],
        ),
      ),
    );
  }
}
