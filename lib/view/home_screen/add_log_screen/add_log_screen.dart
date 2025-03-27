import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/home_screen/add_log_screen/widget/build_log_item_widget.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';

import 'arguments_model/arguments_model.dart';

class AddLogScreen extends StatelessWidget {
  final bool isBackButtonOnAppBar;
  final String saveButtonText;
  final Function onSave;

  const AddLogScreen({
    super.key,
    required this.isBackButtonOnAppBar,
    required this.saveButtonText,
    required this.onSave

  });

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as AddLogScreenArguments;


    return BackgroundWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: AppBar(
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                leading: isBackButtonOnAppBar ?  Utils.backButton(context) : null,
                title: Consumer<HomeScreenProvider>(
                  builder: (_, homeScreenProvider, child) {
                    return Text(
                      "Log your ${homeScreenProvider.logTo}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    );
                  },
                ),
                centerTitle: true,
              ),
            ),
            Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        Consumer<HomeScreenProvider>(
                          builder: (_, homeScreenProvider, child) {
                            return Text(
                              homeScreenProvider.logTo,
                              style: Theme.of(context).textTheme.headlineSmall,
                            );
                          },
                        ),
                        SizedBox(height: 16.h),
                        Consumer<HomeScreenProvider>(
                          builder: (_, homeScreenProvider, child) {
                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children:
                                  homeScreenProvider.logTo ==
                                          homeScreenProvider.symptomsLog
                                      ? homeScreenProvider.symptoms
                                          .map(
                                            (symptom) => BuildLogItem(
                                              isEditMode: false,
                                              logItem: symptom,
                                              onSelect:
                                                  homeScreenProvider
                                                      .onSelectLog,
                                            ),
                                          )
                                          .toList()
                                      : homeScreenProvider.moods
                                          .map(
                                            (mood) => BuildLogItem(
                                              isEditMode: false,
                                              logItem: mood,
                                              onSelect:
                                                  homeScreenProvider
                                                      .onSelectLog,
                                            ),
                                          )
                                          .toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  SizedBox(
                    width: double.infinity,
                    child: Utils.primaryButton(
                      title: "Save",
                      context: context,
                      onTap: () => Navigator.pop(context),
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
