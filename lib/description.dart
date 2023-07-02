import 'package:flutter/material.dart';
import 'package:online_shop/gen/assets.gen.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/signup_signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DescriptionScreean extends StatefulWidget {
  final SharedPreferences pref;
  const DescriptionScreean({super.key, required this.pref});
  @override
  State<DescriptionScreean> createState() => _DescriptionScreeanState();
}

class _DescriptionScreeanState extends State<DescriptionScreean> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final des = descriptionList[index];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(45, 60, 45, 16),
              child: Image.asset(
                des.image_path,
                width: 250,
                height: 250,
              )),
          Text(des.title, style: theme.textTheme.titleMedium),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Text(
                des.body,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            height: 123,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              index > 0
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              width: 50,
                              height: 10,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.black54, blurRadius: 15),
                              ]),
                            )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index--;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            child: Assets.img.icon.back.image(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    )
                  : const SizedBox(
                      width: 50,
                      height: 50,
                    ),
              const SizedBox(
                width: 6,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: 50,
                        height: 10,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 15),
                        ]),
                      )),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index < 2
                            ? index++
                            : {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             SigninScreen(key: GlobalKey<NavigatorState>(),preferences: prefs!,)))
                                        ,widget.pref.setBool('first_time', false)
                              };
                      });
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Assets.img.icon.next.image(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 73,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Container(
                  width: 50,
                  height: 7,
                  color: theme.colorScheme.onPrimary
                      .withOpacity(i == index ? 1 : 0.5),
                )
            ],
          ),
          const SizedBox(
            height: 89,
          )
        ]),
      ),
    );
  }
}

List<_Description> descriptionList = [
  _Description(
      image_path: Assets.img.background.des1.path,
      title: "Search Your Products",
      body:
          "Lorem ipsum dolor sit amet. Et asperiores neque rem quisquam voluptatum eos quia omnis ex reiciendis voluptates"),
  _Description(
      image_path: Assets.img.background.des2.path,
      title: "Order Your Products",
      body:
          "Lorem ipsum dolor sit amet. Et asperiores neque rem quisquam voluptatum eos quia omnis ex reiciendis voluptates"),
  _Description(
      image_path: Assets.img.background.des3.path,
      title: "Get Delivered",
      body:
          "Lorem ipsum dolor sit amet. Et asperiores neque rem quisquam voluptatum eos quia omnis ex reiciendis voluptates")
];

class _Description {
  final String image_path;
  final String title;
  final String body;
  _Description(
      {required this.image_path, required this.title, required this.body});
}
