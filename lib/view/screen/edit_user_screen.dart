import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../modal/url/url.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final EditUserController controller = Get.put(EditUserController());
  final ProfileController profileController = Get.put(ProfileController());
  var cityList = [];

  @override
  void initState() {
    getCity();

    controller.userType = profileController.userType;
    controller.fullName.value.text = profileController.userName!;
    controller.email.value.text = profileController.userEmail!;
    controller.birthDate.value.text = profileController.dateOfBirth!;
    controller.nationality.value.text = profileController.nationality!;
    controller.speakLanguage.value.text = profileController.languages!;
    controller.currency.value.text = profileController.currency!;
    controller.fileName = profileController.userProfile!;

    if (controller.userType == "Parent") {
      controller.isParent.value = true;
    } else {
      controller.isStudent.value = true;
    }

    // profileController.getUserData();
    super.initState();
  }

  getCity() async {
    var response = await http.post(
      Uri.parse("${ApiClass.baseUrl}${ApiClass.getCity}"),
    );

    var details = response.body;
    var apiStatus = jsonDecode(details)["status"];
    cityList = jsonDecode(details)['data']['cityList'] as List;

    // cities = cityList.map((city) => city['city_name'] as String).toList();

    log("API STATUS  ====  $apiStatus");
    log("CITY List  ====  $cityList");
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
        child: SingleChildScrollView(
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
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        imagePickerDialog();
                      });
                    },
                    child: CircleAvatar(
                      radius: 45,
                      child: ClipOval(
                        child: controller.imageFile != null
                            ? Image.file(
                                controller.imageFile!,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                controller.fileName.toString(),
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: ConstColor.primary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.isParent.value =
                                  !controller.isParent.value;
                              controller.isStudent.value = false;
                            },
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                (controller.isParent.value)
                                    ? ConstImage.check
                                    : ConstImage.box,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          "I'm a Parent / Guardian",
                          style: textStyleW600L(ConstColor.blackText),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.isStudent.value =
                                  !controller.isStudent.value;
                              controller.isParent.value = false;
                            },
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                (controller.isStudent.value)
                                    ? ConstImage.check
                                    : ConstImage.box,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          "I'm a Student",
                          style: textStyleW600L(ConstColor.blackText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const EditScreenText(
                text: ConstString.fullName,
              ),
              CustomTextField(
                controller: controller.fullName.value,
                size: size,
                hint: "",
              ),
              const EditScreenText(
                text: ConstString.email,
              ),
              CustomTextField(
                controller: controller.email.value,
                size: size,
                hint: "",
              ),
              const EditScreenText(
                text: ConstString.birthDate,
              ),
              TextFieldOnTap(
                onTap: () {
                  datePick(context, controller);
                },
                readOnly: true,
                controller: controller.birthDate.value,
                size: size,
                hint: "",
              ),
              const EditScreenText(
                text: ConstString.nationality,
              ),
              TextFieldOnTap(
                onTap: () {
                  countryPick(context, controller, size);
                },
                readOnly: true,
                controller: controller.nationality.value,
                size: size,
                hint: "",
              ),
              const EditScreenText(
                text: ConstString.speakLanguage,
              ),
              CustomTextField(
                controller: controller.speakLanguage.value,
                size: size,
                hint: "",
              ),
              const EditScreenText(
                text: ConstString.interestedCity,
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.008,
                    horizontal: size.width * 0.035),
                decoration: BoxDecoration(
                  color: ConstColor.screenColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.selectedCity,
                    style: textStyleW600L(ConstColor.blackText),
                    onChanged: (value) {
                      setState(() {
                        controller.selectedCity = value;
                        log("SELECTED CITY  ==== ${controller.selectedCity}");
                      });
                    },
                    items: cityList.map<DropdownMenuItem<String>>((item) {
                      return DropdownMenuItem<String>(
                        value: item['city_id'].toString(),
                        child: Text(item['city_name']),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const EditScreenText(
                text: ConstString.currency,
              ),
              TextFieldOnTap(
                onTap: () {
                  currencyPick(context, controller, size);
                },
                readOnly: true,
                controller: controller.currency.value,
                size: size,
                hint: "",
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.18,
        color: ConstColor.white,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.045,
        ),
        child: Column(
          children: [
            CustomButton(
              color: ConstColor.primary,
              btnTitle: ConstString.updateProfileBtn,
              titleColor: ConstColor.white,
              onTap: () {
                controller.editUser(context);
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButton(
              color: ConstColor.primary,
              btnTitle: ConstString.delete,
              titleColor: ConstColor.white,
              onTap: () {
                getCity();
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  imagePickerDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14.0),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: SizedBox(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "Choose profile",
                    style: textStyleW600(
                      16,
                      ConstColor.blackText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.2),
                  height: 1.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        pickImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: ConstColor.primary.withOpacity(0.4),
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.photo_library,
                            color: ConstColor.black.withOpacity(0.6),
                          ),
                          onPressed: () {
                            pickImage(ImageSource.gallery);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        pickImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: ConstColor.primary.withOpacity(0.4),
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: ConstColor.black.withOpacity(0.6),
                          ),
                          onPressed: () {
                            pickImage(ImageSource.camera);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future pickImage(ImageSource imageSource) async {
    final pickImage = ImagePicker();
    var imagePicked = await pickImage.pickImage(
      source: imageSource,
      maxHeight: 200,
      maxWidth: 200,
    );
    if (imagePicked != null) {
      setState(() {
        controller.imageFile = File(imagePicked.path);
        controller.fileName = (controller.imageFile!.path);
        log('imageFile == ${controller.imageFile}');
        log('fileName == ${controller.fileName}');
      });
    } else {
      log('No image selected!');
    }
  }
}
