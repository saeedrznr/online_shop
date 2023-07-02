import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/description.dart';
import 'package:online_shop/gen/fonts.gen.dart';
import 'package:online_shop/signup_signin.dart';
import 'package:online_shop/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color onPrimary = Color(0xff4B61DC);
    const Color primary = Color(0xffF5F5F5);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              onPrimary: onPrimary,
              primary: primary),
          useMaterial3: true,
          scaffoldBackgroundColor: primary,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff217085)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))))),
                  
          textTheme: TextTheme(
            titleMedium: const TextStyle(
              color: onPrimary,
              fontFamily: FontFamily.poppins,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            titleLarge: const TextStyle(
              color: onPrimary,
              fontFamily: FontFamily.poppins,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
            bodySmall: TextStyle(
              fontFamily: FontFamily.poppins,
              fontSize: 8,
              fontWeight: FontWeight.w200,
              color: Colors.black.withOpacity(.5),
            ),
            bodyMedium: TextStyle(
              fontFamily: FontFamily.poppins,
              fontSize: 12,
              fontWeight: FontWeight.w200,
              color: Colors.black.withOpacity(.5),
            ),
            bodyLarge: const TextStyle(
              fontFamily: FontFamily.poppins,
              fontSize: 15,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
          )),
      home: MainScreen(
        preferences: prefs!,
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final SharedPreferences preferences;
   MainScreen({super.key, required this.preferences});

 final GlobalKey<NavigatorState> _screenKey = GlobalKey();
  bool snackbarIsActive = false;
  Future<bool> Function() _onWillPop(BuildContext context) {
    return () async {
      NavigatorState navigatorState = _screenKey.currentState!;
      if (!navigatorState.canPop()) {
        if(snackbarIsActive) {
          return true;
        }
        snackbarIsActive = true;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(seconds: 1),
          content: Text('press back key again to exit')
        )).closed.then((value) => snackbarIsActive = false);
        return false;
         
      }
      return true;
    };
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = DescriptionScreean(pref: preferences);
    if(preferences.getBool('first_time')!=null){
      if(preferences.getString('name')!=null){
        screen = const SplashScreen();
      }else{
        screen =  SigninScreen(preferences:preferences);
      }
    }
    return WillPopScope(
        onWillPop: _onWillPop(context),
        child: Navigator(
          key: _screenKey,
          onGenerateRoute: (settings) =>
              MaterialPageRoute(builder: (context) => screen),
        ));
  }
}

