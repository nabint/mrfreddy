import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mrfreddy/ui/widgets/button.dart';

import '../../../routes/app_router.gr.dart';

class PetitionPage extends StatelessWidget {
  const PetitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31.0, vertical: 10),
      child: ListView(
        children: [
          Text(
            "Petition",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "License All Trades in the UK",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "Why it's",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Important',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
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
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      'The UK construction industry is a cornerstone of our national economy and infrastructure. However, the lack of a standardized licensing system for tradespeople exposes homeowners and businesses to potential fraud, shoddy workmanship, and financial losses. Licensing will ensure that every tradesperson meets a certain standard of skill and professionalism, providing an added layer of protection for consumers.',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "Our",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Goal',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
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
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      'We, the ByFreddy community, urge the government to introduce a mandatory licensing program for all tradespeople in the UK. With a consistent and robust licensing system:',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '\n1. Consumers will be able to hire with confidence, knowing that the tradesperson has met established industry standards.',
                      ),
                      TextSpan(
                        text:
                            '\n\n2. Tradespeople will benefit from a formalised recognition of their skills and expertise.',
                      ),
                      TextSpan(
                        text:
                            '\n\n3. The industry as a whole will see a reduction in cases of fraud and malpractice.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "How you can",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Help',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text:
                            '\n1. Sign the Petition: Add your voice to the growing number of UK residents who support this cause. Every signature counts!',
                      ),
                      TextSpan(
                        text:
                            '\n\n2. Share with Friends: Use the share buttons below to spread the word on social media, WhatsApp, or via email.',
                      ),
                      TextSpan(
                        text:
                            '\n\n3. Stay Updated: Follow our Trading Standards section to see the progress of cases lodged and stay informed on this initiative.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 3,
                child: PrimaryButton(
                  onTap: (){
                    AutoRouter.of(context).push(SignRoute());

                  },
                  width: double.infinity,
                  height: 35,
                  title: "Sign now",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondary,
                        width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/icons/share.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Thank you for joining us in championing a safer, more accountable construction industry. Together, we can make a difference!",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
