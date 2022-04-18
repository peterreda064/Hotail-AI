import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComplainsScreen extends StatelessWidget {
  const ComplainsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                "Contact us",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              cximageassets(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Name',
                        fillColor: Colors.white,
                        hintText: "Enter full name",
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Email',
                        fillColor: Colors.white,
                        hintText: "Enter Email Adress",
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const TextField(
                      maxLength: 500,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Message',
                        fillColor: Colors.white,
                        hintText: "Enter your Message",
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    MaterialButton(
                      height: 30.0,
                      minWidth: double.infinity,
                      color: const Color(0xff333333),
                      onPressed: () {},
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class cximageassets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/cx.png');
    Image image = Image(
      image: assetImage,
      width: 300,
      height: 300,
    );
    return Container(
      child: image,
    );
  }
}
