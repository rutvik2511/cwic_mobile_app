import '../../modal/url/url.dart';
class CustomField extends StatelessWidget {
  final String image;
  final String label;

  const CustomField({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
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
        children: [
          Image.asset(image),
          SizedBox(
            width: size.width * 0.05,
          ),
          Text(
            label,
            style: textStyleW600(size.width * 0.05, ConstColor.blackText,),
          ),
        ],
      ),


    );
  }
}
