import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:marvel/managment/user_managment.dart';
import 'package:marvel/pages/home_page.dart';
import 'package:marvel/pages/sign_up_page.dart';
import 'package:marvel/utils/utils.dart';
import 'package:marvel/widgets/buttons.dart';
import 'package:marvel/widgets/inpurs.dart';
import 'package:marvel/widgets/style_color.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  static final routeName = 'SingInPage';

  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formStateSingIn = GlobalKey<FormState>();

  UserManagment userManagment;

  String email;
  String password;

  @override
  void initState() {
    userManagment = Provider.of<UserManagment>(context, listen: false);
    super.initState();
  }

  void _onSignIn() async {
    if (!_formStateSingIn.currentState.validate()) {
      return;
    }
    _formStateSingIn.currentState.save();
    var res = await userManagment.signIn(
      email: email,
      password: password,
    );

    if (res.done) {
      Navigator.of(context).pushNamed(HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/back.png"),
                  fit: BoxFit.cover)),
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: _formStateSingIn,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 74),
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomFormInput(
                  hintText: 'User Email',
                  prefix: Icons.person_outline,
                  onSaved: (v) => this.email = v,
                  validator: (v) => v.isEmpty
                      ? "Email is required!"
                      : isValidEmail(v)
                          ? null
                          : "Invalid email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomFormInput(
                  hintText: "Password",
                  prefix: Icons.lock_outline,
                  onSaved: (v) => this.password = v,
                  validator: (v) => v.isEmpty ? "Password is required" : null,
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Text(
                  "Forgot password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: 44,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: CustumButton(
                  borderColor: loginButtonColor,
                  color: loginButtonColor,
                  radius: 0.0,
                  onTap: _onSignIn,
                  text: 'LOGIN',
                ),
              ),
              Container(
                height: 44,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: CustumButton(
                  borderColor: onBoardButtonBorderColor,
                  color: onBoardButtonColor,
                  radius: 0.0,
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpPage.routeName);
                  },
                  text: 'REGISTRATION',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
