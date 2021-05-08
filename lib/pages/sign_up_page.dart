import 'package:flutter/material.dart';
import 'package:marvel/managment/user_managment.dart';
import 'package:marvel/models/custom_user.dart';
import 'package:marvel/pages/sign_in_page.dart';
import 'package:marvel/utils/utils.dart';
import 'package:marvel/widgets/buttons.dart';
import 'package:marvel/widgets/inpurs.dart';
import 'package:marvel/widgets/style_color.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  static final routeName = 'SingUpPage';

  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formStateSingIn = GlobalKey<FormState>();
  String email;
  String password;
  String nick;
  UserManagment userManagment;

  @override
  void initState() {
    userManagment = Provider.of<UserManagment>(context, listen: false);
    super.initState();
  }

  void onSignUp() async {
    if (!_formStateSingIn.currentState.validate()) {
      return;
    }
    _formStateSingIn.currentState.save();
    userManagment.createUser(
      user: CustomUser(
        nickName: nick,
        email: email,
      ),
      password: password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.cover)),
        child: _body(),
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
                  hintText: 'Nick Name',
                  prefix: Icons.person_outline,
                  onSaved: (v) => this.nick = v,
                  validator: (v) => v.isEmpty ? "Enter a Nick Name" : null,
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
                height: 44,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: CustumButton(
                  borderColor: loginButtonColor,
                  color: loginButtonColor,
                  radius: 0.0,
                  onTap: () {
                    onSignUp();
                  },
                  text: 'REGISTRATION',
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
                        .pushReplacementNamed(SignInPage.routeName);
                  },
                  text: 'LOGIN',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
