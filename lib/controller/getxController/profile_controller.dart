import '../../modal/url/url.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  RxBool isVisible = false.obs;
  String? userProfile;
  String? userName;
  String? userEmail;

  String? userAge;
  String? nationality;
  String? languages;
  String? currency;
  String? userType;
  String? dateOfBirth;

  getUserData() async {
    final MainScreenController controller = Get.put(MainScreenController());

    var parameter = {
      "apiParameters": {
        "id": controller.id,
        "admin_id": null,
        "user_id": controller.userID,
        "agent_id": null,
        "token": controller.token
      }
    };

    var response = await http.post(
      Uri.parse("${ApiClass.baseUrl}${ApiClass.getUSerDetails}"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer ${controller.token}",
      },
      body: jsonEncode(parameter),
    );
    var details = response.body;

    var apiStatus = jsonDecode(details)["status"];

    if (apiStatus == "Success") {
      userProfile = jsonDecode(details)["data"]["user_profile"].toString();
      userName = jsonDecode(details)["data"]["user_full_name"].toString();
      userEmail = jsonDecode(details)["data"]["user_email"].toString();

      userAge = jsonDecode(details)["data"]["age"].toString();
      nationality = jsonDecode(details)["data"]["nationality"].toString();
      languages = jsonDecode(details)["data"]["languages"].toString();
      currency = jsonDecode(details)["data"]["currency"].toString();
      userType = jsonDecode(details)["data"]["user_type"].toString();
      dateOfBirth = jsonDecode(details)["data"]["date_of_birth"].toString();
    }
  }
}
