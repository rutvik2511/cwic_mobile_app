import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../modal/url/url.dart';

class FillDetailsScreen extends StatefulWidget {
  const FillDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FillDetailsScreen> createState() => _FillDetailsScreenState();
}

class _FillDetailsScreenState extends State<FillDetailsScreen> {
  final FillDetailsController controller = Get.put(FillDetailsController(),);
  final MainScreenController mainController = Get.put(MainScreenController(),);
  var cityList = [];


  @override
  void initState() {
    log("TOKEN FROM SIGNUP PAGE ====>  ${mainController.token}");
    log("USED ID FROM SIGNUP PAGE ====>  ${mainController.userID}");
    log("ID FROM SIGNUP SIGNUP PAGE ====>  ${mainController.id}");
    controller.birthDate.value.text = "";
    getCity();
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
                    onTap: () {},
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
                    ConstString.fillDetails,
                    style: textStyleW600(
                      size.width * 0.065,
                      ConstColor.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.035,
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
              SizedBox(
                height: size.height * 0.035,
              ),
              Obx(
                () => TextFieldOnTap(
                  readOnly: true,
                  controller: controller.birthDate.value,
                  size: size,
                  onTap: () {
                    datePick(context, controller);
                  },
                  hint: ConstString.birthDate,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Obx(
                () => TextFieldOnTap(
                  controller: controller.nationality.value,
                  size: size,
                  readOnly: true,
                  hint: ConstString.nationality,
                  onTap: () {
                    countryPick(context, controller, size);
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomTextField(
                controller: controller.speakLanguage.value,
                size: size,
                hint: ConstString.speakLanguage,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.008,
                    horizontal: size.width * 0.035

                ),
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
              SizedBox(
                height: size.height * 0.02,
              ),
              Obx(
                () => TextFieldOnTap(
                  controller: controller.currency.value,
                  size: size,
                  hint: ConstString.currency,
                  readOnly: true,
                  onTap: () {
                    currencyPick(context, controller, size);
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.11,
        color: ConstColor.white,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.045,
        ),
        child: Column(
          children: [
            CustomButton(
              color: ConstColor.primary,
              btnTitle: ConstString.createAccount1,
              titleColor: ConstColor.white,
              onTap: () {
                controller.fillDetailsValidation(context);
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
}