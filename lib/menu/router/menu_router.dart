
import 'package:go_router/go_router.dart';
import 'package:po_obligatoria_t3_tenis/screens/home_screen.dart';
import 'package:po_obligatoria_t3_tenis/screens/matches_screen.dart';
import 'package:po_obligatoria_t3_tenis/screens/splash_screen.dart';



final appRouter =GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/',
    builder:(context, state) => const SplashScreen(),
    ),
    GoRoute(path: '/home',
    builder:(context, state) => const HomeScreen(),
    ),
    GoRoute(path: '/matches',
    builder:(context, state) =>  MatchesScreen(),
    ),
  ],
  );