import 'package:go_router/go_router.dart';
import 'package:web_config/config/menu/menu_items.dart';
import 'package:web_config/presentation/screens/appbar_screen.dart';
import 'package:web_config/presentation/screens/config_screen.dart';
import 'package:web_config/presentation/screens/home_screen.dart';
import 'package:web_config/presentation/screens/rutas_screen.dart';
import 'package:web_config/presentation/screens/splash_screen.dart';
import 'package:web_config/presentation/screens/theme_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/', routes: [
  GoRoute(
      path: '/home',
      builder: (context, state) {
        final List<MenuItem> menuItems = state.extra! as List<MenuItem>;
        return HomeScreen(menuOptions: menuItems);
      }
      ),
  GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
  GoRoute(path: '/rutas', builder: (context, state) => const RutasScreen()),
  GoRoute(path: '/appbar', builder: (context, state) => const AppbarScreen()),
  GoRoute(path: '/theme', builder: (context, state) => const ThemeScreen()),
  GoRoute(path: '/config', builder: (context, state) => const ConfigScreen())
]);
