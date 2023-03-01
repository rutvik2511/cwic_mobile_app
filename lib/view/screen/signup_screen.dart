import 'dart:developer';
import 'dart:io';
import '../../modal/url/url.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ConstColor.white,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 15,
              ),
              Row(
                children: [
                  CustomBackButton(
                    color: true,
                    onTap: () {
                      NavigationRoutes.pop(context);
                    },
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Image.asset(ConstImage.logoGreen),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ConstString.createAccount,
                    style: textStyleW600(
                      size.width * 0.065,
                      ConstColor.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        imagePickerDialog();
                      });
                    },
                    child: CircleAvatar(
                      radius: 45,
                      child: ClipOval(
                        child: controller.imageFile != null
                            ? Image.file(
                                controller.imageFile!,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                ConstImage.profileImage,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: ConstColor.primary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomTextField(
                hint: ConstString.fullName,
                size: size,
                controller: controller.name.value,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomTextField(
                hint: ConstString.email,
                size: size,
                controller: controller.email.value,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomTextField(
                hint: ConstString.password,
                size: size,
                isIcon: true,
                obscure: true,
                controller: controller.password.value,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomTextField(
                isIcon: true,
                obscure: true,
                hint: ConstString.cnfPassword,
                size: size,
                controller: controller.cnfPassword.value,
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
              CustomButton(
                color: ConstColor.primary,
                btnTitle: ConstString.signUp,
                titleColor: ConstColor.white,
                onTap: () {
                  controller.signUpButtonOnTap(context);
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              CustomIconButton(
                color: ConstColor.blueBtn,
                btnTitle: ConstString.withFacebook,
                btnIcon: ConstImage.facebook,
                titleColor: ConstColor.white,
                bgColor: ConstColor.white,
                onTap: () {},
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomIconButton(
                color: ConstColor.screenColor,
                btnTitle: ConstString.withGoogle,
                btnIcon: ConstImage.google,
                titleColor: ConstColor.text70,
                bgColor: ConstColor.white,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  imagePickerDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14.0),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: SizedBox(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "Choose profile",
                    style: textStyleW600(
                      16,
                      ConstColor.blackText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.2),
                  height: 1.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        pickImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: ConstColor.primary.withOpacity(0.4),
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.photo_library,
                            color: ConstColor.black.withOpacity(0.6),
                          ),
                          onPressed: () {
                            pickImage(ImageSource.gallery);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        pickImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: ConstColor.primary.withOpacity(0.4),
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: ConstColor.black.withOpacity(0.6),
                          ),
                          onPressed: () {
                            pickImage(ImageSource.camera);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future pickImage(ImageSource imageSource) async {
    final pickImage = ImagePicker();
    var imagePicked = await pickImage.pickImage(
      source: imageSource,
      maxHeight: 200,
      maxWidth: 200,
    );
    if (imagePicked != null) {
      setState(() {
        controller.imageFile = File(imagePicked.path);
        controller.fileName = (controller.imageFile!.path);
        log('imageFile == ${controller.imageFile}');
        log('fileName == ${controller.fileName}');
      });
    } else {
      log('No image selected!');
    }
  }
}
