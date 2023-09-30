import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenil_chandarana_demo2/screens/home/view/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: "/", page: () => const HomeScreen(),)
        ],
      ),
    ),
  );
}
