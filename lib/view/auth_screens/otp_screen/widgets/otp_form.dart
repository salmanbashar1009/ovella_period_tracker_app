import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ovella_period_tracker_app/view_model/otp_provider.dart';
import '../../../../utility/utils.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<OtpProvider>(context, listen: false);
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          "Enter OTP (a-digit code)",
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.h,
          ),
        ),
        SizedBox(height: 6.h),

        /// OTP Boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(otpProvider.otpLength, (index) {
            return Container(
              width: 55,
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle, // Circular box
              ),
              child: TextField(
                controller: otpProvider.controllers[index],
                focusNode: otpProvider.focusNodes[index],
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  otpProvider.handleInputChange(context, value, index);
                },
              ),
            );
          }),
        ),

        SizedBox(height: 24.h),

        /// Verify OTP Button
        SizedBox(
          width: double.infinity,
          child: Utils.primaryButton(
            title: 'Verify & Continue',
            context: context,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.h),
            onTap: () => otpProvider.verifyOtp(context),
          ),
        ),

        SizedBox(height: 24.h),

        /// Resend OTP
        InkWell(
          onTap: () => otpProvider.resendOtp(context),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(fontSize: 16, color: Color(0xff676364)),
                  ),
                  TextSpan(
                    text: 'Resend OTP',
                    style: TextStyle(fontSize: 16, color: colorScheme.secondary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
