import '../../modal/url/url.dart';

class IconTextField extends StatelessWidget {
  final TextEditingController controller;
  final Size size;
  final String hint;
  final String image;

  const IconTextField({
    Key? key,
    required this.controller,
    required this.size,
    required this.hint,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        decoration: BoxDecoration(
          color: ConstColor.screenColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              color: ConstColor.black32,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                style: textStyleW600L(ConstColor.blackText),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.025,
                    vertical: size.height * 0.02,
                  ),
                  hintText: hint,
                  hintStyle: textStyleW600L(
                    ConstColor.black32,
                  ),
                ),
                cursorColor: ConstColor.black32,
                autocorrect: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
