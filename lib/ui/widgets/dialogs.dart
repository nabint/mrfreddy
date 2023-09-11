import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mrfreddy/data/models/trader.dart';
import 'package:mrfreddy/repositories/business.dart';
import 'package:mrfreddy/repositories/trader.dart';
import 'package:mrfreddy/ui/pages/follow/widgets/icon_textfield.dart';
import 'package:mrfreddy/ui/widgets/button.dart';
import 'package:path/path.dart';

Future addTraderDialog(context, callback) {
  final ImagePicker _picker = ImagePicker();
  final TraderRepo traderRepo = TraderRepo();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController businessController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  File? file;
  bool isUploading = false;

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return isUploading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: SingleChildScrollView(
                    child: Container(
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 12,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Add Trader",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      try {
                                        final pickedImage =
                                            await _picker.pickImage(
                                          source: ImageSource.gallery,
                                        );
                                        if (pickedImage != null) {
                                          file = File(pickedImage.path);
                                          setState(() {});
                                        }
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      radius: 50,
                                      child: CircleAvatar(
                                        radius: 50 - 2,
                                        backgroundImage: file != null
                                            ? Image.file(file!).image
                                            : Image.network(
                                                "https://via.placeholder.com/150",
                                                fit: BoxFit.cover,
                                              ).image,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    width: 25,
                                    height: 20,
                                    bottom: 0.0,
                                    right: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 0.7,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Image.asset(
                                          "assets/icons/camera.png"),
                                    ),
                                  )
                                  // Positioned(child: child)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Upload Profile Picture",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            IconTextField(
                              assetPath: "assets/icons/user_active.png",
                              title: "Name",
                              controller: nameController,
                              hintText: "Enter the name of the trader",
                            ),
                            IconTextField(
                              assetPath: "assets/icons/briefcase.png",
                              title: "Business name",
                              controller: businessController,
                              hintText: "Enter the name of the business",
                            ),
                            IconTextField(
                              assetPath: "assets/icons/location_active.png",
                              title: "Location",
                              controller: locationController,
                              hintText: "Enter the name of the Area",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            PrimaryButton(
                              onTap: () async {
                                isUploading = true;
                                setState(() {});
                                ModelTrader modelTrader = ModelTrader(
                                  id: "",
                                  name: nameController.text,
                                  location: locationController.text,
                                  followerCount: 0,
                                  imgUrl: "",
                                  warnings: [],
                                  business: [
                                    {
                                      "name": businessController.text,
                                      "location": locationController.text
                                    }
                                  ],
                                );

                                await traderRepo.addTrader(modelTrader, file);
                                await callback();
                                // isUploading = true;
                                // setState((){});
                                Navigator.of(context).pop();
                              },
                              width: double.infinity,
                              title: "Add Trader",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
      });
}

Future addBusinessDialog(context, ModelTrader trader) {
  BusinessRepo _businessRepo = BusinessRepo();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  bool isUploading = false;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return isUploading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Dialog(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: SingleChildScrollView(
                  child: Container(
                    height: 400,
                    // color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 12,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Add business name",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          IconTextField(
                            assetPath: "assets/icons/briefcase.png",
                            title: "Business name",
                            controller: nameController,
                            hintText: "Type your business name",
                          ),
                          IconTextField(
                            assetPath: "assets/icons/location_active.png",
                            title: "Location",
                            controller: locationController,
                            hintText: "Enter the name of the Area",
                          ),
                          Spacer(),
                          PrimaryButton(
                            onTap: () async {
                              isUploading = true;
                              setState(() {});
                              await _businessRepo.addBusiness(
                                trader,
                                {
                                  "name": nameController.text,
                                  "location": locationController.text,
                                },
                              );
                              Navigator.of(context).pop();
                              
                            },
                            width: double.infinity,
                            title: "Add Business Name",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      });
    },
  );
}

Future reportDialog(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            height: 500,
            // color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(
                      "assets/images/check_right.png",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Thank you for your report",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'To maintain your privacy, your name will not be displayed. Instead, only the last three digits of your mobile number will be shown for verification purposes.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "We value your privacy and strive to create a safe environment for all users.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  PrimaryButton(
                    onTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    width: 300,
                    height: 60,
                    title: "Okay",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
