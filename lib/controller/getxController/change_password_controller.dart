
import '../../../modal/url/url.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController extends GetxController {
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> newPassword = TextEditingController().obs;
  Rx<TextEditingController> cnfPassword = TextEditingController().obs;

  changePasswordValidation(context) {
    if (password.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please enter your current password...!",
            );
          });
    } else if (newPassword.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please enter your new password...!",
            );
          });
    } else if (cnfPassword.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please enter confirm password...!",
            );
          });
    } else if (newPassword.value.text != cnfPassword.value.text) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Both password should be same...!",
            );
          });
    } else {
      changePassword(context);
    }
  }

  changePassword(context) async {
    final MainScreenController controller = Get.put(
      MainScreenController(),
    );

    var response = await http.post(
      Uri.parse("${ApiClass.baseUrl}${ApiClass.changePassword}"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer ${controller.token}",
      },
      body: jsonEncode({
        "password": password.value.text,
        "new_password": newPassword.value.text,
        "apiParameters": {
          "id": controller.id,
          "admin_id": null,
          "user_id": controller.userID,
          "agent_id": null,
          "token": controller.token
        }
      }),
    );
    var details = response.body;

    var apiStatus = jsonDecode(details)["status"];
    var errorMessage = jsonDecode(details)["message"];

    if (apiStatus == "Success") {
      NavigationRoutes().nextAndRemoveUntil(
        context,
        const HomeScreen(),
      );

      password.value.clear();
      newPassword.value.clear();
      cnfPassword.value.clear();
    }else{
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: errorMessage,
            );
          });

    }
  }
}
