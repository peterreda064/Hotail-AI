import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

defultFromFiled({
  TextEditingController? controller,
  TextInputType? keyBoard,
  String? hint,
  String? label,
  Icon? icon,
  FormFieldValidator<String>? validateName,
}) =>
    TextFormField(
      validator: validateName!,
      controller: controller,
      keyboardType: keyBoard,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

defultbutton(
        {Color? color,
        double? radius,
        String? text,
        VoidCallback? onPressed}) =>
    Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius!),
      ),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text!.toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
NavigateTo(Widget? screen, context) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));

containerOfScreens(
        {String? text,
        String? image,
        GestureTapCallback? tap,
        String? open,
        String? close}) =>
    InkWell(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: HexColor('ADCCFD'),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 140,
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: AssetImage(image!),
                    height: 100,
                    width: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text!,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'open : $open',
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'close : $close',
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
homeScreens(
        {String? text, String? image, String? description, double? padding}) =>
    Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: HexColor('75A3FD'),
      ),
      backgroundColor: HexColor('75A3FD'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 120),
            // Place details
            child: Text(
              'Place details',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30),
            ),
          ),
          // The Mosque
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Text(
              text!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          // Mosque Image
          Padding(
            padding: EdgeInsets.only(left: padding!, right: 20, top: 15),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image(
                image: AssetImage(image!),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'Description :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 15),
            child: Text(
              description!,
              style: const TextStyle(fontSize: 17, color: Colors.white),
            ),
          ),
        ],
      ),
    );