import '../../modal/url/url.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: ConstColor.redError,
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      title: ConstString.title,
      home: const SplashScreen(),
    );
  }
}
