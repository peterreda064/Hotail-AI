// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// class ProfileScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     var  fireuser = FirebaseAuth.instance.currentUser!;
//     var users = FirebaseFirestore.instance.collection('users').doc(fireuser.uid).snapshots();
//     //  CollectionReference users = FirebaseFirestore.instance.collection('users');
//     getData() async {
//       final user =  await FirebaseFirestore.instance.collection('users').doc(fireuser.uid);
//
//
//
//       return user;
//     }
//     return Scaffold(backgroundColor: Colors.black,
//       appBar: AppBar(elevation: 0,backgroundColor: Colors.black,
//
//
//       ),
//       body: Center(
//         child: StreamBuilder<Object>(
//           stream: null,
//           builder: (context, snapshot) {
//             return Column(
//                 children: [
//                   Text(fireuser.email.toString(),style:  TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)),
//
//                 ],
//             );
//           }
//         ),
//
//       ),
//
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel/notfication.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var  fireuser = FirebaseAuth.instance.currentUser!;
    var users = FirebaseFirestore.instance.collection('users').doc(fireuser.uid).snapshots();
    //  CollectionReference users = FirebaseFirestore.instance.collection('users');
    getData() async {
      final user =  await FirebaseFirestore.instance.collection('users').doc(fireuser.uid);



      return user;
    }

  return  Scaffold(backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title:  const Text('Profile',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

        elevation: 0,
        backgroundColor: Colors.blue,

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8,),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),

                      ),
                    ),
                    const SizedBox(height: 25,),

                  ]
              ),

              Padding(
                padding: const EdgeInsets.only(top: 35,left: 5,right: 8),
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: 490,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.only(
                          topRight:Radius.circular(20),
                          topLeft:Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 110),
                        child: Column(
                          children: [ Center(
                            child: StreamBuilder<Object>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return Row(
                                    children: [
                                          Text('Email :',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                      SizedBox(width: 20,),
                                      Text(fireuser.email.toString(),style:  TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black)),

                                    ],
                                  );
                                }
                            ),

                          ),
                            SizedBox(height: 20,),
                          FloatingActionButton(onPressed: () {
                              createDiscoNotification();

                            }),
                          ],
                        ),

                      ),
                    ),
                  ),
                ) ,
              ),
            ],
          ),
        ),
      )
  );
  }
}





