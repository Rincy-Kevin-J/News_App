import 'package:flutter/cupertino.dart';
import 'package:news_app/controller/splash_controller.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>SplashScreenProvider(),)
      ],
    );
  }
  
}