import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

//import '../Models/questions.dart';

import './cat_details.dart';

import '../Widgets/cat_item.dart';

class MyCat extends StatelessWidget {
  static const routeName = "cat";
  const MyCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List cats = [
      "Admission",
      "Fees and Aid",
      "Academics",
      "Mission",
      "History",
      "Faculties",
      "Students",
      "Staff",
    ];

    List<IconData> icons = [
      LineIcons.graduationCap,
      Icons.attach_money_outlined,
      LineIcons.school,
      LineIcons.heartbeat,
      Icons.info_outline,
      LineIcons.building,
      LineIcons.userGraduate,
      LineIcons.chalkboardTeacher,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Categories"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: GridView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: cats.length,
            itemBuilder: (
              context,
              i,
            ) =>
                GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                CatDetails.routeName,
                arguments: cats[i],
              ),
              child: CatItem(
                icon: icons[i],
                text: cats[i],
              ),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
