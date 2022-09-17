import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryCodePickerWidget extends StatefulWidget {
  const CountryCodePickerWidget({super.key});

  @override
  State<CountryCodePickerWidget> createState() =>
      _CountryCodePickerWidgetState();
}

class _CountryCodePickerWidgetState extends State<CountryCodePickerWidget> {
  String countryCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Country Code Picker")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              countryCode.toString(),
            ),
            TextButton(
                onPressed: () {
                  showCountryPicker(
                    context: context,
                    favorite: ["pk"],
                    countryListTheme: CountryListThemeData(flagSize: 20),
                    onSelect: (Country value) {
                      print(value.countryCode.toLowerCase());
                      print(value.displayName.toLowerCase());
                      countryCode = value.displayName.toString();
                      setState(() {});
                    },
                  );
                },
                child: Center(child: Text("tap")))
          ]),
    );
  }
}
