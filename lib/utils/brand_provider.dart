import 'package:flutter/foundation.dart';

class BrandProvider {
  static const String name = String.fromEnvironment('FLAVOR');

  static T brandedValue<T>({
    required T cocaCola,
    required T pepsi,
    required T fanta,
  }) =>
      brandedValueOrDefault(
        cocaCola: () => cocaCola,
        pepsi: () => pepsi,
        fanta: () => fanta,
        orDefault: () => throw 'Flavor ($name) not found',
      );

  static T brandedValueOrDefault<T>({
    required ValueGetter<T> orDefault,
    ValueGetter<T>? cocaCola,
    ValueGetter<T>? pepsi,
    ValueGetter<T>? fanta,
  }) =>
      switch (name) {
        'cocacola' when cocaCola != null => cocaCola(),
        'pepsi' when pepsi != null => pepsi(),
        'fanta' when fanta != null => fanta(),
        _ => orDefault(),
      };
}
