// Flutter imports:
import 'package:flutter/material.dart';

class AppRouter {
  static const String login = '/login';
  static const String onboarding = '/onboarding';
  static const String dashboard = '/dashboard';
  static const String signUp = '/sign_up';
  static const String profile = '/profile';
  static const String editProfile = '/edit_profile';
  static const String changePassword = '/change_password';
  static const String newPassword = '/new_password';
  static const String numberVerification = '/number_verification';
  static const String setupLocation = '/setup_location';
  static const String forgotPassword = '/forgot_password';
  static const String otpVerification = '/otp_verification';
  static const String resetPassword = '/reset_password';
  static const String cardManagement = '/card_management';
  static const String offerScreen = '/offer_screen';
  static const String menuSelection = '/menu_selection';
  static const String mealDetailScreen = '/meal_detail_screen';
  static const String searchPage = '/search_page';
  static const String cartScreen = '/cart_screen';
  static const String checkout = '/checkout';
  static const String paymentCheckout = '/payment_checkout';
  static const String orderSuccessPage = '/order_success_page';
  static const String savedPage = '/saved_page';
  static const String orderDetails = '/order_details';
  static const String newPassOtp = '/new_password_otp_verify';
  static const String setNewLocation = '/set_new_location';
  static const String changeAddress = '/change_address';
  static const String review = 'review';
  static const String chefDetails = 'chef_details';
  static const String viewCart = 'view_cart';
  static const String changeCheck = 'change_checkout_address';
  static const String support = 'support';

  static final Map<String, Widget Function(BuildContext)> _routes = {
    // onboarding: (context) => const OnboardingScreen(),
    // login: (context) => SignInPage(
    //       verificationArguments:
    //           ModalRoute.of(context)!.settings.arguments as (String, String)?,
    //     ),
    // dashboard: (context) => const Dashboard(),
    // signUp: (context) => const SignUpPage(),
    // profile: (context) => const ProfilePage(),
    // editProfile: (context) => const EditProfile(),
    // changePassword: (context) => const ChangePassword(),
    // numberVerification: (context) => NumberVerification(
    //       args: ModalRoute.of(context)!.settings.arguments as VerificationArgs,
    //     ),
    // setupLocation: (context) => const SetupLocation(),
    // forgotPassword: (context) => const ForgotPasswordPage(),
    // otpVerification: (context) => OTPVerificationPage(
    //       identifier: ModalRoute.of(context)!.settings.arguments as String,
    //     ),
    // resetPassword: (context) => ResetPasswordPage(
    //       info: ModalRoute.of(context)!.settings.arguments as (String, String),
    //     ),
    // newPassword: (context) => NewPassword(
    //       info: ModalRoute.of(context)!.settings.arguments as (String, String),
    //     ),
    // cardManagement: (context) => const CardManagement(),
    // offerScreen: (context) => const OfferScreen(),
    // menuSelection: (context) => MenuSelection(
    //       meal: ModalRoute.of(context)!.settings.arguments as MealModel,
    //     ),
    // searchPage: (context) => SearchPage(
    //       searchChef: ModalRoute.of(context)!.settings.arguments as bool,
    //     ),
    // cartScreen: (context) => const CartScreen(),
    // checkout: (context) => const Checkout(),
    // paymentCheckout: (context) => PaymentCheckout(
    //       data: ModalRoute.of(context)!.settings.arguments as (
    //         String,
    //         void Function()
    //       ),
    //     ),
    // orderSuccessPage: (context) => const OrderSuccessPage(),
    // savedPage: (context) => const SavedPage(),
    // orderDetails: (context) => const OrderDetails(),
    // newPassOtp: (context) => NewPasswordOtp(
    //       phoneNumber: ModalRoute.of(context)!.settings.arguments as String,
    //     ),
    // setNewLocation: (context) => SetNewLocation(
    //       isCheck: ModalRoute.of(context)!.settings.arguments as bool,
    //     ),
    // changeAddress: (context) => const ChangeAddress(),
    // review: (context) => Review(
    //       args: ModalRoute.of(context)!.settings.arguments as ReviewArgs,
    //     ),
    // chefDetails: (context) =>
    //     ChefDetails(id: ModalRoute.of(context)!.settings.arguments as String),
    // viewCart: (context) => ViewCart(
    //       item: ModalRoute.of(context)!.settings.arguments as CartItem,
    //     ),
    // support: (context) => const Support()
  };

  static Map<String, Widget Function(BuildContext)> get routes => _routes;
}
