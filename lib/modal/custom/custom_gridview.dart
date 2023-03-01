import '../../modal/url/url.dart';

class CustomGridView extends StatelessWidget {
  final Function onTap;
  final List propertyImage;
  final List propertyType;
  final List propertyTitle;
  final List propertyArea;
  final List propertyRent;
  final int length;

  const CustomGridView({
    Key? key,
    required this.onTap,
    required this.propertyImage,
    required this.propertyType,
    required this.propertyTitle,
    required this.propertyArea,
    required this.propertyRent,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: size.width * 0.02,
      crossAxisSpacing: size.height * 0.011,
      childAspectRatio: size.width * 0.00177,
      children: List.generate(
        length,
        (index) {
          return GestureDetector(
            onTap: () {
              onTap();
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
    );
  }
}
