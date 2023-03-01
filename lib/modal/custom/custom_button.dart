import '../../modal/url/url.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String btnTitle;
  final Color titleColor;
  final Function onTap;

  const CustomButton({
    Key? key,
    required this.color,
    required this.btnTitle,
    required this.titleColor,
    required this.onTap,
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
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          btnTitle,
          style: textStyleW600(
            size.width * 0.048,
            titleColor,
          ),
        ),
      ),
    );
  }
}
