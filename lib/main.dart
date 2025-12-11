import 'package:core_module/core/app/app_dimens.dart';
import 'package:core_module/core/app/app_style.dart';
import 'package:core_module/core/app/app_theme.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/dictionary_model.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/snippets/places_search/places_picker_widget.dart';
import 'package:core_module/core_ui/widgets/button_switch_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
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
  final RxList<DictionaryModel> _items = <DictionaryModel>[
    DictionaryModel(key: "key1", value: "value1"),
    DictionaryModel(key: "key2", value: "value2", selected: true),
    DictionaryModel(key: "key3", value: "value3"),
    DictionaryModel(key: "key4", value: "value4"),
  ].obs;

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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: EdgeInsets.all(20.dp()),
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
              ),
              SizedBox(height: 20.dp()),
              ButtonSwitchWidget(
                items: _items,
                onTap: (model) {
                  print("model --> ${model.value}");
                },
              ),
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
