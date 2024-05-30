import 'package:flutter/material.dart';

import '../widgets/custom_login_background.dart';
import '../widgets/login_user_cont.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomLoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/lovephotography.png",
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/rec.png",
                  opacity: AlwaysStoppedAnimation(.5),
                ),
                Image.asset(
                  "assets/images/uni2.png",
                  opacity: AlwaysStoppedAnimation(.5),
                ),
                Image.asset(
                  "assets/images/eleps.png",
                  opacity: AlwaysStoppedAnimation(.5),
                ),
                LoginUserCont(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
