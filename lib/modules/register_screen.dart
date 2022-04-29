import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/layout/home_layout.dart';
import 'package:hotel/modules/main_screens/profile_screen.dart';
import 'package:hotel/shared/components/compantants.dart';
import 'package:hotel/shared/style/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';

class HotelRegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CollectionReference IDS = FirebaseFirestore.instance.collection('IDS');
    return Scaffold(
      backgroundColor: const Color(0xffD3DCDE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffD3DCDE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const Text(
                    'Sign up',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Register Account',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Complete your details or log in with social media',
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.normal),
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
                  defultFromFiled(
                      validateName: (value) {
                        if (value!.isEmpty) {
                          return 'confirm empty';
                        }
                        return null;
                      },
                      label: 'confirm please',
                      hint: 'confirm',
                      controller: confirmPasswordController,
                      icon: const Icon(Icons.visibility),
                      keyBoard: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 20,
                  ),
                  defultFromFiled(
                      validateName: (value) {
                        if (value!.isEmpty) {
                          return 'phone empty';
                        }
                        return null;
                      },
                      label: 'phone please',
                      hint: 'phone',
                      controller: phoneController,
                      icon: const Icon(Icons.phone),
                      keyBoard: TextInputType.phone),
                  const SizedBox(
                    height: 20,
                  ),
                  defultFromFiled(
                      validateName: (value) {
                        if (value!.isEmpty) {
                          return 'name empty';
                        }
                        return null;
                      },
                      label: 'name please',
                      hint: 'name',
                      controller: nameController,
                      icon: const Icon(Icons.person),
                      keyBoard: TextInputType.name),
                  const SizedBox(
                    height: 35,
                  ),
                  defultbutton(
                    text: 'register',
                    radius: 20,
                    color: buttom,
                    onPressed: () {
                      IDS.add({
                        'email': emailController.text,
                        'pass': passwordController.text,
                        'name': nameController.text,
                        'phone': phoneController.text,
                      });
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        print("Created New Account");
                        NavigateTo(HotelLoginScreen(), context);
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });

                      if (formKey.currentState!.validate()) ;
                    },
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
