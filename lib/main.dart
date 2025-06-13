import 'package:core_module/core/app/app_dimens.dart';
import 'package:core_module/core/app/app_style.dart';
import 'package:core_module/core/app/app_theme.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/snippets/places_search/places_picker_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:core_module_package/login_screen.dart';
import 'package:flutter/material.dart';

import 'new_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));
  await  CoreModule().init(
    envPath: 'assets/data/env.json',
    homePageScreen: 'NewScreen',
    loginScreen: 'LoginScreen',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   appDimen = AppDimens(context);

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      //darkTheme: darkMode,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/LoginScreen', page: ()=> LoginScreen()),
        GetPage(name: '/NewScreen', page: ()=> NewScreen()),
      ],
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // PlacesPickerWidget.searchPlaces(
    //   onSearch: (onSearch) {
    //     print("Place: $onSearch");
    //   },
    //   context: context,
    // );
    String counter = config.fetchData(key: "appStoreLink");
    final counter2 = config.getAppStoreId();
    print("PRINT --> $counter2 ---> $counter");

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding:  EdgeInsets.all(20.dp()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Text(
                "counter counts here",
                style: labelSmallTextLightModeStyle,
              ),
              ShimmerWidget(
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              ButtonWidget.withOutLine(
                text: 'Click Here ',
                asset: icApple,
                onTap: () {
                  navUtils.fireTargetHome();
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
