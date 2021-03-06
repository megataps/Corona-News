import 'package:flutter/material.dart';
import '../../../cubits/theme_cubit/theme_cubit.dart';
// import '../../../cubits/localization_cubit/localization_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constants/language_keys.dart';
import '../../../utils/extensions/translator.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              LanguageKeys.change_language.translate(context),
            ),
          ),
          Divider(),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) => SwitchListTile(
              onChanged: (bool enabled) =>
                  context.bloc<ThemeCubit>().changeTheme(
                        themeState.themeMode != ThemeMode.dark,
                      ),
              value: themeState.themeMode == ThemeMode.dark,
              title: Text(
                LanguageKeys.dark_mode.translate(context),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
