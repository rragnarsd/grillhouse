import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class EditProductModal {
  static void show({required BuildContext context, required Widget child}) {
    final ThemeData theme = Theme.of(context);

    WoltModalSheet.show(
      context: context,
      modalTypeBuilder: (BuildContext context) => context.modalType,
      barrierDismissible: true,
      pageListBuilder: (BuildContext modalContext) =>
          <SliverWoltModalSheetPage>[
            SliverWoltModalSheetPage(
              backgroundColor: Colors.white,
              navBarHeight: 20,
              pageTitle: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      Constants.updateProduct,
                      style: theme.textTheme.headlineSmall,
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(modalContext).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              mainContentSliversBuilder: (BuildContext context) => <Widget>[
                child,
              ],
            ),
          ],
    );
  }
}
