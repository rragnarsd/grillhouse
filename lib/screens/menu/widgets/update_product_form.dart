import 'package:dashboard/screens/menu/data/menu_data.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/enums.dart';
import 'package:dashboard/utils/extensions.dart';
import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:dashboard/widgets/app_textform_field.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';

class UpdateProductForm extends StatefulWidget {
  const UpdateProductForm({super.key, this.product});

  final MenuItem? product;

  @override
  State<UpdateProductForm> createState() => _UpdateProductFormState();
}

class _UpdateProductFormState extends State<UpdateProductForm> {
  late final TextEditingController productNameController;
  late final TextEditingController priceController;
  late final TextEditingController descriptionController;
  ServingUnit? selectedUnit;

  @override
  void initState() {
    super.initState();
    productNameController = TextEditingController(
      text: widget.product?.name ?? '',
    );
    priceController = TextEditingController(
      text: widget.product?.price.toStringAsFixed(2) ?? '',
    );
    descriptionController = TextEditingController(
      text: widget.product?.description ?? '',
    );
    selectedUnit = widget.product?.servingUnit;
  }

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
                  label: Constants.updateProduct,
                  bgColor: AppColors.secondary,
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
