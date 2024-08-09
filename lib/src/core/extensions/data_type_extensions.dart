// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:todo_app/src/core/utils/enums.dart';

extension FormatAmount on num? {
  String get formatAmount {
    if (this == null) {
      return '';
    }
    return NumberFormat.currency(
      name: '',
      decimalDigits: isInteger(this!) ? 0 : 2,
    ).format(this);
  }

  bool isInteger(num value) => value is int || value == value.roundToDouble();
}

extension CurrencyText on num? {
  Widget getCurrencyText({
    Currency currency = Currency.NGN,
    TextStyle? style,
    int? maxLines,
  }) {
    final curr = switch (currency) {
      Currency.USD => r'$',
      Currency.NGN => '₦',
    };

    return Text.rich(
      TextSpan(
        text: '',
        children: [
          TextSpan(
            text: curr,
            style: style?.copyWith(
              fontFamily: '',
            ),
          ),
          TextSpan(
            text: formatAmount,
            style: style,
          ),
        ],
      ),
    );
  }
}

extension Group<T> on Iterable<T> {
  Groups<K, T> groupBy<K>(Function(T) key) {
    final map = <K, List<T>>{};
    for (final element in this) {
      final keyValue = key(element);
      if (!map.containsKey(keyValue)) {
        map[keyValue] = [];
      }
      map[keyValue]?.add(element);
    }
    return Groups(keys: map.keys.toList(), children: map.values.toList());
  }
}

class Groups<K, T> {
  List<K> keys;
  List<List<T>> children;

  Groups({
    required this.keys,
    required this.children,
  });

  @override
  String toString() {
    return 'Groups{keys: $keys, children: $children}';
  }
}
