import '../../modal/url/url.dart';
class CustomBackButton extends StatelessWidget {
  final Function onTap;
  final bool color;

  const CustomBackButton({
    Key? key,
    required this.onTap,
    this.color = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: color ? ConstColor.screenColor : ConstColor.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          ConstImage.back,
          height: size.height * 0.05,
          width: size.width * 0.09,
        ),
      ),
    );
  }
}
