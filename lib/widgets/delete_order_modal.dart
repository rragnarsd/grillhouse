import 'package:flutter/material.dart';
import 'package:grill_house/utils/constants.dart';
import 'package:grill_house/utils/theme/app_colors.dart';
import 'package:grill_house/widgets/action_btn_section.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class DeleteOrderModal {
  static void show({required BuildContext context, VoidCallback? onConfirm}) {
    final ThemeData theme = Theme.of(context);

    WoltModalSheet.show(
      context: context,
      modalTypeBuilder: (_) => WoltModalType.alertDialog(),
      barrierDismissible: true,
      pageListBuilder: (BuildContext modalContext) =>
          <SliverWoltModalSheetPage>[
            SliverWoltModalSheetPage(
              backgroundColor: Colors.white,
              navBarHeight: 20,
              mainContentSliversBuilder: (_) => <SliverPadding>[
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        const Icon(Icons.delete, color: Colors.red, size: 64),
                        const SizedBox(height: 24),
                        Text(
                          Constants.deleteConfirmation,
                          style: theme.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          Constants.deleteConfirmationDescription,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        ActionButtonsSection(
                          primaryBtnLabel: Constants.deleteOrder,
                          secondaryBtnLabel: Constants.keepOrder,
                          onPrimaryBtnPressed: () {},
                          primaryBtnColor: AppColors.error,
                          primaryBtnTextColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
    );
  }
}
