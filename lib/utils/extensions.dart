import 'package:flutter/material.dart';
import 'package:grill_house/utils/enums.dart';
import 'package:grill_house/utils/responsive.dart';
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

extension DateFormattingExtension on DateTime? {
  String toReadableDate({String fallback = 'Select Date'}) {
    if (this == null) return fallback;
    return DateFormat('d MMMM yyyy').format(this!);
  }
}

extension DateFormatting on DateTime {
  String toDdMmYy() {
    final DateTime localDate = toLocal();
    final String day = localDate.day.toString().padLeft(2, '0');
    final String month = localDate.month.toString().padLeft(2, '0');
    final String year = (localDate.year % 100).toString().padLeft(2, '0');

    return '$day/$month/$year';
  }
}
