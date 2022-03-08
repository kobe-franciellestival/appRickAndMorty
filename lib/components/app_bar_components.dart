import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';

PreferredSizeWidget appBarComponent(BuildContext context,
    {bool isSecondPage = false}) {
  Icon customIcon = const Icon(Icons.search);

  return AppBar(
    toolbarHeight: 135,
    backgroundColor: AppColors.appBarColor,
    //After
    leading: Container(),
    //After 2 Page
    //starting the implementation of the search bar
    actions: [
      IconButton(
        onPressed: () {
          if (customIcon.icon == Icons.search) {
            customIcon = const Icon(Icons.cancel);
          } else {
            customIcon = const Icon(Icons.search);
          }
        },
        icon: const Icon(Icons.search),
      )
    ],
    flexibleSpace: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 15,
          left: 15,
          top: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                isSecondPage ? Icons.arrow_back : Icons.person,
                color: AppColors.white,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "RICK AND MORTY APP",
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.menu,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}
