import '../../modal/url/url.dart';
class AppBarButton extends StatelessWidget {
  final Size size;
  final Color color;
  final Color borderColor;
  final String image;
  final Function onTap;

  const AppBarButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor)),
        child: Image.asset(
          image,
          height: size.height * 0.05,
          width: size.width * 0.09,
        ),
      ),
    );
  }
}
