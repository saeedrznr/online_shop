import 'package:flutter/material.dart';
import 'package:online_shop/api.dart';
import 'package:online_shop/gen/assets.gen.dart';
import 'package:online_shop/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class SigninScreen extends StatelessWidget {
  final SharedPreferences preferences;
  const SigninScreen({super.key, required this.preferences});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final emailController = TextEditingController();
    final passController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 114,
          ),
          Text("Hello Again!", style: theme.textTheme.titleLarge),
          Text(
            "Welcome Back You’ve Been Missed",
            style: theme.textTheme.bodyMedium,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 29, 20, 30),
              child: TextField(
                  controller: emailController,
                  cursorColor: theme.colorScheme.onPrimary,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: theme.colorScheme.onPrimary),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    prefixIcon: const Icon(Icons.email),
                    label: const Text("Enter email Id"),
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 11),
              child: TextField(
                  controller: passController,
                  cursorColor: theme.colorScheme.onPrimary,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: theme.colorScheme.onPrimary),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    prefixIcon: const Icon(Icons.lock),
                    label: const Text("Enter password"),
                  ))),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(right: 9, bottom: 37),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "forgot password ?",
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontSize: 10, color: Colors.black),
                )),
          ),
          SizedBox(
              width: 350,
              height: 40,
              child: ElevatedButton(
                  onPressed: () async {
                    final (status, user) = await UserApi.signIn(
                        emailController.text,
                        encryptPassword(passController.text));
                    if (!context.mounted) return;
                    if (status == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Fail in access to server'),
                        duration: Duration(seconds: 1),
                      ));
                    } else if (user == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(status),
                        duration: const Duration(seconds: 1),
                      ));
                    } else {
                      preferences.setString('name', user.name);
                      preferences.setString('email', user.email);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Signed in successfully'),
                        duration: Duration(seconds: 1),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()));
                    }
                  },
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign in",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.arrow_forward,
                        )
                      ]))),
          const SizedBox(
            height: 21,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 2,
              width: 103,
              color: Colors.black.withOpacity(0.5),
            ),
            Text(
              'Continue with',
              style: theme.textTheme.titleSmall!.copyWith(fontSize: 10),
            ),
            Container(
              height: 2,
              width: 103,
              color: Colors.black.withOpacity(0.5),
            ),
            const SizedBox(
              width: 10,
            )
          ]),
          const SizedBox(
            height: 39,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5)),
                child: Assets.img.icon.google.image(width: 20, height: 20),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5)),
                child: Assets.img.icon.apple.image(width: 20, height: 20),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5)),
                child: Assets.img.icon.facebook.image(width: 20, height: 20),
              ),
              const SizedBox()
            ],
          ),
          const SizedBox(height: 19),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignupScreen(
                            preferences: preferences,
                          )));
            },
            child: Text('Create an Account',
                style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 10,
                    color: theme.colorScheme.onPrimary,
                    decoration: TextDecoration.underline)),
          )
        ]),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  final SharedPreferences preferences;
  const SignupScreen({super.key, required this.preferences});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 114,
          ),
          Text("Register", style: theme.textTheme.titleLarge),
          Text(
            "Sign up to get started!",
            style: theme.textTheme.bodyMedium,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 29, 20, 0),
              child: TextField(
                  controller: nameController,
                  cursorColor: theme.colorScheme.onPrimary,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: theme.colorScheme.onPrimary),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    prefixIcon: const Icon(Icons.person),
                    label: const Text("Enter Name"),
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 29, 20, 30),
              child: TextField(
                  controller: emailController,
                  cursorColor: theme.colorScheme.onPrimary,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: theme.colorScheme.onPrimary),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    prefixIcon: const Icon(Icons.email),
                    label: const Text("Enter email Id"),
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 11),
              child: TextField(
                  controller: passController,
                  cursorColor: theme.colorScheme.onPrimary,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: theme.colorScheme.onPrimary),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    prefixIcon: const Icon(Icons.lock),
                    label: const Text("Enter password"),
                  ))),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(right: 9, bottom: 37),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "forgot password ?",
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontSize: 10, color: Colors.black),
                )),
          ),
          SizedBox(
              width: 350,
              height: 40,
              child: ElevatedButton(
                  onPressed: () async {
                    final (conn, user) = await UserApi.signUp(
                        nameController.text,
                        emailController.text,
                        encryptPassword(passController.text));
                    if (!context.mounted) return;
                    if (!conn) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Fail in access to server'),
                        duration: Duration(seconds: 1),
                      ));
                    } else if (user == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Email address exists'),
                        duration: Duration(seconds: 1),
                      ));
                    } else {
                      preferences.setString('name', user.name);
                      preferences.setString('email', user.email);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Signed up successfully'),
                        duration: Duration(seconds: 1),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()));
                    }
                  },
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign up",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.arrow_forward,
                        )
                      ]))),
          const SizedBox(
            height: 21,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 2,
              width: 103,
              color: Colors.black.withOpacity(0.5),
            ),
            Text(
              'Continiue with',
              style: theme.textTheme.titleSmall!.copyWith(fontSize: 10),
            ),
            Container(
              height: 2,
              width: 103,
              color: Colors.black.withOpacity(0.5),
            ),
            const SizedBox(
              width: 10,
            )
          ]),
          const SizedBox(
            height: 39,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5)),
                child: Assets.img.icon.google.image(width: 20, height: 20),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5)),
                child: Assets.img.icon.apple.image(width: 20, height: 20),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5)),
                child: Assets.img.icon.facebook.image(width: 20, height: 20),
              ),
              const SizedBox()
            ],
          ),
          const SizedBox(height: 19),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => SigninScreen(
                            preferences: preferences,
                          )));
            },
            child: Text('I have an Account',
                style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 10,
                    color: theme.colorScheme.onPrimary,
                    decoration: TextDecoration.underline)),
          )
        ]),
      ),
    );
  }
}

String encryptPassword(String pass) {
  final bytes = utf8.encode(pass);
  final hash = sha256.convert(bytes);
  return hash.toString();
}
