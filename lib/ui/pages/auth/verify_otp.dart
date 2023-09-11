// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrfreddy/bloc/auth/auth_bloc.dart';
import 'package:mrfreddy/data/models/user.dart';
import 'package:mrfreddy/routes/app_router.gr.dart';
import 'package:mrfreddy/ui/pages/home/main_page.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'package:mrfreddy/ui/widgets/button.dart';

@RoutePage()
class VerifyOtp extends StatelessWidget {
  final String verificationId;
  final ModelUser user;
  VerifyOtp({
    Key? key,
    required this.verificationId,
    required this.user,
  }) : super(key: key);

  late String otpPin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthSuccess) {
            Navigator.of(context).popUntil((route) => route.isFirst);
            AutoRouter.of(context).replace(
              MainRoute(user: state.user),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthVerifyingCode) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SizedBox(
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
                  "Please enter your OTP",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "We sent OTP number on your number +61 23456789",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFAFAFAF)),
                ),
                SizedBox(
                  height: 20,
                ),
                OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 20,
                  // controller: controller,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    otpPin = pin;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                PrimaryButton(
                  title: "Verify OTP",
                  onTap: () {
                    context.read<AuthBloc>().add(
                          VerifyRegisterCodeEvent(
                            code: otpPin,
                            verificationId: verificationId,
                            user: user,
                          ),
                        );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Resend OTP",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// VerifyRegisterCodeEvent