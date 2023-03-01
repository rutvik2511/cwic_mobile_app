import '../../modal/url/url.dart';
class CustomGrid extends StatelessWidget {
  final String propertyImage;
  final String propertyType;
  final String propertyTitle;
  final String propertyArea;
  final String propertyRent;

  const CustomGrid(
      {Key? key,
      required this.propertyImage,
      required this.propertyType,
      required this.propertyTitle,
      required this.propertyArea,
      required this.propertyRent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 0.15,
          child: Image.asset(
            propertyImage,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          propertyType,
          style: textStyleW600(size.width * 0.033, ConstColor.blackText.withOpacity(0.5),),
        ),
        Text(
          propertyTitle,
          style: textStyleW600(size.width * 0.039, ConstColor.blackText,),
        ),
        Text(
          propertyArea,
          style: textStyleW600(size.width * 0.031, ConstColor.blackText.withOpacity(0.6),),
        ),
        Row(
          children: [
            Text(
              ConstString.dolor,
              style: textStyleW700(size.width * 0.041, ConstColor.blackText.withOpacity(0.8),),
            ),
            Text(
              propertyRent,
              style: textStyleW700(size.width * 0.039, ConstColor.blackText.withOpacity(0.8),),
            ),
            Text(
              ConstString.week,
              style: textStyleW700(size.width * 0.039, ConstColor.blackText.withOpacity(0.8),),
            ),
          ],
        ),
      ],
    );
  }
}
