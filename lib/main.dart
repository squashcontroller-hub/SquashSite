import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:squashwebsite/app/app.bottomsheets.dart';
import 'package:squashwebsite/app/app.dialogs.dart';
import 'package:squashwebsite/app/app.locator.dart';
import 'package:squashwebsite/app/app.router.dart';
import 'package:squashwebsite/ui/common/app_colors.dart';
import 'package:squashwebsite/ui/views/auth_gate.dart';
import 'package:squashwebsite/ui/views/home/main_home_view.desktop.dart';
import 'package:squashwebsite/ui/widgets/HomePage/HomePageRou.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_animate/flutter_animate.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: "AIzaSyDXqdyJ57WCBfUiYFxjmBKDCHK0LAgS5dQ",
        authDomain: "squash-site.firebaseapp.com",
        projectId: "squash-site",
        storageBucket: "squash-site.appspot.com",
        messagingSenderId: "585016894890",
        appId: "1:585016894890:web:693628e3ac3066741af7d3",
        measurementId: "G-T5ZYCPV3M3"
    ));
  }else{
    await Firebase.initializeApp();
  }


  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (_) => MaterialApp(
        title: 'Testowa strona',
        theme: Theme.of(context).copyWith(
          primaryColor: kcBackgroundColor,
          focusColor: kcPrimaryColor,
          textTheme: GoogleFonts.openSansTextTheme().apply(
            bodyColor: Colors.white30,
          ),
        ),
        debugShowCheckedModeBanner: false,
        //home: const AuthGate(),
        home: const HomePageRou()

      ),
    ).animate().fadeIn(
      delay: const Duration(milliseconds: 50),
      duration: const Duration(milliseconds: 400),
    );
  }
}
