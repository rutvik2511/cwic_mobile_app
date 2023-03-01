import '../../modal/url/url.dart';
class PropertyDescription extends StatelessWidget {
  final Size size;
  const PropertyDescription({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ConstString.description,
          style: textStyleW400(size.width * 0.045, ConstColor.blackText,),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          ConstString.facilitiesInclude,
          style: textStyleW600(size.width * 0.06, ConstColor.primary,),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          ConstString.facilitiesIncludeDes,
          style: textStyleW400(size.width * 0.045, ConstColor.blackText,),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          ConstString.billsInclude,
          style: textStyleW600(size.width * 0.06, ConstColor.primary,),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          ConstString.billsIncludeDes,
          style: textStyleW400(size.width * 0.045, ConstColor.blackText,),
        ),
      ],
    );
  }
}
