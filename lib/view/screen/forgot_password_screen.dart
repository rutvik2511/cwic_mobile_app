
import '../../modal/url/url.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());

  forgotPassword() async {
    var response = await http.post(
      Uri.parse("${ApiClass.baseUrl}${ApiClass.forgotPassword}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"email": controller.email.value.text}),
    );

    var details = response.body;
    var apiStatus = jsonDecode(details)["status"];
    var errorMessage = jsonDecode(details)["message"];

    if (apiStatus == "Success") {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            title: "Success",
            errorText: errorMessage,
          );
        },
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            title: "Error",
            errorText: errorMessage,
          );
        },
      );
    }
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
                  ConstString.forgotPassword,
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
              size: size,
              controller: controller.email.value,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            CustomButton(
              color: ConstColor.primary,
              btnTitle: ConstString.sendResetLink,
              titleColor: ConstColor.white,
              onTap: () {
                forgotPassword();
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
