import '../../modal/url/url.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 20,
              ),
              Image.asset(ConstImage.logoGreen),
              SizedBox(
                height: size.height * 0.03,
              ),
              Image.asset(ConstImage.students),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                ConstString.start,
                style: textStyleW600(
                  size.width * 0.087,
                  ConstColor.blackText,
                ),
              ),
              SizedBox(
                height: size.height * 0.032,
              ),
              CustomButton(
                onTap: () {
                  NavigationRoutes().nextScreen(context, LoginScreen());
                },
                color: ConstColor.primary,
                btnTitle: ConstString.loginBtn,
                titleColor: ConstColor.white,
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              CustomButton(
                onTap: () {
                  Get.to(() => const SignUpScreen());
                },
                color: ConstColor.black,
                btnTitle: ConstString.signUp,
                titleColor: ConstColor.white,
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              CustomButton(
                onTap: () {
                  Get.to(() => const ExploreScreen());
                },
                color: ConstColor.black,
                btnTitle: ConstString.explore,
                titleColor: ConstColor.white,
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
