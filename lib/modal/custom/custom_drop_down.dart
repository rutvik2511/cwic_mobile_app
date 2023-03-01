import '../../modal/url/url.dart';
// ignore: must_be_immutable
class CustomDropDownButton extends StatelessWidget {
  final List<String> list;
  String dropdownValue;
  final Size size;

  CustomDropDownButton({
    Key? key,
    required this.list,
    required this.dropdownValue,
    required this.size,
  }) : super(key: key);

  final FilterScreenController controller = Get.put(
    FilterScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.008, horizontal: size.width * 0.035),
        decoration: BoxDecoration(
          color: ConstColor.screenColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Obx(
          () => DropdownButton<String>(
            style: textStyleW600(size.width * 0.04, ConstColor.blackText,),
            isExpanded: true,
            value: controller.selected.value,
            elevation: 16,
            underline: Container(
              height: 2,
            ),
            onChanged: (newValue) {
              controller.setSelected(newValue!);
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
