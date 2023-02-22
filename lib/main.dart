import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_screen_loyout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/siginup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
         apiKey: "AIzaSyD7GK6Tb_H5730gRlCcArYxSYOg862GBrc",
         appId: "1:638657037864:web:83b34c2e2426950787171d", 
         messagingSenderId: "638657037864", 
         projectId: "instagram-clone-13760",
         storageBucket: "instagram-clone-13760.appspot.com"
      )
    );
  }else{
    await Firebase.initializeApp();
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home:  StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              return const ResponsvieLayout(
                mobileScreenLayout: MobileScreenLayout(),
                 webScreenLayout: WebScreenLayout(),
              );
            }else if(snapshot.hasError){
              return Center(child: Text('Some error occure'),);
            }
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
        },
      )//ResponsvieLayout(mobileScreenLayout: MobileScreenLayout(), webScreenLayout: WebScreenLayout(),)
    );
  }
}
