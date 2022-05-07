// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hotel/modules/register_screen.dart';
// import 'package:hotel/services/auth.dart';
// import 'package:hotel/shared/components/compantants.dart';
// import 'package:hotel/shared/style/colors.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:async/async.dart';
//
// import '../layout/home_layout.dart';
//
//
// class HotelLoginScreen extends StatelessWidget {
//   // final _authhh = FirebaseAuth.instance;
//   // AuthBase authBase = AuthBase();
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffD3DCDE),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color(0xffD3DCDE),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: formKey,
//           child: Center(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: [
//                   const Text(
//                     'Sign in',
//                     style:
//                         TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     'Welcome Back',
//                     style:
//                         TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     'Log in with your email and your password',
//                     style: TextStyle(
//                         fontSize: 19.0, fontWeight: FontWeight.normal),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   const Text(
//                     'or continue with social media',
//                     style: TextStyle(
//                         fontSize: 19.0, fontWeight: FontWeight.normal),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   defultFromFiled(
//                       validateName: (value) {
//                         if (value!.isEmpty) {
//                           return 'Email empty';
//                         }
//                         return null;
//                       },
//                       label: 'email adress',
//                       hint: 'emal',
//                       controller: emailController,
//                       icon: const Icon(Icons.email),
//                       keyBoard: TextInputType.emailAddress),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   defultFromFiled(
//                       validateName: (value) {
//                         if (value!.isEmpty) {
//                           return 'Password empty';
//                         }
//                         return null;
//                       },
//                       label: 'password please',
//                       hint: 'password',
//                       controller: passwordController,
//                       icon: const Icon(Icons.visibility),
//                       keyBoard: TextInputType.visiblePassword),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   defultbutton(
//                     text: 'login',
//                     radius: 20,
//                     color: buttom,
//                     onPressed:  () async {
//                     NavigateTo(HomeLayout(), context);
//                     if (formKey.currentState!.validate()) {
//  // await _authhh.signInWithEmailAndPassword(email: emailController.text, password:passwordController.text);
//                         await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
//  //                       await authBase.loginWithEmailAndPassword(emailController.text, passwordController.text);
//                         // print(result);
//
//                        NavigateTo(HomeLayout(), context);
//                       }
//                     },
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Don\'t have acount ?'),
//                       TextButton(
//                         onPressed: () {
//                           NavigateTo(HotelRegisterScreen(), context);
//                         },
//                         child: Text(
//                           'Register now'.toUpperCase(),
//                           style: const TextStyle(
//                             color: buttom,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel/modules/register_screen.dart';
import 'package:hotel/shared/components/compantants.dart';
import 'package:hotel/shared/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../layout/home_layout.dart';


class HotelLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? errorMessage;
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
                      label: 'Email address',
                      hint: 'Email',
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

                      if (formKey.currentState!.validate())
                      {
                        try {

                       await FirebaseAuth.instance.signInWithEmailAndPassword(email:emailController.text , password: passwordController.text)
                          .then((value) => {
                      Fluttertoast.showToast(msg: "Login Successful"),
                       Navigator.pushAndRemoveUntil(
                       context, MaterialPageRoute(builder: (context) =>  HomeLayout()),
                       (Route<dynamic> route) => false,),
                      });
                      }
                        on FirebaseAuthException catch (error) {
                        switch (error.code) {
                          case "invalid-email":
                            errorMessage = "  your email address is wrong.";

                            break;
                          case "wrong-password":
                            errorMessage = "Your password is wrong.";
                            break;
                          case "user-not-found":
                            errorMessage = "User with this email doesn't exist.";
                            break;
                          case "user-disabled":
                            errorMessage = "User with this email has been disabled.";
                            break;
                          case "too-many-requests":
                            errorMessage = "Too many requests";
                            break;
                          case "operation-not-allowed":
                            errorMessage = "Signing in with Email and Password is not enabled.";
                            break;
                          default:
                            errorMessage = "An undefined Error happened.";
                        }
                        Fluttertoast.showToast(msg: errorMessage!);
                        print(error.code);
                      }
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          'Reset password ?'.toUpperCase(),
                          style: const TextStyle(
                            color: buttom,
                          ),
                        ),
                      ),
                    ],
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
