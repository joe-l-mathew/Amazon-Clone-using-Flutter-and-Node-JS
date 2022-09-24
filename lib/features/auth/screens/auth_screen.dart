import 'package:amazon_clone_with_nodejs/common/widgets/custom_button.dart';
import 'package:amazon_clone_with_nodejs/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_with_nodejs/constants/global_variables.dart';
import 'package:flutter/material.dart';

// import '../../../common/widgets/custom_textfield.dart';

enum Auth { signup, signin }

class AuthScreen extends StatefulWidget {
  static const routeName = "auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final signupformKey = GlobalKey<FormState>();
  final signinformKey = GlobalKey<FormState>();
  Auth _auth = Auth.signup;
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                ListTile(
                  tileColor: _auth == Auth.signup
                      ? GlobalVariables.backgroundColor
                      : null,
                  title: const Text(
                    "Create Account",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signup,
                      groupValue: _auth,
                      onChanged: ((Auth? value) {
                        setState(() {
                          _auth = value!;
                        });
                      })),
                ),
                if (_auth == Auth.signup)
                  Container(
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                        key: signupformKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CustomTextField(
                                  controller: emailController,
                                  hintText: "Name"),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                  controller: passController,
                                  hintText: "Email"),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                isPass: true,
                                controller: nameController,
                                hintText: "Password",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                  text: "Create Account",
                                  onPressed: () {
                                    print("Hello new uuser");
                                  })
                            ],
                          ),
                        )),
                  ),
                ListTile(
                  tileColor: _auth == Auth.signin
                      ? GlobalVariables.backgroundColor
                      : null,
                  title: Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signin,
                      groupValue: _auth,
                      onChanged: ((Auth? value) {
                        setState(() {
                          _auth = value!;
                        });
                      })),
                ),
                if (_auth == Auth.signin)
                  Container(
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                        key: signupformKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CustomTextField(
                                  controller: passController,
                                  hintText: "Email"),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                isPass: true,
                                controller: nameController,
                                hintText: "Password",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                  text: "Create Account",
                                  onPressed: () {
                                    print("Hello new uuser");
                                  })
                            ],
                          ),
                        )),
                  ),
              ],
            ),
          ),
        ));
  }
}
