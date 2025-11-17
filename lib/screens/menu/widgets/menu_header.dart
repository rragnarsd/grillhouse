import 'package:dashboard/screens/menu/data/menu_data.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/enums.dart';
import 'package:dashboard/utils/extensions.dart';
import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:dashboard/widgets/app_textform_field.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '${Constants.totalItems}${MenuData.items.length}',
          style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
        ),
        PrimaryElevatedIconBtn(
          onPressed: () => _addNewProduct(context),
          icon: Icons.add,
          btnLabel: Constants.addNewProduct,
          backgroundColor: AppColors.secondary.withValues(alpha: 0.8),
          textColor: Colors.white,
        ),
      ],
    );
  }

  void _addNewProduct(BuildContext context) {
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
                child: Text(
                  Constants.addNewProduct,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              mainContentSliversBuilder: (BuildContext context) => <Widget>[
                const AddProductForm(),
              ],
            ),
          ],
    );
  }
}

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  ServingUnit? selectedUnit;

  @override
  void dispose() {
    productNameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              LabeledTextFormField(
                label: Constants.productName,
                hintText: Constants.productHint,
                controller: productNameController,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: LabeledTextFormField(
                      label: Constants.price,
                      hintText: '\$${Constants.productPrice}',
                      controller: priceController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: LabeledDropdownField<ServingUnit>(
                      label: Constants.servingUnit,
                      hintText: Constants.unitHint,
                      value: selectedUnit,
                      items: ServingUnit.values
                          .map(
                            (ServingUnit unit) => DropdownMenuItem<ServingUnit>(
                              value: unit,
                              child: Text(unit.label),
                            ),
                          )
                          .toList(),
                      onChanged: (ServingUnit? value) =>
                          setState(() => selectedUnit = value),
                    ),
                  ),
                ],
              ),
              LabeledTextFormField(
                label: Constants.description,
                hintText: Constants.descriptionHint,
                controller: descriptionController,
              ),
              SizedBox(
                width: double.infinity,
                child: PrimaryBtn(
                  onClick: () {},
                  label: Constants.addProduct,
                  bgColor: Colors.green,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
