import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AppTextformField extends StatelessWidget {
  const AppTextformField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.validator,
    this.textInputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.autoFocus = false,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType textInputType;
  final TextInputAction inputAction;
  final bool autoFocus;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          height: 3,
          fontWeight: FontWeight.w400,
          color: Colors.grey.withValues(alpha: 0.8),
        ),
        prefix: prefixIcon != null
            ? null
            : const Padding(padding: EdgeInsets.only(left: 16.0)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        contentPadding: EdgeInsets.zero,
      ),
      maxLines: maxLines,
      onChanged: onChanged,
      validator: validator,
    );
  }
}

class LabeledTextFormField extends StatelessWidget {
  const LabeledTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
    this.textInputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.autoFocus = false,
    this.onChanged,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType textInputType;
  final TextInputAction inputAction;
  final int maxLines;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: <Widget>[
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        AppTextformField(
          hintText: hintText,
          controller: controller,
          validator: validator,
          textInputType: textInputType,
          inputAction: inputAction,
          maxLines: maxLines,
          autoFocus: autoFocus,
          onChanged: onChanged,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class LabeledDropdownField<T> extends StatefulWidget {
  const LabeledDropdownField({
    super.key,
    required this.label,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  final String label;
  final String hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final FormFieldValidator<T>? validator;

  @override
  State<LabeledDropdownField<T>> createState() =>
      _LabeledDropdownFieldState<T>();
}

class _LabeledDropdownFieldState<T> extends State<LabeledDropdownField<T>> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: <Widget>[
        Text(
          widget.label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        DropdownButtonFormField2<T>(
          value: widget.value,
          items: widget.items,
          validator: widget.validator,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: widget.hintText,
            hintStyle: theme.textTheme.bodyMedium,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          hint: Text(
            widget.hintText,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.withValues(alpha: 0.8),
            ),
          ),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
