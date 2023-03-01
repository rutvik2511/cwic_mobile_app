import 'dart:developer';

import '../../modal/url/url.dart';
import 'package:http/http.dart' as http;

class FillDetailsController extends GetxController {
  Rx<TextEditingController> birthDate = TextEditingController().obs;
  Rx<TextEditingController> nationality = TextEditingController().obs;
  Rx<TextEditingController> speakLanguage = TextEditingController().obs;
  Rx<TextEditingController> interestedCity = TextEditingController().obs;
  Rx<TextEditingController> currency = TextEditingController().obs;
  // ignore: prefer_typing_uninitialized_variables
  var userType;
  // ignore: prefer_typing_uninitialized_variables
  var selectedCity;

  RxBool isParent = false.obs;
  RxBool isStudent = false.obs;


  fillDetailsValidation(BuildContext context) async {
    if (birthDate.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please enter your date of birth...!",
            );
          });
    } else if (nationality.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please enter your nationality...!",
            );
          });
    } else if (speakLanguage.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please enter languages do you speak...!",
            );
          });
    } else if (interestedCity.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please enter your interested city...!",
            );
          });
    } else if (currency.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please enter currency...!",
            );
          });
    } else if (isParent.value == false && isStudent.value == false) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please select your user type...!",
            );
          });
    } else {
      sendFillDetailsData(context);
    }
  }

  void sendFillDetailsData(context) async {
    final MainScreenController controller = Get.put(MainScreenController());

    if (isParent.value) {
      userType = "Parent";
    } else {
      userType = "Student";
    }

    var parameter = {
      "user_type": "$userType",
      "date_of_birth": birthDate.value.text,
      "nationality": nationality.value.text,
      "languages": speakLanguage.value.text,
      "currency": currency.value.text,
      "city_id": selectedCity,
      "apiParameters": {
        "id": controller.id,
        "admin_id": null,
        "user_id": controller.userID,
        "agent_id": null,
        "token": controller.token
      }
    };

    var response = await http.post(
      Uri.parse("${ApiClass.baseUrl}${ApiClass.userFillDetails}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer ${controller.token}",
      },
      body: jsonEncode(parameter),
    );

    var details = response.body;
    var apiStatus = jsonDecode(details)["status"];
    var errorMessage = jsonDecode(details)["message"];

    if (apiStatus == "Success") {
      NavigationRoutes().nextScreenCloseOthers(
        context,
        const HomeScreen(),
      );
      log("API STATUS OF FILL DETAILS API ====>  $apiStatus}");
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
      // log("${controller.token}");
    }
  }
}
