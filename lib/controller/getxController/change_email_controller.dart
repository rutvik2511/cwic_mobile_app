import '../../modal/url/url.dart';
import 'package:http/http.dart' as http;

class ChangeEmailController extends GetxController {
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> newEmail = TextEditingController().obs;

  changeEmail(context) async {
    final MainScreenController controller = Get.put(
      MainScreenController(),
    );

    var response = await http.post(
      Uri.parse("${ApiClass.baseUrl}${ApiClass.changeEmail}"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer ${controller.token}",
      },
      body: jsonEncode({
        "old_email": controller.userEmail,
        "new_email": newEmail.value.text,
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
      newEmail.value.clear();
    } else {
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
}
