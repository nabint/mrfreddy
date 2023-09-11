// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mrfreddy/bloc/auth/auth_bloc.dart';
import 'package:mrfreddy/data/models/user.dart';
import 'package:mrfreddy/routes/app_router.gr.dart';
import 'package:mrfreddy/ui/pages/auth/auth_background.dart';
import 'package:mrfreddy/ui/widgets/button.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  final String county;
  final TextEditingController phoneController = TextEditingController();

  SignUpPage({
    Key? key,
    required this.county,
  }) : super(key: key);
  late ModelUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackGround(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is AuthCodeVerification) {
                AutoRouter.of(context).push(
                  VerifyOtp(verificationId: state.verificationId, user: user),
                );
                print("AUTH VERIFIED");
              }

            },
            builder: (context, state) {
              if (state is AuthLoggingIn){
                return Center(child: CircularProgressIndicator(),);
              }
              else if (state is AuthRegistering){
                return Center(child: CircularProgressIndicator(),);
              }
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 121,
                  ),
                  Image(
                    image: AssetImage('assets/images/verify.png'),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "We will send you a verification code (OTP)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: 280,
                    child: TextField(
                      controller: phoneController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: UnderlineInputBorder(),
                        hintText: 'Enter mobile number',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                    title: "Send",
                    onTap: () async {
                      var phoneNumber = "+977${phoneController.text}";
                      user = ModelUser(
                        id: "",
                        name: "",
                        followedTraders: [],
                        phone: phoneNumber,
                        county: county,
                      );
                      context.read<AuthBloc>().add(
                            SendLoginCodeEvent(
                              phone: phoneNumber,
                              county: county,
                            ),
                          );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
