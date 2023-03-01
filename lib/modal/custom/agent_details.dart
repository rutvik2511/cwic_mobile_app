import '../../modal/url/url.dart';
class AgentDetails extends StatelessWidget {
  final Size size;
  const AgentDetails({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.015,horizontal: size.width * 0.04),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ConstColor.screenColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Warwick Estates",
                style: textStyleW600(size.width * 0.05, ConstColor.blackText,),
              ),
              SizedBox(height: size.height * 0.01,),
              Text("Edward McCarren",style: textStyleW600(size.width * 0.05, ConstColor.blackText,),),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        GestureDetector(
          onTap: () {
            Get.to( () => AgentProfile(),);
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.015,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ConstColor.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ConstColor.primary)
            ),
            child: Text(
              ConstString.viewAgent,
              style: textStyleW600(size.width * 0.05, ConstColor.primary,),
            ),
          ),
        )
      ],
    );
  }
}
