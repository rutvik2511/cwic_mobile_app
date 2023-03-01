import '../url/url.dart';

class ProgressDialog {
  show(BuildContext context) {
    List<Color> loadingColors = [
      ConstColor.primary,
      ConstColor.white,
      ConstColor.primary,
      ConstColor.white,
      ConstColor.primary,
      ConstColor.white,
      ConstColor.primary,
      ConstColor.white,
    ];
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.18),
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  colors: loadingColors,
                  strokeWidth: 2,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void hide(BuildContext context) {
    Navigator.of(context).pop(false);
  }
}
