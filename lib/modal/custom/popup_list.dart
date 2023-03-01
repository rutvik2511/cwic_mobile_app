import 'dart:developer';

import '../../modal/url/url.dart';
import 'package:http/http.dart' as http;

class PopUpList extends StatelessWidget {
  final Size size;

  PopUpList({Key? key, required this.size}) : super(key: key);

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.55,
      padding: EdgeInsets.symmetric(
        // horizontal: size.width * 0.07,
        vertical: size.height * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ConstColor.screenColor,
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: popUpList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.isVisible.value = false;
              if (index == 0) {
              } else if (index == 1) {
              } else if (index == 2) {
                NavigationRoutes().nextScreen(
                  context,
                  const ChangePasswordScreen(),
                );
              } else if (index == 3) {
                NavigationRoutes().nextScreen(
                  context,
                  const ChangeEmailScreen(),
                );
              } else {
                log("TAPPED INDEX  ===== ${popUpList[index]}");
                signOut(context);
              }
            },
            child: Padding(
              padding: (index == popUpList.length - 1)
                  ? EdgeInsets.only(
                      left: size.width * 0.07,
                    )
                  : EdgeInsets.only(
                      bottom: 10,
                      left: size.width * 0.07,
                    ),
              child: Text(
                popUpList[index],
                style: textStyleW600(
                  size.width * 0.043,
                  (index == popUpList.length - 1)
                      ? ConstColor.redError
                      : ConstColor.blackText,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void signOut(context) async {
    final MainScreenController controller = Get.put(
      MainScreenController(),
    );

    var response = await http.post(
      Uri.parse("${ApiClass.baseUrl}${ApiClass.signOut}"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer ${controller.token}",
      },
      body: jsonEncode({"user_id": controller.userID.toString()},),
    );

    var details = response.body;
    var apiStatus = jsonDecode(details)["status"];
    var errorMessage = jsonDecode(details)["message"];

    log("MESSAGE  ====> $errorMessage");

    if (apiStatus == "Success") {
      // ignore: use_build_context_synchronously
      NavigationRoutes().nextScreenCloseOthers(
        context,
        const FirstScreen(),
      );
      controller.token = "";

      log("MESSAGE  === $errorMessage");
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
}
