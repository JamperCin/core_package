import 'package:flutter/material.dart';

abstract class BaseScreen extends StatelessWidget {
  ///Set the app bar title of the page, If no appbar is specified,
  ///a default app bar is used
  String appBarTitle();
  Widget? appBarTitleWidget(BuildContext context);
  Widget? appBarLeadingIcon(BuildContext context);
  late TextTheme textTheme;
  late ColorScheme colorScheme;
  ///Set the elevation of the appBar. The default elevation is == 10
  double appBarElevation();
  double appBarHeight();

  /// Defines the color, opacity, and size of icons.
  ///
  /// Used by [IconTheme] to control the color, opacity, and size of icons in a
  /// widget subtree.
  ///
  /// To obtain the current icon theme, use [IconTheme.of]. To convert an icon
  /// theme to a version with all the fields filled in, use [new
  /// IconThemeData.fallback].
  // IconThemeData iconThemeData();

  /// {@template flutter.material.appbar.actions}
  /// A list of Widgets to display in a row after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  /// For less common operations, consider using a [PopupMenuButton] as the
  /// last action.
  ///
  /// The [actions] become the trailing component of the [NavigationToolbar] built
  /// by this widget. The height of each action is constrained to be no bigger
  /// than the [toolbarHeight].
  /// {@endtemplate}
  List<Widget> actions();

  Widget body(BuildContext context);
  Widget bottomSheet(BuildContext context);

  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Snack bars slide from underneath the bottom navigation bar while bottom
  /// sheets are stacked on top.
  Widget bottomNavigationBar(BuildContext context);

  /// An app bar to display at the top of the scaffold.
  PreferredSizeWidget appBar(BuildContext context);

  ///An Icon that is set to the far right hand corner of the app bar
  IconData icon();

  void dismissKeyBoard(BuildContext context);
  Color backgroundColor(BuildContext context);
  Color appBarBackgroundColor(BuildContext context);
  Color appBarTitleColor(BuildContext context);
  void setContext(BuildContext context);
  bool showAppBar();
  bool safeArea();
  bool shouldDismissKeyboard();
  Widget floatingActionButton(BuildContext context);
  Widget? drawer(BuildContext context);
  FloatingActionButtonLocation actionButtonLocation();

  /// Describes the part of the user interface represented by this widget.
  ///
  /// The framework calls this method when this widget is inserted into the tree
  /// in a given [BuildContext] and when the dependencies of this widget change
  /// (e.g., an [InheritedWidget] referenced by this widget changes). This
  /// method can potentially be called in every frame and should not have any side
  /// effects beyond building a widget.
  @override
  Widget build(BuildContext context) {
    setContext(context);
    textTheme = Theme.of(context).textTheme;
    colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: showAppBar() ? appBar(context) : null,
      backgroundColor: backgroundColor(context),
      drawer: drawer(context),
      floatingActionButton: floatingActionButton(context),
      floatingActionButtonLocation: actionButtonLocation(),
      body: GestureDetector(
        child: safeArea() ? SafeArea(child: body(context)) : body(context),
        onTap: () {
          if (shouldDismissKeyboard()) {
            dismissKeyBoard(context);
          }
        },
      ),
      bottomNavigationBar: bottomNavigationBar(context),
      bottomSheet: bottomSheet(context),
    );
  }
}
