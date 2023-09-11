import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mrfreddy/ui/pages/follow/widgets/icon_textfield.dart';
import 'package:mrfreddy/ui/pages/home/base.dart';
import 'package:mrfreddy/ui/widgets/dialogs.dart';
import 'package:mrfreddy/ui/pages/petition/widget/custom_textfield.dart';
import 'package:mrfreddy/ui/widgets/button.dart';

@RoutePage()
class SignPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      current_page: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31.0, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/icons/back.png",
                  height: 30,
                  width: 67,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Support a Safer, ',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'More Accountable Construction Industry!',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "By signing below, you're endorsing the introduction of a mandatory licensing system for all tradespeople in the UK.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              CustomTextField(
                title: "Name",
                controller: nameController,
              ),
              CustomTextField(
                title: "Email address",
                controller: emailController,
              ),
              CustomTextField(
                title: "Country",
                controller: countryController,
              ),
              CustomTextField(
                title: "Comment (Optional)",
                controller: commentController,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (_) {}),
                  Container(
                    width: MediaQuery.of(context).size.width - 120,
                    child: Text(
                      "I agree to have my name displayed as a supporter of this petition. I understand my email will remain confidential and only be used for updates related to this cause.",
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(value: false, onChanged: (value) {}),
                      ),
                      Text("I'm not a robot")
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              PrimaryButton(
                width: double.infinity,
                height: 35,
                title: "Add my Support!",
                onTap: () {
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  height: 62,
                                  width: 88,
                                  image: AssetImage(
                                    "assets/images/happy_frog.png",
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 300,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Thank you for supporting ',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              'a\n more accountable construction \n industry! ',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: 300,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              'Please consider sharing the petition to \n amplify our impact.',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
