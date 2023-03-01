import '../url/url.dart';

// ignore: must_be_immutable
class CustomAlertDialog extends StatelessWidget {
   String title;
   String errorText;

   CustomAlertDialog({
    Key? key,
    required this.title,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        title,
        style: textStyleW600(
          size.width * 0.05,
          ConstColor.blackText,
        ),
      ),
      content: SizedBox(
        height: size.height * 0.18,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                errorText,
                maxLines: 3,
                style: textStyleW500TO(
                  size.width * 0.038,
                  TextOverflow.ellipsis
                ),
              ),
            ),
            Expanded(child: Container(),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child: CustomButton(
                onTap: (){
                  NavigationRoutes.pop(context);
                },
                color: ConstColor.primary,
                btnTitle: "ok",
                titleColor: ConstColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
