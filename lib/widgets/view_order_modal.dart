import 'package:dashboard/screens/home/data/order_data.dart';
import 'package:dashboard/screens/home/widgets/home_order_table.dart';
import 'package:dashboard/utils/extensions.dart';
import 'package:dashboard/widgets/action_btn_section.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ViewOrderModal {
  static void show({required BuildContext context, required Order order}) {
    WoltModalSheet.show(
      context: context,
      modalTypeBuilder: (BuildContext c) => c.modalType,
      barrierDismissible: true,
      pageListBuilder: (BuildContext modalContext) =>
          <SliverWoltModalSheetPage>[
            SliverWoltModalSheetPage(
              backgroundColor: Colors.white,
              navBarHeight: 20,
              pageTitle: OrderHeader(
                onClose: () => Navigator.of(modalContext).pop(),
              ),
              mainContentSliversBuilder: (_) => <Widget>[
                const SliverToBoxAdapter(child: DividerSection()),
                const SliverPadding(
                  padding: EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(child: CustomerSection()),
                ),
                const SliverToBoxAdapter(child: DividerSection()),
                const SliverPadding(
                  padding: EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(child: OrderItemsSection()),
                ),
                const SliverToBoxAdapter(child: DividerSection()),
                const SliverPadding(
                  padding: EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(child: TotalSection()),
                ),
                const SliverToBoxAdapter(child: DividerSection()),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: ActionButtonsSection(
                      primaryBtnLabel: 'Refund Order',
                      secondaryBtnLabel: 'Track Order',
                      onPrimaryBtnPressed: () {},
                      primaryBtnColor: Colors.amber,
                      secondaryBtnColor: Colors.black,
                      primaryBtnTextColor: Colors.white,
                      secondaryBtnTextColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
    );
  }
}
