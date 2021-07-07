# kaboshi_flutter_project

A new Flutter application.


第一步 

runApp(ProviderScope(child: MovieApp()));

第二步

final darkModeProvider = ChangeNotifierProvider<BackGroundColor>((ref) {
  return BackGroundColor();
});
class BackGroundColor extends ChangeNotifier {
  bool isDarkModeEnabled = true;

  void setLightMode() {
    isDarkModeEnabled = false;
    notifyListeners();
  }
  void setDarkMode() {
    isDarkModeEnabled = true;
    notifyListeners();
  }
}

第三步

@override
Widget build(BuildContext context) {
  
  final backGroundController = useProvider(darkModeProvider);
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Moview App with Riverpod Demo',
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: backGroundController.isDarkModeEnabled
        ? ThemeMode.dark
        : ThemeMode.light,
    home: HomeView(),
  );
}

第四步

class DarkModeSwitcher extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final darkModeStatusProvider = useProvider(darkModeProvider);
    return Switch(
      value: darkModeStatusProvider.isDarkModeEnabled,
      onChanged: (enabled) {
        if (enabled) {
          darkModeStatusProvider.setDarkMode();
        } else {
          darkModeStatusProvider.setLightMode();
        }
      },
    );
  }
}
