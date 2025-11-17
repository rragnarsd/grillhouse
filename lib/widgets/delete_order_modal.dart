import 'package:dashboard/widgets/action_btn_section.dart';
import 'package:flutter/material.dart';
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
                          'Are you sure you want to delete this order?',
                          style: theme.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Once deleted, this order cannot be recovered.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        ActionButtonsSection(
                          primaryBtnLabel: 'Delete Order',
                          secondaryBtnLabel: 'Keep Order',
                          onPrimaryBtnPressed: () {},
                          primaryBtnColor: Colors.red,
                          secondaryBtnColor: Colors.black,
                          primaryBtnTextColor: Colors.white,
                          secondaryBtnTextColor: Colors.white,
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
