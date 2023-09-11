import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mrfreddy/routes/app_router.gr.dart';
import 'package:mrfreddy/ui/widgets/button.dart';

@RoutePage()
class ChooseCounty extends StatefulWidget {
  ChooseCounty({super.key});

  @override
  State<ChooseCounty> createState() => _ChooseCountyState();
}

class _ChooseCountyState extends State<ChooseCounty> {
  List<String> ukCounties = [
    'Bedfordshire',
    'Berkshire',
    'Bristol (ceremonial county)',
    'Buckinghamshire',
    'Cambridgeshire',
    'Cheshire',
    'City of London (ceremonial county)',
    'Cornwall',
    'Cumbria',
    'Derbyshire',
    'Devon',
    'Dorset',
    'Durham',
    'East Riding of Yorkshire',
    'East Sussex',
    'Essex',
    'Gloucestershire',
    'Greater London (ceremonial county)',
    'Greater Manchester',
    'Hampshire',
    'Herefordshire',
    'Hertfordshire',
    'Isle of Wight',
    'Kent',
    'Lancashire',
    'Leicestershire',
    'Lincolnshire',
    'Merseyside',
    'Norfolk',
    'North Yorkshire',
    'Northamptonshire',
    'Northumberland',
    'Nottinghamshire',
    'Oxfordshire',
    'Rutland',
    'Shropshire',
    'Somerset',
    'South Yorkshire',
    'Staffordshire',
    'Suffolk',
    'Surrey',
    'Tyne and Wear',
    'Warwickshire',
    'West Midlands',
    'West Sussex',
    'West Yorkshire',
    'Wiltshire',
    'Worcestershire',
  ];

  String? selectedValue = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 121,
            ),
            Image(
                image: AssetImage('assets/images/finish.png'),
                fit: BoxFit.cover,
                height: 117,
                width: 117),
            SizedBox(
              height: 48,
            ),
            Text(
              "Choose County",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 260,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffEDEDED),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          "Select County",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        value: selectedValue != null ? selectedValue : null,
                        items: ukCounties
                            .map((String item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          selectedValue = value;
                          setState(() {});
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: 200,
                        ),
                        dropdownStyleData: DropdownStyleData(maxHeight: 500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    width: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage('assets/images/flag_uk.png'),
                          height: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "United Kingdom",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(
              onTap: () {
                if (selectedValue == null) {
                  final snackBar = SnackBar(
                    content: Text("Please Select County"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  AutoRouter.of(context).push(
                    SignUpRoute(county: selectedValue!),
                  );
                }
              },
              title: "Done",
            )
          ],
        ),
      ),
    );
  }
}
