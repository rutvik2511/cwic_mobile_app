import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../modal/url/url.dart';

class EditUserController extends GetxController {
  Rx<TextEditingController> fullName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> birthDate = TextEditingController().obs;
  Rx<TextEditingController> nationality = TextEditingController().obs;
  Rx<TextEditingController> speakLanguage = TextEditingController().obs;
  // ignore: prefer_typing_uninitialized_variables
  var selectedCity;
  Rx<TextEditingController> currency = TextEditingController().obs;

  // ignore: prefer_typing_uninitialized_variables
  var userType;
  RxBool isParent = false.obs;
  RxBool isStudent = false.obs;
  File? imageFile;
  String? fileName;

  void editUser(context) async {
    final MainScreenController controller = Get.put(MainScreenController());
    final ProfileController profileController = Get.put(ProfileController());

    if(isParent.value){
      userType = "Parent";
    }else{
      userType = "Student";
    }


    var uri = Uri.parse("${ApiClass.baseUrl}${ApiClass.editUserDetails}");
    var request = http.MultipartRequest("POST", uri);

    request.headers['Authorization'] = 'Bearer ${controller.token}';

    request.fields["user_type"] = userType;                                                      
    request.fields["user_full_name"] = fullName.value.text;
    request.fields["user_email"] = email.value.text;
    request.fields["date_of_birth"] = birthDate.value.text;
    request.fields["nationality"] = nationality.value.text;
    request.fields["languages"] = speakLanguage.value.text;
    request.fields["city_id"] = selectedCity;
    request.fields["currency"] = currency.value.text;
    request.fields["apiParameters"] = jsonEncode({
      "id": controller.id.toString(),
      "admin_id": null,
      "user_id": controller.userID.toString(),
      "agent_id": null,
      "token": controller.token
    });

    if (imageFile == null) {
      request.fields["user_profile"] = profileController.userProfile ?? "";
    } else {
      var file = await http.MultipartFile.fromPath(
          "user_profile", imageFile!.path);
      request.files.add(file);
    }

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    var apiStatus = jsonDecode(responseString)["status"];
    var errorMessage = jsonDecode(responseString)["message"];

    log(apiStatus);
    log(errorMessage);

    if (apiStatus == "Success") {
      NavigationRoutes().nextAndRemoveUntil(
        context,
        const HomeScreen(),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(title: "Error", errorText: errorMessage);
          });
    }
  }
}
