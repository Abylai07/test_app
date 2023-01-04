import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';
import '../../../data/repository/api/repo_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
            value: Intl.getCurrentLocale(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            iconEnabledColor: Colors.black,
            iconSize: 20,
             dropdownColor: Colors.blue,
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text('English'
                ),
              ),
              DropdownMenuItem(
                value: 'ru',
                child: Text('Русский'
                ),
              ),
            ],
            onChanged: (value) {
              if (value == null) return;
              if (value == 'ru') {
                S.load(
                  const Locale('ru'),
                );
                setState(() {});
              } else if (value == 'en') {
                S.load(
                  const Locale('en'),
                );
                setState(() {});
              }
              final repoSettings =
              Provider.of<RepoSettings>(context, listen: false);
              repoSettings.saveLocale(value);
            }),
      ),
    );
  }
}
