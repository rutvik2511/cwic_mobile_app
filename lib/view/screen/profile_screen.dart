import 'package:auto_size_text/auto_size_text.dart';

import '../../modal/url/url.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    controller.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        controller.isVisible.value = false;
        },
      child: Container(
        color: ConstColor.white,
        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder(
          future: controller.getUserData(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapShot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).padding.top + 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.045,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ConstString.profile,
                                    style: textStyleW600(
                                      size.width * 0.065,
                                      ConstColor.primary,
                                    ),
                                  ),
                                  Obx(
                                    () => AppBarButton(
                                      size: size,
                                      color: (controller.isVisible.value)
                                          ? ConstColor.primary
                                          : ConstColor.white,
                                      borderColor: ConstColor.shadow,
                                      image: (controller.isVisible.value)
                                          ? ConstImage.moreWhite
                                          : ConstImage.more,
                                      onTap: () {
                                        controller.isVisible.value =
                                            !controller.isVisible.value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 45,
                                    child: ClipOval(
                                      child: controller.userProfile != null
                                          ? Image.network(
                                              controller.userProfile.toString(),
                                              height: 120,
                                              width: 120,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              ConstImage.profileImage,
                                              height: 120,
                                              width: 120,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.07,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.userName.toString(),
                                        style: textStyleW600(
                                          size.width * 0.06,
                                          ConstColor.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.001,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.6,
                                        child: AutoSizeText(
                                          controller.userEmail.toString(),
                                          maxLines: 1,
                                          style: textStyleW600(
                                            size.width * 0.045,
                                            ConstColor.blackText.withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Details",
                                    style: textStyleW600(
                                      size.width * 0.055,
                                      ConstColor.blackText,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      NavigationRoutes().nextScreen(context, const EditUserScreen(),);
                                    },
                                    child: Text(
                                      "Edit profile details",
                                      style: textStyleW600U(
                                        size.width * 0.042,
                                        ConstColor.whiteAF,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.005,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: ConstColor.black.withOpacity(0.1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.045,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.015,
                              ),

                              // Age
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.025,
                                  vertical: size.height * 0.015,
                                ),
                                decoration: BoxDecoration(
                                  color: ConstColor.screenColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.4,
                                      child: Text(
                                        "Age",
                                        style: textStyleW600(
                                          size.width * 0.042,
                                          ConstColor.blackText,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      controller.userAge.toString(),
                                      maxLines: 2,
                                      style: textStyleW600TO(size.width * 0.042,
                                          TextOverflow.clip),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              // Nationality
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.025,
                                  vertical: size.height * 0.015,
                                ),
                                decoration: BoxDecoration(
                                  color: ConstColor.screenColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.4,
                                      child: Text(
                                        "Nationality",
                                        style: textStyleW600(
                                          size.width * 0.042,
                                          ConstColor.blackText,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      controller.nationality.toString(),
                                      maxLines: 2,
                                      style: textStyleW600TO(size.width * 0.042,
                                          TextOverflow.clip),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              // Languages
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.025,
                                  vertical: size.height * 0.015,
                                ),
                                decoration: BoxDecoration(
                                  color: ConstColor.screenColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.4,
                                      child: Text(
                                        "Languages",
                                        style: textStyleW600(
                                          size.width * 0.042,
                                          ConstColor.blackText,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      controller.languages.toString(),
                                      maxLines: 2,
                                      style: textStyleW600TO(size.width * 0.042,
                                          TextOverflow.clip),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              // Currency
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.025,
                                  vertical: size.height * 0.015,
                                ),
                                decoration: BoxDecoration(
                                  color: ConstColor.screenColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.4,
                                      child: Text(
                                        "Currency",
                                        style: textStyleW600(
                                          size.width * 0.042,
                                          ConstColor.blackText,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      controller.currency.toString(),
                                      maxLines: 2,
                                      style: textStyleW600TO(
                                        size.width * 0.042,
                                        TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.isVisible.value,
                      child: Positioned(
                        top: MediaQuery.of(context).padding.top +
                            30 +
                            size.height * 0.057,
                        right: size.width * 0.045,
                        child: PopUpList(
                          size: size,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
