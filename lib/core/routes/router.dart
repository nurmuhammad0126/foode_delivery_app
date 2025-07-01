import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/features/auth/presentation/pages/on_boarding_screen.dart';
import 'package:task_for_uicgroup/features/auth/presentation/pages/set_loacation_screen.dart';
import 'package:task_for_uicgroup/features/auth/presentation/pages/uploade_image_screen.dart';
import 'package:task_for_uicgroup/features/auth/presentation/pages/verifiy_bio_screen.dart';
import 'package:task_for_uicgroup/features/chat/presentation/pages/chats_screen.dart';
import 'package:task_for_uicgroup/features/home/presentation/pages/filter_find_food_screen.dart';
import 'package:task_for_uicgroup/features/home/presentation/pages/home_notification_screen.dart';
import 'package:task_for_uicgroup/features/home/presentation/pages/popular_restoran_scree.dart';

// AUTH SCREENS
import '../../features/auth/presentation/pages/splash_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/register_screen.dart';
import '../../features/auth/presentation/pages/forget_password_screen.dart';
import '../../features/auth/presentation/pages/forget_password_otp_screen.dart';
import '../../features/auth/presentation/pages/reset_password_screen.dart';
import '../../features/auth/presentation/pages/payment_type_screen.dart';
import '../../features/auth/presentation/pages/congrats_screen.dart';

// HOME SCREENS
import '../../features/chat/presentation/pages/promo_screen.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/home/presentation/pages/find_food_screen.dart';
import '../../features/home/presentation/pages/popular_menu_screen.dart';

// CHAT SCREENS
import '../../features/chat/presentation/pages/chat_screen.dart';
import '../../features/chat/presentation/pages/chat_calling_screen.dart';
import '../../features/chat/presentation/pages/driver_rating_screen.dart';
import '../../features/chat/presentation/pages/meal_rating_screen.dart';
import '../../features/chat/presentation/pages/restaurant_screen.dart';

// ORDER SCREENS
import '../../features/orders/presentation/pages/order_history_screen.dart';
import '../../features/orders/presentation/pages/deliver_to_screen.dart';
import '../../features/orders/presentation/pages/favorite_screen.dart';
import '../../features/orders/presentation/pages/order_details_screen.dart';
import '../../features/orders/presentation/pages/order_location_screen.dart';
import '../../features/orders/presentation/pages/payment_method_screen.dart';
import '../../features/orders/presentation/pages/restaurant_profile_screen.dart';

// MAIN SHELL
import '../../features/main_screen.dart';
import '../../features/orders/presentation/pages/testimonials_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';

/// GoRouter konfiguratsiyasi
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutesNames.home,
  debugLogDiagnostics: true,

  // Redirect funksiyasi - Foydalanuvchi holatini tekshirish uchun
  // redirect: (BuildContext context, GoRouterState state) {
  //   // Bu yerda authentication logikangizni yozing
  //   // Masalan: agar user login qilmagan bo'lsa, login sahifasiga yo'naltirish

  //   final bool isLoggedIn = false; // Bu yerda real authentication holatini tekshiring
  //   final bool isOnboarded = true; // Onboarding holati

  //   final String currentPath = state.fullPath ?? '';

  //   // Agar splash screen'da bo'lsa
  //   if (currentPath == AppRoutesNames.splash) {
  //     return null; // Splash screen'ni ko'rsatish
  //   }

  //   // Agar onboarding qilinmagan bo'lsa
  //   if (!isOnboarded && currentPath != AppRoutesNames.onboarding) {
  //     return AppRoutesNames.onboarding;
  //   }

  //   // Agar login qilinmagan bo'lsa va auth route'da emas bo'lsa
  //   if (!isLoggedIn && !_isAuthRoute(currentPath)) {
  //     return AppRoutesNames.login;
  //   }

  //   // Agar login qilingan bo'lsa va auth route'da bo'lsa
  //   if (isLoggedIn && _isAuthRoute(currentPath)) {
  //     return AppRoutesNames.home;
  //   }

  //   return null; // Redirect qilmaslik
  // },
  routes: [
    // 🔰 SPLASH SCREEN
    GoRoute(
      path: AppRoutesNames.splash,
      name: AppRoutesNames.splash,
      builder: (context, state) => const SplashPage(),
    ),

    // 🧑‍🏫 ONBOARDING SCREEN
    GoRoute(
      path: AppRoutesNames.onboarding,
      name: AppRoutesNames.onboarding,
      builder: (context, state) => const OnBoardingScreen(),
    ),

    // 🔐 AUTHENTICATION ROUTES
    GoRoute(
      path: AppRoutesNames.login,
      name: AppRoutesNames.login,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.register,
      name: AppRoutesNames.register,
      builder: (context, state) => const RegisterScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.forgetPassword,
      name: AppRoutesNames.forgetPassword,
      builder: (context, state) => const ForgetPasswordScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.forgetPasswordOtp,
      name: AppRoutesNames.forgetPasswordOtp,
      builder: (context, state) => const ForgetPasswordOtpScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.resetPassword,
      name: AppRoutesNames.resetPassword,
      builder: (context, state) => const ResetPasswordScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.setLocation,
      name: AppRoutesNames.setLocation,
      builder: (context, state) => const SetLocationScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.uploadImage,
      name: AppRoutesNames.uploadImage,
      builder: (context, state) => const UploadImageScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.verifyBio,
      name: AppRoutesNames.verifyBio,
      builder: (context, state) => const VerifiyBioScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.paymentType,
      name: AppRoutesNames.paymentType,
      builder: (context, state) => const PaymentTypeScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.congrats,
      name: AppRoutesNames.congrats,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return CongratsScreen(
          onTap: data["onTap"],
          title1: data["title1"],
          title2: data["title2"],
        );
      },
    ),
    GoRoute(
      path: AppRoutesNames.findFood,
      name: AppRoutesNames.findFood,
      builder: (context, state) {
        final data = state.extra as bool?;
        return FindFoodScreen(isMeal: data ?? false);
      },
    ),

    GoRoute(
      path: AppRoutesNames.chatCalling,
      name: AppRoutesNames.chatCalling,
      builder: (context, state) => const ChatCallingScreen(),
    ),
    GoRoute(
      path: AppRoutesNames.chat,
      name: AppRoutesNames.chat,
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: AppRoutesNames.driverRating,
      name: AppRoutesNames.driverRating,
      builder: (context, state) => const DriverRatingScreen(),
    ),
    GoRoute(
      path: AppRoutesNames.mealRating,
      name: AppRoutesNames.mealRating,
      builder: (context, state) => const MealRatingScreen(),
    ),
    GoRoute(
      path: AppRoutesNames.restaurant,
      name: AppRoutesNames.restaurant,
      builder: (context, state) => const RestaurantScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.deliverTo,
      name: AppRoutesNames.deliverTo,
      builder: (context, state) => const DeliverToScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.orderDetails,
      name: AppRoutesNames.orderDetails,
      builder: (context, state) => const OrderDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutesNames.orderLocation,
      name: AppRoutesNames.orderLocation,
      builder: (context, state) => const OrderLocationScreen(),
    ),
    GoRoute(
      path: AppRoutesNames.testimonials,
      name: AppRoutesNames.testimonials,
      builder: (context, state) => const TestimonialsScreen(),
    ),
    GoRoute(
      path: AppRoutesNames.paymentMethod,
      name: AppRoutesNames.paymentMethod,
      builder: (context, state) => const PaymentMethodScreen(),
    ),
    GoRoute(
      path: AppRoutesNames.restaurantProfile,
      name: AppRoutesNames.restaurantProfile,
      builder: (context, state) => const RestaurantProfileScreen(),
    ),
    GoRoute(
      path: AppRoutesNames.promo,
      name: AppRoutesNames.promo,
      builder: (context, state) => const PromoScreen(),
    ),

    // ✅ MAIN SHELL ROUTE (Bottom Navigation)
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        // 🏠 HOME BRANCH
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesNames.home,
              name: AppRoutesNames.home,
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: AppRoutesNames.findFoodFilter,
                  name: AppRoutesNames.findFoodFilter,
                  builder: (context, state) {
                    final data = state.extra as Map<String, dynamic>;
                    return FilterFindFoodScreen(
                      isMeals: data["isMeals"],
                      selected: data["selected"],
                    );
                  },
                ),
                GoRoute(
                  path: AppRoutesNames.notification,
                  name: AppRoutesNames.notification,
                  builder: (context, state) => const HomeNotificationScreen(),
                ),
                GoRoute(
                  path: AppRoutesNames.popularMenu,
                  name: AppRoutesNames.popularMenu,
                  builder: (context, state) => const PopularMenuScreen(),
                ),
                GoRoute(
                  path: AppRoutesNames.popularRestaurant,
                  name: AppRoutesNames.popularRestaurant,
                  builder: (context, state) => const PopularRestoranScreen(),
                ),
              ],
            ),
          ],
        ),

        // 📦 ORDERS BRANCH
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesNames.orders,
              name: AppRoutesNames.orders,
              builder: (context, state) => const OrderHistoryScreen(),
              routes: [
                GoRoute(
                  path: AppRoutesNames.favorites,
                  name: AppRoutesNames.favorites,
                  builder: (context, state) => const FavoriteScreen(),
                ),
              ],
            ),
          ],
        ),
        // 💬 CHAT BRANCH
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesNames.chatsList,
              name: AppRoutesNames.chatsList,
              builder: (context, state) => const ChatsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesNames.profile,
              name: AppRoutesNames.profile,
              builder: (context, state) => const ProfileScreen(),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],

  // Error sahifasi
  errorBuilder:
      (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Sahifa topilmadi!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Path: ${state.fullPath}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go(AppRoutesNames.home),
                child: const Text('Bosh sahifaga qaytish'),
              ),
            ],
          ),
        ),
      ),
);

// bool _isAuthRoute(String path) {
//   const authRoutes = [
//     AppRoutesNames.login,
//     AppRoutesNames.register,
//     AppRoutesNames.forgetPassword,
//     AppRoutesNames.forgetPasswordOtp,
//     AppRoutesNames.resetPassword,
//     AppRoutesNames.setLocation,
//     AppRoutesNames.uploadImage,
//     AppRoutesNames.verifyBio,
//     AppRoutesNames.paymentType,
//     AppRoutesNames.congrats,
//   ];

//   return authRoutes.any((route) => path.startsWith(route));
// }

// Navigation helper funksiyalari
extension AppRouterExtension on BuildContext {
  // Go to route
  void goToRoute(String route) => go(route);

  // Push route
  void pushRoute(String route) => push(route);

  // Replace route
  void replaceRoute(String route) => pushReplacement(route);

  // Go back
  void goBack() => pop();

  // Go to home
  void goToHome() => go(AppRoutesNames.home);

  // Go to login
  void goToLogin() => goNamed(AppRoutesNames.login);

  // Go to register
  void goToRegister() => go(AppRoutesNames.register);
}
