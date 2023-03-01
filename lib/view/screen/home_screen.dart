import 'dart:developer';

import '../../modal/url/url.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController controller = Get.put(HomeScreenController());
  final MainScreenController mainController = Get.put(MainScreenController());


  @override
  void initState() {
    log("TOKEN AFTER FILL DETAILS PAGE ====>  ${mainController.token}");
    log("USED ID AFTER FILL DETAILS PAGE ====>  ${mainController.userID}");
    log("ID AFTER FILL DETAILS PAGE ====>  ${mainController.id}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => controller.newIndex.value == 0
            ? const ListingPage()
            : controller.newIndex.value == 1
                ? const FavoritePage()
                : controller.newIndex.value == 2
                    ? const MessageScreen()
                    :  const ProfileScreen(),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          controller.newIndex.value = index;
          controller.tappedIndex.value = index;
        },
        size : size,
      ),
    );
  }
}
