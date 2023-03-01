import 'dart:developer';
import 'dart:io';

import '../../modal/url/url.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  final Rx<TextEditingController> name = TextEditingController().obs;
  final Rx<TextEditingController> email = TextEditingController().obs;
  final Rx<TextEditingController> password = TextEditingController().obs;
  final Rx<TextEditingController> cnfPassword = TextEditingController().obs;
  File? imageFile;
  String? fileName;

  signUpButtonOnTap(BuildContext context) {
    if (name.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please enter your name...!",
            );
          });
    } else if (email.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please enter email...!",
            );
          });
    } else if (password.value.text.isEmpty || cnfPassword.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Password can't be empty...!",
            );
          });
    } else if (password.value.text != cnfPassword.value.text) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Both password should be same...!",
            );
          });
      // ignore: unnecessary_null_comparison
    } else if (fileName == null) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              title: "Error",
              errorText: "Please select profile photo...!",
            );
          });
    } else {
      sendRegistrationData(context);
    }
  }


  void sendRegistrationData(context) async {
    final MainScreenController controller = Get.put(
      MainScreenController(),
    );
    var uri = Uri.parse("${ApiClass.baseUrl}${ApiClass.userRegister}");
    var request = http.MultipartRequest("POST", uri);

    request.fields["user_full_name"] = name.value.text;
    request.fields["user_email"] = email.value.text;
    request.fields["user_password"] = password.value.text;

    var file = await http.MultipartFile.fromPath("user_profile", imageFile!.path);
    request.files.add(file);

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    var apiStatus = jsonDecode(responseString)["status"];
    var errorMessage = jsonDecode(responseString)["message"];

    if (apiStatus == "Success") {
      controller.token = jsonDecode(responseString)["data"]["apiParameters"]["token"].toString();
      controller.id = jsonDecode(responseString)["data"]["apiParameters"]["id"].toString();
      controller.userID = jsonDecode(responseString)["data"]["apiParameters"]["user_id"].toString();
      NavigationRoutes().nextScreen(
        context,
        const FillDetailsScreen(),
      );
      log("TOKEN ON SIGNUP PAGE ====>  ${controller.token}");
      log("API STATUS OF SIGNUP PAGE ====>  $apiStatus");
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