import 'package:flutter/material.dart';

import '../Models/question.dart';
import '../Models/questions.dart';

import './response.dart';

import '../Widgets/questioncard.dart';

class CatDetails extends StatelessWidget {
  static const routeName = "single_cat";
  const CatDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Question> filterList = [];
    List<Question> data = sample;
    var catName = ModalRoute.of(context)!.settings.arguments as String;

    filterList = data.where((item) => item.category == catName).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(catName),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.separated(
          itemBuilder: ((context, index) => GestureDetector(
                onTap: (() => Navigator.of(context).pushNamed(
                    Response.routeName,
                    arguments: filterList[index])),
                child: QuestionCard(text: filterList[index].title),
              )),
          separatorBuilder: (context, _) => const Divider(),
          itemCount: filterList.length,
        ),
      ),
    );
  }
}
