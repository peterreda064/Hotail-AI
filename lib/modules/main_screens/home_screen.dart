import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hotel/modules/home_screens/disco_screen.dart';
import 'package:hotel/modules/home_screens/emergency_screen.dart';
import 'package:hotel/modules/home_screens/gym_screen.dart';
import 'package:hotel/modules/home_screens/lift_screen.dart';
import 'package:hotel/modules/home_screens/mosque_screen.dart';
import 'package:hotel/modules/home_screens/pool_screen.dart';
import 'package:hotel/modules/home_screens/restaurant_screen.dart';
import 'package:hotel/modules/home_screens/spa_screen.dart';
import 'package:hotel/shared/components/compantants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var userData = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: HexColor('75A3FD'),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            height: 200,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30,
                      left: 20),
                  // child: Row(
                  //   children: [
                  //     Expanded(
                  //       child: TextFormField(
                  //         validator: (value) {
                  //           if (value!.isEmpty) {
                  //             return 'email is empty';
                  //           }
                  //         },
                  //         controller: userData,
                  //         keyboardType: TextInputType.emailAddress,
                  //         onFieldSubmitted: (value) {},
                  //         onChanged: (value) {},
                  //         decoration: InputDecoration(
                  //           prefixIcon: const Icon(Icons.search),
                  //           fillColor: Colors.white,
                  //           filled: true,
                  //           hintText: 'Search',
                  //           contentPadding: const EdgeInsets.all(10),
                  //           hintStyle: const TextStyle(color: Colors.grey),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(30),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     // CircleAvatar(
                  //     //   radius: 20,
                  //     //   backgroundColor: Colors.blueGrey,
                  //     //   child: IconButton(
                  //     //     icon: const Icon(
                  //     //       Icons.notifications_none_outlined,
                  //     //       color: Colors.yellow,
                  //     //       size: 27,
                  //     //     ),
                  //     //     onPressed: () {},
                  //     //   ),
                  //     // ),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //   ],
                  // ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Hi (USER NAME),',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Where do you want to go ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 40,
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Your Destination ?',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              children: const [
                Text(
                  'Near you',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                Spacer(),
                Text(
                  'More',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  containerOfScreens(
                    image: 'assets/images/masque.jpg',
                    text: 'The Mosque',
                    tap: () {
                      NavigateTo(const MosqueScreen(), context);
                    },
                    open: '5 AM',
                    close: '7 PM'
                  ),
                  containerOfScreens(
                    image: 'assets/images/spa.jpg',
                    text: 'Spa',
                    tap: () {
                      NavigateTo(const SpaScreen(), context);
                    },
                    open: '7 AM',
                    close: '5 PM'
                  ),
                  containerOfScreens(
                    image: 'assets/images/gym.jpg',
                    text: 'Gym',
                    tap: () {
                      NavigateTo(const GymScreen(), context);
                    },
                    open: '12 AM',
                    close: '12 PM',
                  ),
                  containerOfScreens(
                    image: 'assets/images/pool.jpg',
                    text: 'Pool',
                    tap: () {
                      NavigateTo(const PoolScreen(), context);
                    },
                    open: '7 AM',
                    close: '7 PM',
                  ),
                  containerOfScreens(
                    image: 'assets/images/disco.jpg',
                    text: 'Disco',
                    tap: () {
                      NavigateTo(const DiscoScreen(), context);
                    },
                    open: '9 PM',
                    close: '3 AM'
                  ),
                  containerOfScreens(
                    image: 'assets/images/lift.jpg',
                    text: 'Lift',
                    tap: () {
                      NavigateTo(const LiftScreen(), context);
                    },
                    open: '24 H',
                    close: '24 H',
                  ),
                  containerOfScreens(
                    image: 'assets/images/restaurant.jpg',
                    text: 'Restaurant',
                    tap: () {
                      NavigateTo(const RestaurantScreen(), context);
                    },
                    open: '7 AM',
                    close: '7 PM'
                  ),
                  containerOfScreens(
                    image: 'assets/images/Emergency exit.png',
                    text: 'Emergency exit',
                    tap: () {
                      NavigateTo(const EmergencyExitScreen(), context);
                    },
                    open: '24 H',
                    close: '24 H',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}