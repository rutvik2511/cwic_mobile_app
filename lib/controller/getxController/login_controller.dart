import '../../modal/url/url.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final Rx<TextEditingController> email = TextEditingController().obs;
  final Rx<TextEditingController> password = TextEditingController().obs;
  late var emailString = email.value.text;

  void sendLoginData(context) async {
    final MainScreenController controller = Get.put(MainScreenController());
    var parameter = {
      "email": email.value.text,
      "password": password.value.text,
    };

    var response = await http.post(
      Uri.parse("${ApiClass.baseUrl}${ApiClass.userLogin}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(parameter),
    );

    var details = response.body;
    // log("RESPONSE  = ${response.body}");

    var apiStatus = jsonDecode(details)["status"];
    var errorMessage = jsonDecode(details)["message"];

    if (apiStatus == "Success") {
      controller.id = jsonDecode(details)["data"]["apiParameters"]["id"].toString();
      controller.userEmail = jsonDecode(details)["data"]["user_email"].toString();
      controller.userID = jsonDecode(details)["data"]["apiParameters"]["user_id"].toString();
      controller.token = jsonDecode(details)["data"]["apiParameters"]["token"].toString();

      NavigationRoutes().nextScreenCloseOthers(context, const HomeScreen());

      email.value.clear();
      password.value.clear();

    } else {
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
