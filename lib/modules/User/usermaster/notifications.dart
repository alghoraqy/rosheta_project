import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Shared/Components/components.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backappbar(context, title: 'Notifications'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Column(
          children: [
            successbox(context),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            failedbox(context),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            importantbox(context)
          ],
        ),
      ),
    );
  }
}
