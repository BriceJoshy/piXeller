import 'package:flutter/material.dart';
import 'package:mini_project_1/src/constants/text_strings.dart';

import '../../models/model_on_boarding.dart';

class onBoardingPageWidget extends StatelessWidget {
  const onBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: model.height * 0.5,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 120,
              )
            ],
          ),
        ],
      ),
    );
  }
}
