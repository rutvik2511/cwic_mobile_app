import '../../modal/url/url.dart';


class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  final ListingController controller = Get.put(ListingController());
  @override
  void initState() {
    controller.getListing(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: ConstColor.white,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.045,
      ),
      height: double.infinity,
      width: double.infinity,
      child:FutureBuilder(
        future: controller.getListing(context),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapShot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Row(
                    children: [
                      IconTextField(
                        image: ConstImage.search,
                        controller: controller.search.value,
                        size: size,
                        hint: ConstString.search,
                      ),
                      SizedBox(
                        width: size.width * 0.07,
                      ),
                      GestureDetector(
                        child: Image.asset(
                          ConstImage.notification,
                          height: size.height * 0.035,
                        ),
                        onTap: (){
                          Get.to( () => const NotificationScreen());
                        },
                      ),
                      SizedBox(
                        width: size.width * 0.035,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: CustomIconButton(
                          color: ConstColor.primary,
                          bgColor: ConstColor.primary,
                          btnTitle: ConstString.filterListing,
                          titleColor: ConstColor.white,
                          onTap: () {
                            Get.to(() => const FilterScreen());
                          },
                          btnIcon: ConstImage.filter,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Expanded(
                        flex: 4,
                        child: CustomIconButton(
                          color: ConstColor.screenColor,
                          bgColor: ConstColor.white,
                          btnTitle: ConstString.map,
                          titleColor: ConstColor.black32,
                          btnIcon: ConstImage.map,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    ConstString.featured,
                    style: textStyleW600(size.width * 0.065, ConstColor.primary),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  // FEATURED LISTINGS
                  CustomGridView(
                    length: 4,
                    propertyArea: controller.listingUniversity,
                    propertyImage: propertyImage,
                    propertyRent: controller.pricePerWeek,
                    propertyTitle: controller.listingTitle,
                    propertyType: controller.listingType,
                    onTap: (){
                      NavigationRoutes().nextScreen(context, const DetailsPage());
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: size.width * 0.02,
                    crossAxisSpacing: size.height * 0.011,
                    childAspectRatio: size.width * 0.0075,
                    children: List.generate(
                      cities.length,
                          (index) {
                        return CustomButton(
                          color: ConstColor.screenColor,
                          btnTitle: cities[index],
                          onTap: () {},
                          titleColor: ConstColor.blackText,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                      ConstString.topInCity,
                      style: textStyleW600(size.width * 0.065, ConstColor.primary)
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  // TOP IN CITIES
                  CustomGridView(
                    length: 4,
                    onTap: (){},
                    propertyImage: propertyImage,
                    propertyType: propertyType,
                    propertyTitle: propertyTitle,
                    propertyArea: propertyArea,
                    propertyRent: propertyRent,
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}