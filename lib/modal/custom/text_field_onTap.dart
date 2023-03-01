import '../../modal/url/url.dart';

class TextFieldOnTap extends StatelessWidget {
  final TextEditingController controller;
  final Size size;
  final String hint;
  final bool obscure;
  final bool readOnly;
  final Function onTap;
  final Function? onChanged;

  const TextFieldOnTap({
    Key? key,
    required this.controller,
    required this.size,
    required this.hint,
    required this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstColor.screenColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onTap: () {
          onTap();
        },
        onChanged: (value) {
          onChanged!();
        },
        controller: controller,
        style: textStyleW600L(ConstColor.blackText),
        obscureText: obscure ? true : false,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.025,
            vertical: size.height * 0.025,
          ),
          hintText: hint,
          hintStyle: textStyleW600L(
            ConstColor.black32.withOpacity(0.5),
          ),
        ),
        cursorColor: ConstColor.black32,
        autocorrect: false,
        readOnly: readOnly,
      ),
    );
  }
}