import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const App());
}

class CardUsingBuilderContext extends StatelessWidget {
  const CardUsingBuilderContext({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // comps + default card margin 87 + 8
        mainAxisExtent: 95,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      cacheExtent: 0,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Center(
            child: Text(AppLocalizations.of(context)!.test),
          ),
        );
      },
    );
  }
}

class CardUsingWidgetContext extends StatelessWidget {
  const CardUsingWidgetContext({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // comps + default card margin 87 + 8
        mainAxisExtent: 95,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      cacheExtent: 0,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 4,
      itemBuilder: (BuildContext _, int index) {
        return Card(
          child: Center(
            child: Text(AppLocalizations.of(context)!.test),
          ),
        );
      },
    );
  }
}

class AppSettings extends ChangeNotifier {
  bool darkMode;

  AppSettings({
    this.darkMode = false,
  });

  void useDarkMode(bool value) {
    darkMode = value;
    notifyListeners();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('fr'),
      ],
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text(AppLocalizations.of(context)!.test)),
            body: Column(
              children: const <Widget>[
                // Broken
                CardUsingBuilderContext(),
                Divider(),
                // Working
                CardUsingWidgetContext(),
              ],
            ),
          );
        },
      ),
    );
  }
}
