import 'package:awesome_notifications/awesome_notifications.dart';

void createDiscoNotification() async {
  await AwesomeNotifications().createNotification(

    actionButtons: [

      NotificationActionButton(

        key: 'لتفاصيل اضغط هنا',
        label: 'لتفاصيل اضغط هنا',
      )

    ],

    content: NotificationContent(
      id: 1,
      channelKey: 'basic_channel',
      title:
      ' مرحبا بك ',
      body: 'انت الان بالقرب من الديسكو  يفتح الساعة 12 ويغلق الساعة 1 ',
      bigPicture: 'asset://assets/images/disco.png',

      notificationLayout: NotificationLayout.BigPicture,


    ),
  );
}


void createSpaNotification() async {
  await AwesomeNotifications().createNotification(
    actionButtons: [

      NotificationActionButton(
        key: 'لتفاصيل اضغط هنا',
        label: 'لتفاصيل اضغط هنا',
      )

    ],
    content: NotificationContent(
      id: 2,
      channelKey: 'basic_channel',
      title:
      '${Emojis.flag_egypt+ Emojis.sport_diving_mask} مرحبا بك ',
      body: 'انت الان بالقرب من مركز المساج يفتح الساعة 10 ويغلق الساعة  صباحا 1 ',
      bigPicture: 'asset://assets/images/spa.png',

      notificationLayout: NotificationLayout.BigPicture,

    ),
  );
}


void createGymNotification() async {
  await AwesomeNotifications().createNotification(
    actionButtons: [

      NotificationActionButton(
        key: 'لتفاصيل اضغط هنا',
        label: 'لتفاصيل اضغط هنا',
      )

    ],
    content: NotificationContent(
      id: 3,
      channelKey: 'basic_channel',
      title:
      '${Emojis.flag_egypt+ Emojis.sport_diving_mask} مرحبا بك ',
      body: 'انت الان بالقرب من gym  يفتح الساعة24 ساعة ',
      bigPicture: 'asset://assets/images/gym.png',

      notificationLayout: NotificationLayout.BigPicture,

    ),
  );
}