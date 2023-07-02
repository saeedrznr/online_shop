import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_shop/gen/assets.gen.dart';
import 'package:online_shop/signup_signin.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ValueNotifier<int> counter = ValueNotifier(0);
    Timer.periodic(const Duration(milliseconds: 200),
        (timer) => counter.value = (counter.value + 1) % 4);
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 266,
          ),
          Text(
            'Hey Steve',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Wait for loading products',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 35,
          ),
          ValueListenableBuilder<int>(
              valueListenable: counter,
              builder: (context, value, child) {
                switch (value) {
                  case 0:
                    return Assets.img.icon.progress1
                        .image(width: 100, height: 100);
                  case 1:
                    return Assets.img.icon.progress2
                        .image(width: 100, height: 100);
                  case 2:
                    return Assets.img.icon.progress3
                        .image(width: 100, height: 100);
                  default:
                    return Assets.img.icon.progress4
                        .image(width: 100, height: 100);
                }
              })
        ],
      ),
    ));
  }
}
