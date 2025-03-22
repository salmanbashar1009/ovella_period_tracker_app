import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/l10n/l10n.dart'; // Import L10n
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/header_widget/header_widget.dart';
import 'package:ovella_period_tracker_app/view_model/localization_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';

class LanguageSettingScreen extends StatelessWidget {
  const LanguageSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Consumer<LocalProvider>(
              builder: (_, localProvider, __) {
                // Use a TextEditingController for search
                final searchController = TextEditingController();
                // Filtered languages based on search query
                List<Locale> filteredLanguages = L10n.all
                    .where(
                      (locale) => locale.languageCode.toLowerCase().contains(
                            localProvider.locale?.languageCode.toLowerCase() ??
                                '',
                          ),
                    )
                    .toList();

                return Column(
                  children: [
                    SizedBox(height: 12.h),
                    HeaderWidget(title: 'App Language'),
                    SizedBox(height: 24.h),
                    TextFormField(
                      controller: searchController,
                      style: textTheme.bodyMedium,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        hintText: 'Search',
                        suffixIcon: searchController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  searchController.clear();
                                  // No need for a separate search method; filter updates automatically
                                },
                              )
                            : null,
                      ),
                      onChanged: (value) {
                        // Trigger rebuild with filtered list
                        filteredLanguages = L10n.all
                            .where(
                              (locale) => locale.languageCode
                                  .toLowerCase()
                                  .contains(value.toLowerCase()),
                            )
                            .toList();
                        (context as Element).markNeedsBuild(); // Force rebuild
                      },
                    ),
                    SizedBox(height: 12.h),
                    Expanded(
                      child: filteredLanguages.isNotEmpty
                          ? ListView.builder(
                              itemCount: filteredLanguages.length,
                              itemBuilder: (BuildContext context, int index) {
                                final locale = filteredLanguages[index];
                                return GestureDetector(
                                  onTap: () {
                                    localProvider.setLocale(locale); // Update locale
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 14.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: locale.languageCode ==
                                              localProvider.locale?.languageCode
                                          ? AppColors.onPrimary
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(
                                        16.r,
                                      ),
                                    ),
                                    child: Text(
                                      locale.languageCode, // Display language code or customize as needed
                                      style: textTheme.bodyLarge!.copyWith(
                                        fontWeight: locale.languageCode ==
                                                localProvider.locale?.languageCode
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