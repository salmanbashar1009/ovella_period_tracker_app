import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view_model/pairing_screen_provider.dart';
import 'package:provider/provider.dart';
import '../../../utility/utils.dart';

class PairingCodeCard extends StatelessWidget {
  const PairingCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<PairingScreenProvider>(
      builder: (BuildContext context, pairingScreenProvider, Widget? child) {
        return Column(
          children: [
            ///Showing Generated code & copying
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: pairingScreenProvider.code),
                      ).whenComplete(() {
                        /*ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Invitation Code is copied!"),
                              backgroundColor: Colors.green,
                            ),
                          );*/
                      });
                    },
                    child: Container(
                      height: 71.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffF4F6F6),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                        child: Text(
                          pairingScreenProvider.code,
                          style: textTheme.headlineLarge!.copyWith(
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Pairing Code',
                    style: textTheme.headlineSmall!.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            ///Resend Pairing code
            SizedBox(
              width: double.infinity,
              child: Utils.primaryButton(
                title: 'Resend Pairing Code',
                onTap: () {
                  pairingScreenProvider.generateCode();
                },
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                context: context,
              ),
            ),
          ],
        );
      },
    );
  }
}
