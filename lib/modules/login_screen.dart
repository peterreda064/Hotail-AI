import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/modules/register_screen.dart';
import 'package:hotel/shared/components/compantants.dart';
import 'package:hotel/shared/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../layout/home_layout.dart';

class HotelLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD3DCDE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffD3DCDE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const Text(
                    'Sign in',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Welcome Back',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Log in with your email and your password',
                    style: TextStyle(
                        fontSize: 19.0, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'or continue with social media',
                    style: TextStyle(
                        fontSize: 19.0, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  defultFromFiled(
                      validateName: (value) {
                        if (value!.isEmpty) {
                          return 'Email empty';
                        }
                        return null;
                      },
                      label: 'email adress',
                      hint: 'emal',
                      controller: emailController,
                      icon: const Icon(Icons.email),
                      keyBoard: TextInputType.emailAddress),
                  const SizedBox(
                    height: 20,
                  ),
                  defultFromFiled(
                      validateName: (value) {
                        if (value!.isEmpty) {
                          return 'Password empty';
                        }
                        return null;
                      },
                      label: 'password please',
                      hint: 'password',
                      controller: passwordController,
                      icon: const Icon(Icons.visibility),
                      keyBoard: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 20,
                  ),
                  defultbutton(
                    text: 'login',
                    radius: 20,
                    color: buttom,
                    onPressed: () async {
                      FirebaseAuth.instance.signInWithEmailAndPassword
                        (email: emailController.text, password: passwordController.text)
                      .then((value) {
                        {NavigateTo(HomeLayout(), context);}})
                      .onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                      if (formKey.currentState!.validate());
                      },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have acount ?'),
                      TextButton(
                        onPressed: () {
                          NavigateTo(HotelRegisterScreen(), context);
                        },
                        child: Text(
                          'Register now'.toUpperCase(),
                          style: const TextStyle(
                            color: buttom,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
