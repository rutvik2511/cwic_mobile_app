import '../../modal/url/url.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  // late List cartList = [];
  // List items = List.generate(10, (index) => "Item $index");

  final DetailsPageController controller = Get.put(DetailsPageController(),);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          controller.isVisible.value = false;
        },
        child: Container(
          color: ConstColor.white,
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.045),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top + 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomBackButton(
                                color: true,
                                onTap: () {
                                  NavigationRoutes.pop(context);
                                },
                              ),
                              Row(
                                children: [
                                  AppBarButton(
                                    onTap: () {},
                                    size: size,
                                    color: ConstColor.white,
                                    borderColor: ConstColor.shadow,
                                    image: ConstImage.archive,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
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
                                        controller.isVisible.value = !controller.isVisible.value;
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          SizedBox(
                            width: size.width,
                            height: size.height * 0.3,
                            child: Image.asset(
                              ConstImage.property1,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          PropertyLabel(
                            size: size,
                            propertyTitle: propertyTitle[0],
                            propertyArea: propertyArea[0],
                            propertyRent: propertyRent[0],
                          ),
                          SizedBox(
                            height: size.height * 0.015,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.045),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: facilitiesIcon.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CustomField(
                                    image: facilitiesIcon[index],
                                    label: facilitiesTitle[index],
                                  ),
                                  (index == facilitiesIcon.length - 1)
                                      ? const SizedBox(
                                          height: 0,
                                        )
                                      : SizedBox(
                                          height: size.height * 0.015,
                                        ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          PropertyDescription(
                            size: size,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: distance.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CustomLabel(
                                      size: size,
                                      title: distance[index],
                                      data: timeToWalk[index],
                                  ),
                                  (index == distance.length - 1)
                                      ? const SizedBox(
                                          height: 0,
                                        )
                                      : SizedBox(
                                          height: size.height * 0.015,
                                        ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            ConstString.otherAmenities,
                            style: textStyleW600(
                              size.width * 0.06,
                              ConstColor.primary,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: listOfAmenities.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: size.height * 0.011,
                              childAspectRatio: 8,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Image.asset(ConstImage.check),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Expanded(
                                    child: Text(
                                      listOfAmenities[index],
                                      style: textStyleW600(
                                        size.width * 0.042,
                                        ConstColor.blackText,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.015,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.045),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Text(
                            ConstString.agentDetails,
                            style: textStyleW600(
                              size.width * 0.06,
                              ConstColor.primary,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          AgentDetails(
                            size: size,
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
              Obx( ()=> Visibility(
                  visible: controller.isVisible.value,
                  child: Positioned(
                    top: MediaQuery.of(context).padding.top +
                        30 +
                        size.height * 0.045,
                    right: size.width * 0.045,
                    child: Container(
                      width: size.width * 0.55,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ConstColor.screenColor,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          controller.isVisible.value = !controller.isVisible.value;
                        },
                        child: Text(
                          "Report listing",
                          style: textStyleW600(
                            size.width * 0.043,
                            ConstColor.blackText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.11,
        color: ConstColor.white,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
        child: Column(
          children: [
            CustomButton(
              color: ConstColor.primary,
              onTap: () {},
              titleColor: ConstColor.white,
              btnTitle: ConstString.enquire,
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
