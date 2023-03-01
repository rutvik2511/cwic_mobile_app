import 'dart:developer';

import '../../modal/url/url.dart';

class ChangeEmailScreen extends StatefulWidget {
   const ChangeEmailScreen({Key? key}) : super(key: key);

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final ChangeEmailController controller = Get.put(ChangeEmailController());

  final LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    controller.email.value.text = loginController.emailString;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ConstColor.white,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
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
                  onTap: () {
                    NavigationRoutes.pop(context);
                    controller.newEmail.value.clear();
                  },
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
                  ConstString.changeEmail,
                  style: textStyleW600(
                    size.width * 0.075,
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
              readOnly: true,
              size: size,
              controller: controller.email.value,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
              hint: ConstString.newEmail,
              size: size,
              controller: controller.newEmail.value,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            CustomButton(
              color: ConstColor.primary,
              btnTitle: ConstString.changeEmailBtn,
              titleColor: ConstColor.white,
              onTap: () {
                controller.changeEmail(context);
              },
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
