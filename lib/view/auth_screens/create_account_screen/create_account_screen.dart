import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/create_account_screen/widgets/create_account_footer_widget.dart';
import 'package:ovella_period_tracker_app/view_model/create_account_provider.dart';
import 'package:provider/provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import '../../common_health_concerns_screen/widgets/common_heath_concern_header_widget.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Consumer<CreateAccountProvider>(
            builder: (
              BuildContext context,
              createAccountProvider,
              Widget? child,
            ) {
              return SingleChildScrollView(
                child: Padding(
                  padding: AppPadding.screenPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonHeathScreenConcernHeaderWidget(),
                      SizedBox(height: 24.h),
                      Text(
                        "Pregnancy & Fertility Tracking",
                        style: textTheme.headlineLarge,
                      ),
                      Text(
                        "Join thousands of women managing their health effortlessly.",
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.h,
                        ),
                      ),
                      SizedBox(
                        height: 700.h,
                        child: PageView.builder(
                          controller: createAccountProvider.pageController,
                          itemCount: createAccountProvider.carouselItems.length,
                          onPageChanged: (index) {
                            createAccountProvider.updateIndex(index);
                          },
                          physics:
                              NeverScrollableScrollPhysics(), // Disables user swiping
                          itemBuilder: (BuildContext context, int index) {
                            return createAccountProvider.carouselItems[index];
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
