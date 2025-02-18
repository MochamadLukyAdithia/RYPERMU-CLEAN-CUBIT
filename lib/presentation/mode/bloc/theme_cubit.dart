import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeIndex = json['themeIndex'] as int?;
    if (themeIndex == null) return ThemeMode.dark;
    return ThemeMode.values[themeIndex];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'themeIndex': state.index};
  }
}
