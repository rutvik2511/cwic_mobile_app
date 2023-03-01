import '../../modal/url/url.dart';
class HomeScreenController extends GetxController {


  RxInt newIndex = 0.obs;
  RxInt tappedIndex = 0.obs;

  final RxList pages =  const [
    ListingPage(),
    FavoritePage(),
    MessageScreen(),
    ProfileScreen(),
  ].obs;
}
