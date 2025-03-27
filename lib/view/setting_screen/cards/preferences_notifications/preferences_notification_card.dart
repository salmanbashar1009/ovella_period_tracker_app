import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view_model/settings_provider.dart';
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PreferencesNotificationCard extends StatelessWidget {
  const PreferencesNotificationCard({super.key});
  @override
  Widget build(BuildContext context) {
     final appLocalization = AppLocalizations.of(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<SettingsProvider>(
      builder: (BuildContext context, settingsProvider, Widget? child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Preferences & Notifications',
                style: textTheme.bodyLarge,
              ),
              SizedBox(height: 10.h),
              Divider(color: Color(0xff1E1E1E).withOpacity(0.12)),

              _buildDetails(
                title: 'Period Alerts',
                value: settingsProvider.periodAlerts,
                context: context,
                onChanged: (bool value) {
                  settingsProvider.updatePeriodAlerts(value);
                },
              ),
              _buildDetails(
                title: 'Pregnancy Tips',
                value: settingsProvider.pregnancyTips,
                context: context,
                onChanged: (bool value) {
                  settingsProvider.updatePregnancyTips(value);
                },
              ),
              _buildDetails(
                title: 'Mental Health',
                value: settingsProvider.mentalHealth,
                context: context,
                onChanged: (bool value) {
                  settingsProvider.updateMentalHealth(value);
                },
              ),
              Consumer<StepScreenProvider>(builder: (_, stepScreenProvider,_) {
                return GestureDetector(
                  onTap: ()=>Navigator.pushNamed(context, RouteName.languageSettingScreen),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Language', style: textTheme.bodyMedium),
                      Row(
                        children: [
                          Text(
                          
                            stepScreenProvider.selectedLanguage['name'] ?? 'English', style: textTheme.bodyMedium),
                          SizedBox(width: 8.w),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ],
                      ),
                    ],
                  ),
                );
              },)
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetails({
    required BuildContext context,
    required String title,
    required bool value,
    required onChanged,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.bodyMedium),
          Switch(
            trackColor: WidgetStateProperty.all(
              value ? colorScheme.secondary : Color(0xffE9E9EA),
            ),
            thumbColor: WidgetStateProperty.all(colorScheme.onPrimary),
            value: value,
            onChanged: onChanged, // Calls the passed function
          ),
        ],
      ),
    );
  }
}
