import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.ontap});
  final Function()? ontap;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  void logIn() async {
    String email = emailcontroller.text.trim();
    String password = passcontroller.text.trim();

    showDialog(
        context: context,
        builder: (context) => const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            )));

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      var snackbar = SnackBar(content: Text(e.code));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset("assets/Login.svg"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Login",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 29,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  hintText: "Email",
                  obsecureText: false,
                  controller: emailcontroller,
                  labelText: 'Username',
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  hintText: "Password",
                  obsecureText: true,
                  controller: passcontroller,
                  labelText: 'Password',
                ),
                const SizedBox(
                  height: 40,
                ),
                MyButton(
                  text: "Login",
                  ontap: logIn,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?"),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        " Sign In!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade900),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
