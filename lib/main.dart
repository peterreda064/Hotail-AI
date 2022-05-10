import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel/modules/on_boarding_screen4.dart';
import 'dart:async';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';
import 'dart:io';
import 'modules/home_screens/disco_screen.dart';
import 'notfication.dart';


void main()async {WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(const MyApp());

AwesomeNotifications().initialize(null,

  [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic Notifications',
      defaultColor: Colors.teal,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
  ],

);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {


  WifiInfoWrapper? wifiObject;

  // var stream = Stream<int>.periodic(Duration(seconds: 2),);
  //
  // late StreamSubscription<int> data = stream.listen((int i) {
  //   int dbm1;
  //   dbm1 = wifiObject!.signalStrength;
  //   print(dbm1);
  //   if (i >= x) {
  //     data.cancel();
  //   }
  // });
  // double x = 40;


  // int sing = 0;


  @override
  void initState() {

    AwesomeNotifications().actionStream.listen((notification) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => DiscoScreen() ,
          ),
              (route) => route.isFirst);
    });


    // _sub = _myStream.listen((dbm1) {
    //   setState(() {
    //     sing= dbm1;
    //
    //
    //   });
    // });
    // setState(() {
    //
    //
    //
    //   for (var i = 0; i <= 100; i++) {
    //     int dbm1 = wifiObject!.signalStrength;
    //
    //     createDiscoNotification();
    //   }
    // });
    // for (var i = 0; i <= 100; i++) {
    //   int dbm1 = wifiObject!.signalStrength;
    //
    //
    //   if (dbm1 == 8 || dbm1 == 9) {
    //     createDiscoNotification();
    //
    //   }
    //   if (dbm1 == 4 ) {
    //     createSpaNotification();
    //
    //   }
    //   if (dbm1 == 1 ) {
    //     createGymNotification;
    //
    //   }
    //
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

          scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: HotelOnBoarding(),

    );
  }


  Future<void> initPlatformState() async {
    WifiInfoWrapper? wifiObject;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      wifiObject = await WifiInfoPlugin.wifiDetails;
    } on PlatformException {
      WifiInfoPlugin.wifiDetails.asStream();
      String dbm = wifiObject != null
          ? wifiObject.signalStrength.toString()
          : 'unknown';
      print(dbm);
    }
    if (!mounted) return;

    setState(() {
      wifiObject = wifiObject;
    });
  }
}