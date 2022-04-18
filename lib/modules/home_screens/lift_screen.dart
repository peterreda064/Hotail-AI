import 'package:flutter/cupertino.dart';
import 'package:hotel/shared/components/compantants.dart';

class LiftScreen extends StatelessWidget {
  const LiftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return homeScreens(
      padding: 70,
      text: 'Lift',
      image: 'assets/images/lift.jpg',
      description: 'A mosque , also called masjid, is a place of worship for Muslims. Any act of worship that follows the Islamic rules of prayer can be said to create a mosque, whether or not it takes place in a special building. Informal and open-air places of worship are called musalla',
    );
  }
}