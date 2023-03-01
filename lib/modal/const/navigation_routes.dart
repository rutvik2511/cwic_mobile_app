import '../url/url.dart';

class NavigationRoutes {
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void popWithData(BuildContext context, data) {
    Navigator.pop(context, data);
  }

  static void dismissAlert(context) {
    Navigator.pop(context);
  }

  void nextScreen(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  //payment success
  void nextScreenCloseOthers(context, page) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  //The difference is only in the animation flutter executes.

  // pushReplacementNamed -->> "enter animation"
  //popAndPushNamed -->> "exit animation"

  void nextScreenReplaceNamed(context, page) {
    Navigator.pushReplacementNamed(context, page);
  }

  void nextScreenReplace(context, page) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  void nextAndRemoveUntil(context, page) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  void nextScreenCallback(
      context, page, Function(String result) handler) async {
    final result =
        await Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) => page,
    ));
    handler(result);
  }
}
