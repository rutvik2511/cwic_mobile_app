import '../../modal/url/url.dart';
import 'package:http/http.dart' as http;

class ListingController extends GetxController {
  Rx<TextEditingController> search = TextEditingController().obs;

  // ignore: prefer_typing_uninitialized_variables
  var featuredList;
  List listingId = [];
  List listingTitle = [];
  List listingUniversity = [];
  List pricePerWeek = [];
  List listingType = [];
  List listingImage = [];

  Future<void> getListing(context) async {
    final MainScreenController controller = Get.put(MainScreenController());

    var parameter = {
      "property_id": "",
      "listing_type": "",
      "amenities_id": "",
      "price_min": "",
      "price_max": "",
      "max_distance": "30",
      "page": 0,
      "size": 12,
      "apiParameters": {
        "id": controller.id.toString(),
        "admin_id": null,
        "user_id": controller.userID.toString(),
        "agent_id": null,
        "token": controller.token
      },
    };

    var response =
        await http.post(Uri.parse("${ApiClass.baseUrl}${ApiClass.getListing}"),
            headers: <String, String>{
              "Content-Type": "application/json",
              "Authorization": "Bearer ${controller.token}",
            },
            body: jsonEncode(parameter));

    var details = response.body;
    var apiStatus = jsonDecode(details)["status"];
    var errorMessage = jsonDecode(details)["message"];

    if (apiStatus == "Success") {
      featuredList = jsonDecode(details)['data']['featured_List'] as List;
      listingId = featuredList.map((property) => property['add_listing_id']).toList();
      listingTitle = featuredList.map((property) => property['listing_title'] as String).toList();
      listingUniversity = featuredList.map((property) => property['first_closest_university'] as String).toList();
      pricePerWeek = featuredList.map((property) => property['price_per_week'] as String).toList();
      listingType = featuredList.map((property) => property['listing_type'] as String).toList();
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(title: "Error", errorText: errorMessage);
          });
    }
  }
}
