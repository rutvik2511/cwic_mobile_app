import '../../modal/url/url.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FirstScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ConstColor.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.06,
              child: Image.asset(
                ConstImage.logo,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: size.height * 0.045,
            ),
            Text(
              ConstString.kwic,
              style: textStyleRegular(
                size.width * 0.07,
                ConstColor.white
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              ConstString.living,
              style: textStyleRegular(
                  size.width * 0.05,
                  ConstColor.white.withOpacity(0.6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
