import '../../modal/url/url.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final ChangePasswordController controller = Get.put(
    ChangePasswordController(),
  );

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
                    controller.password.value.clear();
                    controller.newPassword.value.clear();
                    controller.cnfPassword.value.clear();
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
                  ConstString.changePassword,
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
              isIcon: true,
              obscure: true,
              hint: ConstString.password,
              size: size,
              controller: controller.password.value,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
              isIcon: true,
              obscure: true,
              hint: ConstString.newPassword,
              size: size,
              controller: controller.newPassword.value,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
              isIcon: true,
              obscure: true,
              hint: ConstString.cnfPassword,
              size: size,
              controller: controller.cnfPassword.value,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            CustomButton(
              color: ConstColor.primary,
              btnTitle: ConstString.changePasswordBtn,
              titleColor: ConstColor.white,
              onTap: () {
                controller.changePasswordValidation(context);
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
