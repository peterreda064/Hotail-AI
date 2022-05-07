// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:hotel/modules/on_boarding_screen4.dart';


// void main()async {WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white
//       ),
//       debugShowCheckedModeBanner: false,
//       home: HotelOnBoarding(),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel/layout/home_layout.dart';
import 'package:hotel/modules/on_boarding_screen4.dart';
import 'package:push_notification/push_notification.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';
import 'modules/main_screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  late Notificator notification;

  String notificationKey = 'key';
  String _bodyText = 'notification test';
  WifiInfoWrapper? _wifiObject;




  @override
  void initState() {
    super.initState();
    initPlatformState();
    setState(() {
      for(int i =0 ;i<10000;i++){


        String iprouter = _wifiObject != null ? _wifiObject!.routerIp : 'iprouter unknown';
        String dbm1 = _wifiObject != null ? _wifiObject!.signalStrength.toString() : 'dbm unknown';
        if (dbm1 == '8' ||
            dbm1 == '9') {
          notification.show(
            1,
            'مرحبا بك ',
            'انت الان بالقرب من الديسكو',
            imageUrl: 'https://elmwoodmanor.net/wp-content/uploads/2018/01/dj-dance-party.jpg',
            data: {notificationKey: '[notification data]',
              _bodyText: 'يفتح الساعة 12 ويغلق الساعة 1 لتفاصيل اضغط هنا'
            },
            notificationSpecifics: NotificationSpecifics(
              AndroidNotificationSpecifics(
                autoCancelable: true,
              ),
            ),
          );
          const Icon(
            Icons.notifications,
            color: Colors.white,);
        }



        if (dbm1 == '7' && iprouter == '192.168.1.1' ) {
          notification.show(
            2,
            'مرحبا بك ',
            'انت الان بالقرب من  حمام السباحة',
            imageUrl: 'https://elmwoodmanor.net/wp-content/uploads/2018/01/dj-dance-party.jpg',
            data: {notificationKey: '[notification data]',
              _bodyText: 'يفتح الساعة 12 ويغلق الساعة 1 لتفاصيل اضغط هنا'
            },
            notificationSpecifics: NotificationSpecifics(
              AndroidNotificationSpecifics(
                autoCancelable: true,
              ),
            ),
          );
          const Icon(
            Icons.notifications,
            color: Colors.white,);
        }


        if (dbm1 == '7' && iprouter == '191.265.1.1' ) {
          notification.show(
            3,
            'مرحبا بك ',
            'انت الان بالقرب من  المطعم ',
            imageUrl: 'https://elmwoodmanor.net/wp-content/uploads/2018/01/dj-dance-party.jpg',
            data: {notificationKey: '[notification data]',

              _bodyText: 'يفتح الساعة 12 ويغلق الساعة 1 لتفاصيل اضغط هنا'

            },
            notificationSpecifics: NotificationSpecifics(
              AndroidNotificationSpecifics(
                autoCancelable: true,
                icon: 'notifications',

              ),
            ),
          );
          const Icon(
            Icons.notifications,
            color: Colors.white,);
        }

      }


    });

    notification = Notificator(
      onPermissionDecline: () {
        // ignore: avoid_print
        print('permission decline');

      },
      onNotificationTapCallback: (notificationData) {
        setState(
              () {
            _bodyText = 'notification open: '
                '${notificationData[notificationKey].toString()}';
          },
        );
      },
    )..requestPermissions(
      requestSoundPermission: true,
      requestAlertPermission: true,
    );
  }





  Future<void> initPlatformState() async {
    WifiInfoWrapper? wifiObject;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      wifiObject = await WifiInfoPlugin.wifiDetails;
    } on PlatformException {

      WifiInfoPlugin.wifiDetails.asStream();
      String dbm1 = _wifiObject != null ? _wifiObject!.signalStrength.toString() : 'unknown';
      print(dbm1);
    }
    if (!mounted) return;

    setState(() {
      wifiObject = _wifiObject;
    });
  }
}

