import '../../modal/url/url.dart';

class EditScreenText extends StatelessWidget {
  final String text;

  const EditScreenText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Column(
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: textStyleW600(
                size.width * 0.04,
                ConstColor.blackText.withOpacity(0.5),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
      ],
    );
  }
}
