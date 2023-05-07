import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ielts_trainer/frontend/utils/const/mycolors.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController nameCon =
      TextEditingController(text: 'Samama Majeed');
  final TextEditingController emailCon =
      TextEditingController(text: 'samama0096@gmail.com');
  final TextEditingController phoneCon =
      TextEditingController(text: '3456776539');
  String country = 'Pakistan';
  String fld = 'MBBS';
  Language lang = Languages.english;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: s.height * 0.44,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              "lib/assets/imgs/oetdoctors.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
            opacity: 0.85,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_2,
                      size: 100,
                    ),
                    Container(
                      width: s.width * 0.84,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: nameCon,
                              decoration: const InputDecoration(
                                label: Text("Full Name"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const CountryCodePicker(),
                                Expanded(
                                  child: TextFormField(
                                    controller: phoneCon,
                                    decoration: const InputDecoration(
                                        label: Text("Contact")),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: nameCon,
                              decoration: const InputDecoration(
                                label: Text("Email"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Country :"),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                title: Text(country),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                trailing: const FaIcon(Icons.edit),
                                onTap: () {
                                  showCountryPicker(
                                      context: context,
                                      countryListTheme: CountryListThemeData(
                                        flagSize: 25,
                                        backgroundColor: Colors.white,
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.blueGrey),
                                        bottomSheetHeight:
                                            500, // Optional. Country list modal height
                                        //Optional. Sets the border radius for the bottomsheet.
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                        //Optional. Styles the search field.
                                        inputDecoration: InputDecoration(
                                          labelText: 'Search',
                                          hintText: 'Start typing to search',
                                          prefixIcon: const Icon(Icons.search),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: const Color(0xFF8C98A8)
                                                  .withOpacity(0.2),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onSelect: (Country c) => setState(() {
                                            country =
                                                c.displayName.split('[').first;
                                          }));
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: DropdownButton(
                                // Initial Value
                                value: fld,
                                elevation: 0,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),
                                alignment: Alignment.center,
                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    fld = newValue!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            LanguagePickerDropdown(
                                initialValue: lang,
                                onValuePicked: (Language language) {
                                  lang = language;
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: MaterialButton(
                                  textColor: Colors.white,
                                  color: MyColors.primaryBtnC,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {},
                                  child: const Text("Update")),
                            )
                          ],
                        ),
                      )),
                    )
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}

List<String> items = ['MBBS', 'Others'];
