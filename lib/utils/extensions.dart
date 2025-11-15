import 'package:dashboard/utils/enums.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

extension ListChunkExtension<T> on List<T> {
  List<List<T>> chunked(int size) {
    if (size <= 0) throw ArgumentError('Chunk size must be greater than 0');

    final List<List<T>> chunks = <List<T>>[];
    for (int i = 0; i < length; i += size) {
      final int end = (i + size < length) ? i + size : length;
      chunks.add(sublist(i, end));
    }
    return chunks;
  }
}

extension ServingEnum on ServingUnit {
  String get label => name[0].toUpperCase() + name.substring(1);
}

extension ModalTypeExtension on BuildContext {
  WoltModalType get modalType => Responsive.isMobile(this)
      ? WoltModalType.bottomSheet()
      : Responsive.isTablet(this)
      ? WoltModalType.dialog()
      : WoltModalType.sideSheet();
}

extension DateFormatting on DateTime? {
  String toReadableDate({String fallback = 'Select Date'}) {
    if (this == null) return fallback;
    return DateFormat('d MMMM yyyy').format(this!);
  }
}
