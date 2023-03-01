import '../../modal/url/url.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: ConstColor.screenColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.045,
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 15,
                ),
                Row(
                  children: [
                    CustomBackButton(
                      onTap: () {},
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            ConstString.preview,
                            style: textStyleW600(
                                size.width * 0.062, ConstColor.primary),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
              ],
            ),
            Expanded(
              flex: 22,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomGridView(
                      length: propertyImage.length,
                      propertyArea: propertyArea,
                      propertyImage: propertyImage,
                      propertyRent: propertyRent,
                      propertyTitle: propertyTitle,
                      propertyType: propertyType,
                      onTap: () {
                        NavigationRoutes()
                            .nextScreen(context, const DetailsPage());
                      },
                    ),
                    Text(
                      ConstString.whyUseCWIC,
                      textAlign: TextAlign.justify,
                      style: textStyleW600(
                        size.width * 0.075,
                        ConstColor.primary,
                      ),
                    ),
                    const Text(
                      ConstString.whyUseCWIC1,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      ConstString.benefitsSigningUp,
                      textAlign: TextAlign.justify,
                      style: textStyleW600(
                        size.width * 0.075,
                        ConstColor.primary,
                      ),
                    ),
                    const Text(
                      ConstString.benefitsSigningUp1,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 10,
                    )
                  ],
                ),
              ),
            )
          ],
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
              btnTitle: ConstString.signUpNow,
              titleColor: ConstColor.white,
              onTap: () {
                Get.to( () => const SignUpScreen());
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom,)
          ],
        ),
      ),
    );
  }
}
