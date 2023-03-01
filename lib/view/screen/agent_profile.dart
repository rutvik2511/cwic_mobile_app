import '../../modal/url/url.dart';
class AgentProfile extends StatelessWidget {
  const AgentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ConstColor.white,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.045,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    CustomBackButton(
                      color: true,
                      onTap: () {
                        NavigationRoutes.pop(context);
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            height: size.height * 0.1,
                            width: size.width * 0.23,
                            child: Image.asset(
                              ConstImage.agentIcon,
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: size.width * 0.07,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Warwick Estates",
                              style: textStyleW600(size.width * 0.06, ConstColor.primary),
                            ),
                            SizedBox(
                              height: size.height * 0.007,
                            ),
                            Text(
                              "Edward McCarren",
                              style: textStyleW600(size.width * 0.045, ConstColor.blackText),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      ConstString.aboutAgency,
                      style: textStyleW600(size.width * 0.06, ConstColor.primary),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      ConstString.aboutAgencyDes,
                      style: textStyleW400(size.width * 0.045, ConstColor.blackText),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    CustomButton(
                      color: ConstColor.primary,
                      btnTitle: ConstString.messageAgent,
                      titleColor: ConstColor.white,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      ConstString.listings,
                      style: textStyleW600(size.width * 0.06, ConstColor.blackText),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
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
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: size.width * 0.02,
                  crossAxisSpacing: size.height * 0.011,
                  childAspectRatio: size.width * 0.00177,
                  children: List.generate(
                    propertyImage.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const DetailsPage());
                        },
                        child: CustomGrid(
                          propertyImage: propertyImage[index],
                          propertyType: propertyType[index],
                          propertyTitle: propertyTitle[index],
                          propertyArea: propertyArea[index],
                          propertyRent: propertyRent[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
