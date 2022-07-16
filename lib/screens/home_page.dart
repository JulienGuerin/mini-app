import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp/constants/styles.dart';
import 'package:miniapp/screens/home.dart';

import '../controllers/navbar_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final NavBarController navBarController = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.home_filled,
              size: 30,
              color: bottomBarIconColor,
            ),
            IconButton(
              iconSize: 30,
              onPressed: () {
                Get.toNamed('/settings');
              },
              icon: Icon(
                Icons.settings,
                color: bottomBarIconColor.withOpacity(.4),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/pic-image'),
        backgroundColor: Colors.white,
        tooltip: 'Add Post',
        child: const Icon(
          Icons.add,
          color: primaryColor,
          size: 30,
        ),
      ),
      body: Home(),
    );
  }
}
