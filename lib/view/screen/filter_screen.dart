import '../../modal/url/url.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final FilterScreenController controller = Get.put(
    FilterScreenController(),
  );

  // bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ConstColor.white,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.045,
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(
                    width: size.width * 0.07,
                  ),
                  Text(
                    ConstString.filter,
                    style: textStyleW600(
                      size.width * 0.065,
                      ConstColor.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              Row(
                children: [
                  IconTextField(
                    controller: controller.search.value,
                    size: size,
                    hint: ConstString.search,
                    image: ConstImage.search,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                ConstString.listingType,
                style: textStyleW600(
                  size.width * 0.065,
                  ConstColor.primary,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: size.width * 0.02,
                crossAxisSpacing: size.height * 0.011,
                childAspectRatio: size.width * 0.0075,
                children: List.generate(
                  listingType.length,
                  (index) {
                    return CustomButton(
                      color: ConstColor.screenColor,
                      btnTitle: listingType[index],
                      onTap: () {},
                      titleColor: ConstColor.blackText,
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                ConstString.pricePw,
                style: textStyleW600(
                  size.width * 0.065,
                  ConstColor.primary,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  CustomDropDownButton(
                    size: size,
                    list: fromWhom,
                    dropdownValue: fromWhom.first,
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  CustomDropDownButton(
                    size: size,
                    list: fromWhom,
                    dropdownValue: fromWhom.first,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                ConstString.city,
                style: textStyleW600(
                  size.width * 0.065,
                  ConstColor.primary,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  CustomDropDownButton(
                    size: size,
                    list: fromWhom,
                    dropdownValue: fromWhom.first,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                ConstString.maxDistance,
                maxLines: 1,
                overflow: TextOverflow.visible,
                style: textStyleW600(
                  size.width * 0.055,
                  ConstColor.primary,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  CustomDropDownButton(
                    size: size,
                    list: fromWhom,
                    dropdownValue: fromWhom.first,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                ConstString.amenities,
                maxLines: 1,
                overflow: TextOverflow.visible,
                style: textStyleW600(
                  size.width * 0.055,
                  ConstColor.primary,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: listOfAmenities.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: size.height * 0.011,
                  childAspectRatio: 8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.isTrueList[index] =
                                !controller.isTrueList[index];
                          },
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              (controller.isTrueList[index])
                                  ? ConstImage.check
                                  : ConstImage.box,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Expanded(
                        child: Text(
                          listOfAmenities[index],
                          style: textStyleW600(
                            size.width * 0.042,
                            ConstColor.blackText,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
