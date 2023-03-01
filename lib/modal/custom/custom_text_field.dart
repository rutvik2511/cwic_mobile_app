import '../../modal/url/url.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Size size;
  final String hint;
  final bool obscure;
  bool isPassword;
  final bool isIcon;
  final bool readOnly;
  // final Function? onChanged;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.size,
    required this.hint,
    // this.onChanged,
    this.obscure = false,
    this.isPassword = false,
    this.isIcon = false,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstColor.screenColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        // onChanged: (value) {
        //   widget.onChanged!();
        // },
        controller: widget.controller,
        style: textStyleW600L(ConstColor.blackText),
        obscureText: widget.obscure
            ? widget.isPassword
                ? false
                : true
            : false,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.size.width * 0.025,
            vertical: widget.size.height * 0.025,
          ),
          hintText: widget.hint,
          hintStyle: textStyleW600L(
            ConstColor.black32.withOpacity(0.5),
          ),
          suffixIconColor: ConstColor.primary,
          suffixIcon: GestureDetector(
            onTap: () {
              widget.isPassword = !widget.isPassword;
              setState(() {});
            },
            child: (widget.isIcon)
                ? (widget.isPassword)
                    ? const Icon(
                        Icons.lock_open,
                      )
                    : const Icon(
                        Icons.lock_outline,
                      )
                : const SizedBox(
                    height: 1,
                    width: 1,
                  ),
          ),
        ),
        cursorColor: ConstColor.black32,
        autocorrect: false,
        readOnly: widget.readOnly,
      ),
    );
  }
}