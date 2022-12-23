import 'package:flutter/material.dart';
import 'package:task_manager/preferences_util[1].dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = false;
  String password = "";
  String email = "";

  @override
  void initState() {
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //return homepage in a scaffold widget
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome back",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Text(
                  "welcome back! , please enter your login details.",
                  style: TextStyle(
                      color: Color.fromARGB(255, 240, 235, 235),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                TextField(
                    textInputAction: TextInputAction.done,
                    controller: emailController,
                    onChanged: (text) {
                      email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: "Email",
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "name@gmail.com",
                      prefixIcon: const Icon(Icons.email_rounded),
                      suffixIcon: emailController.text.isEmpty
                          ? const Text("")
                          : IconButton(
                              color: Colors.blue,
                              onPressed: () {
                                email = "";
                                emailController.clear();
                              },
                              icon: const Icon(Icons.clear)),
                    )),
                const Padding(padding: EdgeInsets.only(bottom: 30)),
                TextField(
                  controller: passwordController,
                  obscureText: !isVisible,
                  maxLength: 8,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                    counterText: "",
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: passwordController.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : IconButton(
                            onPressed: () {
                              isVisible = !isVisible;
                              setState(() {});
                            },
                            icon: isVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                    prefixIcon: const Icon(Icons.key),
                    labelText: "Password",
                    hintText: "Enter password",
                  ),
                  onChanged: (text) {
                    password = text;
                  },
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 21, 109, 181)),
                      ),
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          overlayColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 10, 49, 92)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 17, 72, 116))),
                      onPressed: () {
                        Preferences.setString("user_email", email);
                        Preferences.setString("user_password", password);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 12)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      textAlign: TextAlign.start,
                      "Don't have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 230, 226, 226),
                          fontSize: 17),
                    ),
                    TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          // Defer to the widget's default.
                          overlayColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 21, 109, 181)),
                          foregroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 255, 255, 255)),
                        ),
                        child: const Text(
                          textAlign: TextAlign.center,
                          ",Sign up",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
