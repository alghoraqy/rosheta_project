import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class MapScreen extends StatelessWidget {
  const MapScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: HexColor('022247'),
      body: const Center(
        child: Text('Map Screen',style: TextStyle(
          fontSize: 25,color: Colors.white
        ),),
      ),
    );
  }
}
