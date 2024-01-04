import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_user_app_flutter/auth/auth_service.dart';
import 'package:firebase_user_app_flutter/pages/cart_page.dart';
import 'package:firebase_user_app_flutter/pages/checkout_page.dart';
import 'package:firebase_user_app_flutter/pages/login_page.dart';
import 'package:firebase_user_app_flutter/pages/order_page.dart';
import 'package:firebase_user_app_flutter/pages/telescope_details_page.dart';
import 'package:firebase_user_app_flutter/pages/user_profile_page.dart';
import 'package:firebase_user_app_flutter/pages/view_telescope_page.dart';
import 'package:firebase_user_app_flutter/providers/cart_provider.dart';
import 'package:firebase_user_app_flutter/providers/order_provider.dart';
import 'package:firebase_user_app_flutter/providers/telescope_provider.dart';
import 'package:firebase_user_app_flutter/providers/user_provider.dart';
import 'package:firebase_user_app_flutter/utils/color.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => TelescopeProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
        colorScheme: base.colorScheme.copyWith(
          primary: kShrinePink400,
          onPrimary: kShrineBrown900,
          secondary: kShrineBrown900,
          error: kShrineErrorRed,
        ),
        textTheme: _buildShrineTextTheme(GoogleFonts.ralewayTextTheme()),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: kShrinePink100,
        )
    );
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base.copyWith(
      headlineSmall: base.headlineSmall!.copyWith(
        fontWeight: FontWeight.w500,
      ),
      titleLarge: base.titleLarge!.copyWith(
        fontSize: 18.0,
      ),
      bodySmall: base.bodySmall!.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
      bodyLarge: base.bodySmall!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    ).apply(
      displayColor: kShrineBrown900,
      bodyColor: kShrineBrown900,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _buildShrineTheme(),
      builder: EasyLoading.init(),
      routerConfig: _router,
    );
  }
  final _router = GoRouter(
      initialLocation: ViewTelescopePage.routeName,
      debugLogDiagnostics: true,
      redirect: (context, state) {
        if(AuthService.currentUser == null) {
          return LoginPage.routeName;
        }
        return null;
      },
      routes: [
        GoRoute(
          name: LoginPage.routeName,
          path: LoginPage.routeName,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
            name: ViewTelescopePage.routeName,
            path: ViewTelescopePage.routeName,
            builder: (context, state) => const ViewTelescopePage(),
            routes: [
              GoRoute(
                name: TelescopeDetailsPage.routeName,
                path: TelescopeDetailsPage.routeName,
                builder: (context, state) => TelescopeDetailsPage(id: state.extra! as String,),

              ),
              GoRoute(
                name: UserProfilePage.routeName,
                path: UserProfilePage.routeName,
                builder: (context, state) => const UserProfilePage(),

              ),
              GoRoute(
                name: OrderPage.routeName,
                path: OrderPage.routeName,
                builder: (context, state) => const OrderPage(),

              ),
              GoRoute(
                  name: CartPage.routeName,
                  path: CartPage.routeName,
                  builder: (context, state) => const CartPage(),
                  routes: [
                    GoRoute(
                      name: CheckoutPage.routeName,
                      path: CheckoutPage.routeName,
                      builder: (context, state) => const CheckoutPage(),
                    ),
                  ]
              ),
            ]
        ),
      ]
  );
}


