import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/widget/mybottom.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'new_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _fromKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    // String email = "";
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 166, 184),
      body: SafeArea(
        child: Center(
            child: Form(
                key: _fromKey,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                          // onChanged: (value) {
                          //   email = value;
                          // },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          })),

                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: passController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          }
                          return null;
                        },
                      )),
                  SizedBox(height: 15),
                  // Container(
                  //   height: 50,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  InkWell(
                    onTap: () {
                      if (_fromKey.currentState!.validate()) {
                        signinUsingfirebase(emailController.text,passController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => secondpage(
                                    email: emailController.text,
                                  )),
                        );
                      } else {
                        emailController.clear();
                      }
                    },
                    child: MyBottom(
                      label: "login",
                    ),
                  ),
                ]))),
      ),
    );
  }
}

saveEmail(String email) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("email", email);
}

signinUsingfirebase(String email, String password) async {
  final userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  final user = userCredential.user;
  print(user?.uid);
  saveEmail(user!.email!);
}
