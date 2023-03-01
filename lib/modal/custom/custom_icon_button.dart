import '../../modal/url/url.dart';
class CustomIconButton extends StatelessWidget {
  final Color color;
  final String btnTitle;
  final String btnIcon;
  final Color titleColor;
  final Color bgColor;
  final Function onTap;

  const CustomIconButton({
    Key? key,
    required this.color,
    required this.btnTitle,
    required this.titleColor,
    required this.onTap,
    required this.btnIcon, required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.015,
          horizontal: size.width * 0.045,
        ),

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: bgColor,
              radius: size.width * 0.033,
              backgroundImage: AssetImage(btnIcon),
            ),
            SizedBox(
              width: size.width * 0.035,
            ),
            Text(
              btnTitle,
              style: textStyleW600(size.width * 0.045, titleColor),
            ),
          ],
        ),
      ),
    );
  }
}
