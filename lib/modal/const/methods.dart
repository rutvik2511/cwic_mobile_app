import '../../modal/url/url.dart';
import 'package:intl/intl.dart';


void datePick(BuildContext context, controller) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1950),
    lastDate: DateTime.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(primary: ConstColor.primary),
        ),
        child: Container(child: child),
      );
    },
  );
  if (pickedDate != null) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    controller.birthDate.value.text = formattedDate;
  }
}

void countryPick(BuildContext context, controller, Size size) {
  showCountryPicker(
    context: context,
    countryListTheme: CountryListThemeData(
      bottomSheetHeight: size.height * 0.65
    ),
    onSelect: (Country country) {
      String selectedCountry = country.name;
      controller.nationality.value.text = selectedCountry;
    },
  );
}

void currencyPick(BuildContext context, controller, Size size){
  showCurrencyPicker(
    context: context,
    theme: CurrencyPickerThemeData(
        bottomSheetHeight: size.height * 0.65,
    ),
    showFlag: false,
    showCurrencyName: true,
    showCurrencyCode: true,
    onSelect: (Currency currency) {
      String selectedCurrency = currency.name;
      controller.currency.value.text = selectedCurrency;
    },
  );
}
