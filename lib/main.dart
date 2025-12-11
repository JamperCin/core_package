import 'package:core_module/core_module.dart';
import 'package:core_module_package/login_screen.dart';
import 'package:core_module_package/res/app_theme.dart';
import 'package:core_module_package/res/res_path.dart';
import 'package:flutter/material.dart';

import 'new_screen.dart';

RxBool isDarkMode = false.obs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));
  await CoreModule().init(
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
    appDimen = AppDimens(context, constantMultiplier: 1.75);

    return Obx(
      ()=> GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: isDarkMode.value ? darkMode : lightMode,
       // darkTheme: darkMode,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/LoginScreen', page: () => LoginScreen()),
          GetPage(name: '/NewScreen', page: () => NewScreen()),
        ],
        home: NewScreen(),
      ),
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
    // setState(() {
    //   _counter++;
    //  Get.to(()=> NewScreen());
    // });
    navUtils.fireTarget(NewScreen(), model: "New Screen");
  }

  RxBool isLoadingMore = false.obs;
  List<BottomBarModel> bottomBarItems = [
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
    BottomBarModel(text: 'Hello Im here', asset: icApple),
  ];

  Future<List<BottomBarModel>> _loadMore() async {
    await Future.delayed(const Duration(seconds: 2));
    List<BottomBarModel> bottomBarItems = [
      BottomBarModel(text: 'Hello Im new in here - 1', asset: icSuccess),
      BottomBarModel(text: 'Hello Im new in here - 2', asset: icSuccess),
      BottomBarModel(text: 'Hello Im new in here - 3', asset: icSuccess),
      BottomBarModel(text: 'Hello Im new in here - 4', asset: icSuccess),
      BottomBarModel(text: 'Hello Im new in here - 5', asset: icSuccess),
    ];
    return bottomBarItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TabBarWidget(
            tabs: const [
              Tab(text: "Available Books"),

              Tab(text: "Purchased Books"),
            ],
            onTap: (index) {
              isLoadingMore.value = index == 0;
            },
          ),
          Expanded(
            child: Obx(
              () => isLoadingMore.value
                  ? ListViewWidget<BottomBarModel>(
                      list: bottomBarItems,
                      onLoadMore: _loadMore,
                      listItemWidget: (item) {
                        return Column(
                          children: [
                            Text(item.text ?? ''),
                            Gap(20.dp()),
                            AssetImageWidget(
                              asset: item.asset ?? '',
                              height: 40.dp(),
                              width: 40.dp(),
                            )
                          ],
                        );
                      },
                    )
                  : ListViewWidget<BottomBarModel>.withGridView(
                      list: bottomBarItems,
                      onLoadMore: _loadMore,
                      listItemWidget: (item) {
                        return Column(
                          children: [
                            Text(item.text ?? ''),
                            Gap(20.dp()),
                            AssetImageWidget(
                              asset: item.asset ?? '',
                              height: 40.dp(),
                              width: 40.dp(),
                            )
                          ],
                        );
                      },

                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
