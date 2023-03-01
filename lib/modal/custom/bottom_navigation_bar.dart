import '../../modal/url/url.dart';

class BottomNavBar extends StatelessWidget {
  final Size size;
  final Function onTap;

  BottomNavBar({
    Key? key,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstColor.white,
        boxShadow: [
          BoxShadow(
            color: ConstColor.shadow,
            blurRadius: 25.0,
          ),
        ],
      ),
      height: size.height * 0.11,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bottomNavBarItems.length,
        itemBuilder: (context, index) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: Image.asset(controller.tappedIndex.value == index
                  ? trueBottomNavBarItems[index]
                  : bottomNavBarItems[index]),
            ),
          );
        },
      ),
    );
  }
}
