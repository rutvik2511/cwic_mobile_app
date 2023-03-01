import '../../modal/url/url.dart';
class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 30,
            ),
            Text(
              ConstString.favorites,
                style: textStyleW600(size.width * 0.065, ConstColor.primary)
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            // FEATURED LISTINGS
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
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

          ],
        ),
      ),
    );
  }
}
