import 'package:flutter/material.dart';
import 'package:shopping/config/firebase_auth_util.dart';
import 'package:shopping/views/home_page.dart';
import 'package:shopping/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController usernamecontroll = TextEditingController();
  TextEditingController passwordcontroll = TextEditingController();
  bool isLoading = false;
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  SizedBox(
                    height: 150,
                    child: Image.asset("assets/image/OIP.jpeg"),
                  ),
                  TextFormField(
                    controller: usernamecontroll,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Username",
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFormField(
                    obscureText: secure,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    controller: passwordcontroll,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          secure ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          secure = !secure;
                          setState(() {});
                        },
                      ),
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          bool loginResult = await FirebaseAuthUtil.loginIn(
                              email: usernamecontroll.text,
                              password: passwordcontroll.text);
                          if (loginResult) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          } else {
                            var snackBar = const SnackBar(
                              content: Text("Email or password is not correct"),
                            );
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          isLoading = false;
                          setState(() {});
                          passwordcontroll.clear();
                        }
                      },
                      label: 'Login',
                      color: Colors.blue),
                  const SizedBox(height: 20),
                  const Text('forget password ?',
                      style: TextStyle(decoration: TextDecoration.underline)),
                  const SizedBox(height: 40),
                  CustomButton(
                      ontap: () {},
                      color: Colors.grey,
                      label: 'Create Account'),
                ],
              ),
            ),
          )),
    );
  }
}
