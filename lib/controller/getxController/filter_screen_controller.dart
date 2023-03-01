import '../../modal/url/url.dart';

class FilterScreenController extends GetxController {
  Rx<TextEditingController> search = TextEditingController().obs;
  RxInt index = 0.obs;

  final RxList<bool> isTrueList = RxList<bool>(
      List.generate(listOfAmenities.length, (index) => false)
  );


  final RxList<String> list = fromWhom.obs;

  final RxString selected = fromWhom.first.obs;

  void setSelected(String value) {
    selected.value = value;
  }
}