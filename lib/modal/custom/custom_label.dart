import '../../modal/url/url.dart';

class CustomLabel extends StatelessWidget {
  final Size size;
  final String title;
  final String data;

  const CustomLabel({
    Key? key,
    required this.size,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textStyleW600(
              size.width * 0.042,
              ConstColor.blackText,
            ),
          ),
          Row(
            children: [
              Text(
                data,
                maxLines: 2,
                style: textStyleW400TO(size.width * 0.042, TextOverflow.clip),
              ),
              Text(
                ConstString.minWalk,
                style: textStyleW400TO(size.width * 0.042, TextOverflow.clip),
              )
            ],
          ),
        ],
      ),
    );
  }
}
