import '../../modal/url/url.dart';
class PropertyLabel extends StatelessWidget {
  final String propertyTitle;
  final String propertyArea;
  final String propertyRent;
  final Size size;

  const PropertyLabel({
    Key? key,
    required this.propertyTitle,
    required this.propertyArea,
    required this.propertyRent,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  propertyTitle,
                  style: textStyleW600(size.width * 0.055, ConstColor.primary,),
                ),
                Text(
                  propertyArea,
                  style: textStyleW600(size.width * 0.04, ConstColor.blackText,),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    ConstString.dolor,
                    style: textStyleW600(size.width * 0.055, ConstColor.primary,),
                  ),
                  Text(
                    "$propertyRent ",
                    style: textStyleW600(size.width * 0.055, ConstColor.primary,),
                  ),
                  Text(
                    ConstString.week,
                    style: textStyleW600(size.width * 0.04, ConstColor.primary,),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                children: [
                  CustomIconButton(
                    color: ConstColor.screenColor,
                    bgColor: ConstColor.white,
                    btnTitle: ConstString.map,
                    titleColor: ConstColor.black32,
                    onTap: () {},
                    btnIcon: ConstImage.map,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
