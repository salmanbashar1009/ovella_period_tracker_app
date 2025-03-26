import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/period_tips_slider/period_tips_container.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:provider/provider.dart';

class PeriodTips extends StatelessWidget {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130.h,
      child: Column(
        spacing: 5.h,
        children: [
          Expanded(
            child: Consumer<HomeScreenProvider>(
              builder: (_, homeScreenProvider, _) {
                return PageView.builder(
                  onPageChanged: (index) {
                    context
                        .read<HomeScreenProvider>()
                        .onChangedPeriodTipsCurrentPage(index);

                  },
                  itemCount: homeScreenProvider.periodTipsModel?.tips?.length ?? 0,
                  itemBuilder: (_, index){
                    final tip = homeScreenProvider.periodTipsModel!.tips![index];
                    return PeriodTipsContainer(
                      title: tip.title!,
                      bodyText: tip.body!,
                      assetImagePath: tip.image!,
                    );
                  },

                  //children:
                  // [
                  //   PeriodTipsContainer(),
                  //   PeriodTipsContainer(),
                  //   PeriodTipsContainer(),
                  // ],
                );
              }
            ),
          ),


          Consumer<HomeScreenProvider>(
            builder: (_, homeScreenProvider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DotsIndicator(
                  dotsCount: homeScreenProvider.periodTipsModel!.tips!.length,
                  position: homeScreenProvider.periodTipsCurrentPage.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: Theme.of(context).colorScheme.secondary,
                    color: Colors.grey.withOpacity(0.3 ),
                    size: Size(8.0, 8.0),
                    activeSize: Size(8.0, 8.0),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}



