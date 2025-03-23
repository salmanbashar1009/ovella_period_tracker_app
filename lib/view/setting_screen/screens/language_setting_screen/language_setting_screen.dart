import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/header_widget/header_widget.dart';
import 'package:ovella_period_tracker_app/view_model/localization_provider.dart';
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSettingScreen extends StatelessWidget {
  const LanguageSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    final appLocalization = AppLocalizations.of(context)!;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Consumer<StepScreenProvider>(
              builder: (_, stepScreenProvider, __) {
                /// Filtered languages based on search query
                List<Map<String, String>> filteredLanguages =
                    stepScreenProvider.allLanguages
                        .where(
                          (lang) => lang['name']!.toLowerCase().contains(
                            stepScreenProvider.languageSearchQuery
                                .toLowerCase(),
                          ),
                        )
                        .toList();

                return Column(
                  children: [
                    SizedBox(height: 12.h),
                    HeaderWidget(title: appLocalization.language),
                    SizedBox(height: 24.h),
                    TextFormField(
                      controller: stepScreenProvider.languageSearchController,
                      style: textTheme.bodyMedium,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        hintText: 'Search',
                        suffixIcon:
                            stepScreenProvider.languageSearchQuery.isNotEmpty
                                ? IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    stepScreenProvider.languageSearchController
                                        .clear();
                                    stepScreenProvider.searchingLanguage("");
                                  },
                                )
                                : null,
                      ),
                      onChanged:
                          (value) =>
                              stepScreenProvider.searchingLanguage(value),
                    ),
                    SizedBox(height: 12.h),
                    Expanded(
                      child:
                          filteredLanguages.isNotEmpty
                              ? ListView.builder(
                                itemCount: filteredLanguages.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final language =
                                      stepScreenProvider.allLanguages[index];

                                  return GestureDetector(
                                    onTap: () async {
                                      stepScreenProvider.languageSelection(
                                        filteredLanguages[index],
                                      ); // Pass full Map

                                     await context.read<LocalizationProvider>().onTapChangeLanguage(filteredLanguages[index]['code']!);

                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 14.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            filteredLanguages[index]['name'] ==
                                                    stepScreenProvider
                                                        .selectedLanguage['name']
                                                ? AppColors.onPrimary
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                      ),
                                      child: Text(
                                        filteredLanguages[index]['name']!,
                                        style: textTheme.bodyLarge!.copyWith(
                                          fontWeight:
                                              filteredLanguages[index] ==
                                                      stepScreenProvider
                                                          .selectedLanguage
                                                  ? FontWeight.w500
                                                  : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                              : Center(
                                child: Text(
                                  "No languages found",
                                  style: textTheme.bodyMedium,
                                ),
                              ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
