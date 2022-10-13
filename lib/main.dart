import 'package:custom_bar_footter/customShape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'splash_page.dart';
import 'modules/auth/auth_modules.dart';
import 'modules/profile/profile_modules.dart';

void main() {
  Modular.to.addListener(() {
    print(Modular.to.path);
  });
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: 'My Smart App',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}

class AppModule extends Module {
  @override  List<Bind> get binds => [];
  @override  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => SplashPage()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/profile', module: ProfileModule())
  ];
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Image.asset('assets/images/demo/actions.png',
              width: 50,)
          ],
          leading: Image.asset('assets/images/demo/leading.png', width: 10,),
          toolbarHeight: 110,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: CustomShape(),
            child: Container(
              color: Colors.red,
              child: Center(
                child:
                Text("My App"),
              ) ,
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: mediaSize.width,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(mediaSize.width, 90),
                      painter: BNBCustomPainter(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class BNBCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red..style = PaintingStyle.fill;
    Path path = Path();//..moveTo(0, 20);
    path.quadraticBezierTo(size.width/2, -(size.height - 50), size.width , 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}