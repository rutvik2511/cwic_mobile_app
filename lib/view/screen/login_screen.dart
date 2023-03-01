import '../../modal/url/url.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(
    LoginController(),
  );

  LoginScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: ConstColor.white,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.045,
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 15,
            ),
            Row(
              children: [
                CustomBackButton(
                  color: true,
                  onTap: () {},
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Image.asset(ConstImage.logoGreen),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.045,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ConstString.login,
                  style: textStyleW600(
                    size.width * 0.065,
                    ConstColor.primary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.045,
            ),
            CustomTextField(
              hint: ConstString.email,
              size: size,
              controller: controller.email.value,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
              isIcon: true,
              obscure: true,
              hint: ConstString.password,
              size: size,
              controller: controller.password.value,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const ForgotPasswordScreen(),
                    );
                  },
                  child: Text(
                    ConstString.forgotPasswordBtn,
                    style: textStyleW600(
                      size.width * 0.04,
                      ConstColor.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            CustomButton(
              color: ConstColor.primary,
              btnTitle: ConstString.loginBtn,
              titleColor: ConstColor.white,
              onTap: () {
                // ProgressDialog().show(context,'');
                controller.sendLoginData(context);
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButton(
              color: ConstColor.black,
              btnTitle: ConstString.noAccount,
              titleColor: ConstColor.white,
              onTap: () {
                Get.to(() => const SignUpScreen());
              },
            ),
            Expanded(
              child: Container(),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.07,
              child: Image.asset(
                ConstImage.cwicMenu,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
