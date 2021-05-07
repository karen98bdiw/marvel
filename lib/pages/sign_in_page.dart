import 'package:flutter/material.dart';
import 'package:marvel/utils/colors.dart';
import 'package:marvel/widgets/custom_botton.dart';
import 'package:marvel/widgets/custom_input.dart';

class SignInPage extends StatefulWidget {
  static final routeName = "SignInPage";

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage("assets/image/background.png"),
            fit: BoxFit.cover),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 50),
                child: Text("Log In",
                    style: Theme.of(context).textTheme.headline1)),
            SizedBox(
              height: 8.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomInput(
                    hintText: "userName",
                    prefix: Icons.person,
                    iconSize: 30,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  CustomInput(
                    hintText: "password",
                    prefix: Icons.lock,
                    iconSize: 30,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Container(
                    // padding: EdgeInsets.only(top: 20),
                    child: CutomButton(
                      buttonColor: TextColor.loginColor,
                      text: "LOGIN",
                      onTap: () {
                        // Navigator.of(context).pushNamed(SignInPage.routeName);
                      },
                    ),
                  ),
                  CutomButton(
                    buttonColor: Theme.of(context).buttonColor,
                    text: "REGISTRATION",
                    onTap: () {
                      // Navigator.of(context).pushNamed(SignInPage.routeName);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
