import 'package:daone/presentation/dashboard/binding/dashboard_binding.dart';
import 'package:daone/presentation/dashboard/view/dashboard_view.dart';
import 'package:daone/presentation/own_affirmation_screen/view/own_affirmation_view.dart';
import 'package:daone/presentation/prosperity_affirmation/view/prosperity_affirmation_view.dart';
import 'package:daone/presentation/sleep_tracking_section/binding/sleep_tracking_binding.dart';
import 'package:daone/presentation/sleep_tracking_section/view/sleep_tracking_view.dart';
import 'package:daone/presentation/welcome_screen_one_screen/welcome_screen_one_screen.dart';
import 'package:daone/presentation/welcome_screen_one_screen/binding/welcome_screen_one_binding.dart';
import 'package:daone/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:daone/presentation/onboarding_one_screen/binding/onboarding_one_binding.dart';
import 'package:daone/presentation/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:daone/presentation/onboarding_two_screen/binding/onboarding_two_binding.dart';
import 'package:daone/presentation/onboarding_three_screen/onboarding_three_screen.dart';
import 'package:daone/presentation/onboarding_three_screen/binding/onboarding_three_binding.dart';
import 'package:daone/presentation/onboarding_four_screen/onboarding_four_screen.dart';
import 'package:daone/presentation/onboarding_four_screen/binding/onboarding_four_binding.dart';
import 'package:daone/presentation/register_page_one_screen/register_page_one_screen.dart';
import 'package:daone/presentation/register_page_one_screen/binding/register_page_one_binding.dart';
import 'package:daone/presentation/success_registration_screen/success_registration_screen.dart';
import 'package:daone/presentation/success_registration_screen/binding/success_registration_binding.dart';
import 'package:daone/presentation/login_page_screen/login_page_screen.dart';
import 'package:daone/presentation/login_page_screen/binding/login_page_binding.dart';
import 'package:daone/presentation/daily_intension_record_screen/daily_intension_record_screen.dart';
import 'package:daone/presentation/daily_intension_record_screen/binding/daily_intension_record_binding.dart';
import 'package:daone/presentation/recording_screen/recording_screen.dart';
import 'package:daone/presentation/recording_screen/binding/recording_binding.dart';
import 'package:daone/presentation/reminders_screen/reminders_screen.dart';
import 'package:daone/presentation/reminders_screen/binding/reminders_binding.dart';
import 'package:daone/presentation/daily_intension_record_one_screen/daily_intension_record_one_screen.dart';
import 'package:daone/presentation/daily_intension_record_one_screen/binding/daily_intension_record_one_binding.dart';
import 'package:daone/presentation/update_reminders_screen/update_reminders_screen.dart';
import 'package:daone/presentation/update_reminders_screen/binding/update_reminders_binding.dart';
import 'package:daone/presentation/complete_screen/complete_screen.dart';
import 'package:daone/presentation/complete_screen/binding/complete_binding.dart';
import 'package:daone/presentation/home_one_screen/home_one_screen.dart';
import 'package:daone/presentation/home_one_screen/binding/home_one_binding.dart';
import 'package:daone/presentation/select_affirmation_screen/select_affirmation_screen.dart';
import 'package:daone/presentation/select_affirmation_screen/binding/select_affirmation_binding.dart';
import 'package:daone/presentation/home_no_task_screen/home_no_task_screen.dart';
import 'package:daone/presentation/home_no_task_screen/binding/home_no_task_binding.dart';
import 'package:daone/presentation/select_task_screen/select_task_screen.dart';
import 'package:daone/presentation/select_task_screen/binding/select_task_binding.dart';
import 'package:daone/presentation/view_all_task_tab_container_screen/view_all_task_tab_container_screen.dart';
import 'package:daone/presentation/view_all_task_tab_container_screen/binding/view_all_task_tab_container_binding.dart';
import 'package:daone/presentation/task_empty_screen/task_empty_screen.dart';
import 'package:daone/presentation/task_empty_screen/binding/task_empty_binding.dart';
import 'package:daone/presentation/congratulations_page_screen/congratulations_page_screen.dart';
import 'package:daone/presentation/congratulations_page_screen/binding/congratulations_page_binding.dart';
import 'package:daone/presentation/stats_screen/stats_screen.dart';
import 'package:daone/presentation/stats_screen/binding/stats_binding.dart';
import 'package:daone/presentation/sleep_tracker_screen/sleep_tracker_screen.dart';
import 'package:daone/presentation/sleep_tracker_screen/binding/sleep_tracker_binding.dart';
import 'package:daone/presentation/blog_screen/blog_screen.dart';
import 'package:daone/presentation/blog_screen/binding/blog_binding.dart';
import 'package:daone/presentation/comment_section_screen/comment_section_screen.dart';
import 'package:daone/presentation/comment_section_screen/binding/comment_section_binding.dart';
import 'package:daone/presentation/add_friends_screen/add_friends_screen.dart';
import 'package:daone/presentation/add_friends_screen/binding/add_friends_binding.dart';
import 'package:daone/presentation/view_friends_tab_container_screen/view_friends_tab_container_screen.dart';
import 'package:daone/presentation/view_friends_tab_container_screen/binding/view_friends_tab_container_binding.dart';
import 'package:daone/presentation/account_setting_screen/account_setting_screen.dart';
import 'package:daone/presentation/account_setting_screen/binding/account_setting_binding.dart';
import 'package:daone/presentation/personal_data_update_two_screen/personal_data_update_two_screen.dart';
import 'package:daone/presentation/personal_data_update_two_screen/binding/personal_data_update_two_binding.dart';
import 'package:daone/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:daone/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';
import '../presentation/add_task_screen/add_task_screen.dart';
import '../presentation/add_task_screen/binding/add_task_binding.dart';
import '../presentation/badges/binding/personal_data_update_binding.dart';
import '../presentation/badges/personal_data_update_screen.dart';
import '../presentation/gratitude_affirmation/binding/gratitude_affirmation_binding.dart';
import '../presentation/gratitude_affirmation/view/gratitude_affirmation_view.dart';
import '../presentation/highlights/binding/personal_data_update_one_binding.dart';
import '../presentation/highlights/personal_data_update_one_screen.dart';
import '../presentation/love_affirmation/binding/love_affirmation_binding.dart';
import '../presentation/love_affirmation/view/love_affirmation.dart';
import '../presentation/own_affirmation_screen/binding/own_affirmation_binding.dart';
import '../presentation/personal_data_update_two_screen/change_password.dart';
import '../presentation/prosperity_affirmation/binding/prosperityAffirmationBinding.dart';
import '../presentation/self_confidence_affirmation/binding/self_confidence_binding.dart';
import '../presentation/self_confidence_affirmation/view/self_confidence_view.dart';

class AppRoutes {
  static const String welcomeScreenOneScreen = '/welcome_screen_one_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String onboardingFourScreen = '/onboarding_four_screen';

  static const String registerPageOneScreen = '/register_page_one_screen';

  static const String successRegistrationScreen =
      '/success_registration_screen';

  static const String loginPageScreen = '/login_page_screen';

  static const String homeScreen = '/home_screen';

  static const String dailyIntensionRecordScreen =
      '/daily_intension_record_screen';

  static const String recordingScreen = '/recording_screen';

  static const String remindersScreen = '/reminders_screen';

  static const String dailyIntensionRecordOneScreen =
      '/daily_intension_record_one_screen';

  static const String updateRemindersScreen = '/update_reminders_screen';

  static const String completeScreen = '/complete_screen';

  static const String homeOneScreen = '/home_one_screen';

  static const String selectAffirmationScreen = '/select_affirmation_screen';

  static const String homeNoTaskScreen = '/home_no_task_screen';

  static const String selectTaskScreen = '/select_task_screen';

  static const String addTaskScreen = '/add_task_screen';

  static const String viewAllTaskPage = '/view_all_task_page';

  static const String viewAllTaskTabContainerScreen =
      '/view_all_task_tab_container_screen';

  static const String taskEmptyScreen = '/task_empty_screen';

  static const String congratulationsPageScreen =
      '/congratulations_page_screen';

  static const String statsScreen = '/stats_screen';

  static const String sleepTrackerScreen = '/sleep_tracker_screen';

  static const String blogScreen = '/blog_screen';

  static const String latestBlogScreen = '/latest_blog_screen';

  static const String latestBlogOneScreen = '/latest_blog_one_screen';

  static const String communityPage = '/community_page';

  static const String communityTabContainerScreen =
      '/community_tab_container_screen';

  static const String commentSectionScreen = '/comment_section_screen';

  static const String addFriendsScreen = '/add_friends_screen';

  static const String viewFriendsOnePage = '/view_friends_one_page';

  static const String viewFriendFullProfilePage =
      '/view_friend_full_profile_page';

  static const String viewFriendsPage = '/view_friends_page';

  static const String viewFriendsTabContainerScreen =
      '/view_friends_tab_container_screen';

  static const String accountSettingScreen = '/account_setting_screen';

  static const String personalDataUpdateTwoScreen =
      '/personal_data_update_two_screen';

  static const String personalDataUpdateScreen = '/personal_data_update_screen';

  static const String personalDataUpdateOneScreen =
      '/personal_data_update_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String dashboardRoute = '/dashboardRoute';

  static const String ownAffirmationRoute ='/ownAffirmation';

  static const String loveAffirmationRoute ='/loveAffirmation';

  static const String prosperityAffirmationRoute ='/prosperityAffirmation';

  static const String gratitudeAffirmationRoute ='/gratitudeAffirmation';

  static const String selfAffirmationRoute ='/selfAffirmation';

  static const String changePasswordRoute ='/changePass';

  static const String sleepTrackingRoute ='/sleepTracking';



  static List<GetPage> pages = [
    GetPage(
      name: dashboardRoute,
      page: () => MyDashBoard(),
      bindings: [
        DashBoardBinding(),
      ],
    ),
    GetPage(
      name: welcomeScreenOneScreen,
      page: () => WelcomeScreenOneScreen(),
      bindings: [
        WelcomeScreenOneBinding(),
      ],
    ), GetPage(
      name: changePasswordRoute,
      page: () => PasswordUpdateScreen(),
      bindings: [
        PersonalDataUpdateTwoBinding(),
      ],
    ),
    GetPage(
      name: prosperityAffirmationRoute,
      page: () => ProsperityAffirmationView(),
      bindings: [
        ProsperityAffirmationBinding(),
      ],
    ),
    GetPage(
      name: sleepTrackingRoute,
      page: () => SleepTrackingView(),
      bindings: [
        SleepTrackingBinding(),
      ],
    ),
    GetPage(
      name: gratitudeAffirmationRoute,
      page: () => GratitudeAffirmationView(),
      bindings: [
        GratitudeAffirmationBinding(),
      ],
    ),GetPage(
      name: selfAffirmationRoute,
      page: () => SelfConfidenceAffirmationView() ,
      bindings: [
        SelfConfidenceBinding(),
      ],
    ),
    GetPage(
      name: loveAffirmationRoute,
      page: () => LoveAffirmationView(),
      bindings: [
        LoveAffirmationBinding(),
      ],
    ),
    GetPage(
      name: ownAffirmationRoute,
      page: () => OwnAffirmationView(),
      bindings: [
        OwnAffirmationBinding(),
      ],
    ),
    GetPage(
      name: onboardingOneScreen,
      page: () => OnboardingOneScreen(),
      bindings: [
        OnboardingOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingTwoScreen,
      page: () => OnboardingTwoScreen(),
      bindings: [
        OnboardingTwoBinding(),
      ],
    ),
    GetPage(
      name: onboardingThreeScreen,
      page: () => OnboardingThreeScreen(),
      bindings: [
        OnboardingThreeBinding(),
      ],
    ),
    GetPage(
      name: onboardingFourScreen,
      page: () => OnboardingFourScreen(),
      bindings: [
        OnboardingFourBinding(),
      ],
    ),
    GetPage(
      name: registerPageOneScreen,
      page: () => RegisterPageOneScreen(),
      bindings: [
        RegisterPageOneBinding(),
      ],
    ),
    GetPage(
      name: successRegistrationScreen,
      page: () => SuccessRegistrationScreen(),
      bindings: [
        SuccessRegistrationBinding(),
      ],
    ),
    GetPage(
      name: loginPageScreen,
      page: () => LoginPageScreen(),
      bindings: [
        LoginPageBinding(),
      ],
    ),
    GetPage(
      name: dailyIntensionRecordScreen,
      page: () => DailyIntensionRecordScreen(),
      bindings: [
        DailyIntensionRecordBinding(),
      ],
    ),
    GetPage(
      name: recordingScreen,
      page: () => RecordingScreen(),
      bindings: [
        RecordingBinding(),
      ],
    ),
    GetPage(
      name: remindersScreen,
      page: () => RemindersScreen(),
      bindings: [
        RemindersBinding(),
      ],
    ),
    GetPage(
      name: dailyIntensionRecordOneScreen,
      page: () => DailyIntensionRecordOneScreen(),
      bindings: [
        DailyIntensionRecordOneBinding(),
      ],
    ),
    GetPage(
      name: updateRemindersScreen,
      page: () => UpdateRemindersScreen(),
      bindings: [
        UpdateRemindersBinding(),
      ],
    ),
    GetPage(
      name: completeScreen,
      page: () => CompleteScreen(),
      bindings: [
        CompleteBinding(),
      ],
    ),
    GetPage(
      name: homeOneScreen,
      page: () => HomeOneScreen(),
      bindings: [
        HomeOneBinding(),
      ],
    ),
    GetPage(
      name: selectAffirmationScreen,
      page: () => SelectAffirmationScreen(),
      bindings: [
        SelectAffirmationBinding(),
      ],
    ),
    GetPage(
      name: homeNoTaskScreen,
      page: () => HomeNoTaskScreen(),
      bindings: [
        HomeNoTaskBinding(),
      ],
    ),
    GetPage(
      name: selectTaskScreen,
      page: () => SelectTaskScreen(),
      bindings: [
        SelectTaskBinding(),
      ],
    ),
    GetPage(
      name: addTaskScreen,
      page: () => AddTaskScreen(),
      bindings: [
        AddTaskBinding(),
      ],
    ),
    GetPage(
      name: viewAllTaskTabContainerScreen,
      page: () => ViewAllTaskTabContainerScreen(),
      bindings: [
        ViewAllTaskTabContainerBinding(),
      ],
    ),
    GetPage(
      name: taskEmptyScreen,
      page: () => TaskEmptyScreen(),
      bindings: [
        TaskEmptyBinding(),
      ],
    ),
    GetPage(
      name: congratulationsPageScreen,
      page: () => CongratulationsPageScreen(),
      bindings: [
        CongratulationsPageBinding(),
      ],
    ),
    GetPage(
      name: statsScreen,
      page: () => StatsScreen(),
      bindings: [
        StatsBinding(),
      ],
    ),
    GetPage(
      name: sleepTrackerScreen,
      page: () => SleepTrackerScreen(),
      bindings: [
        SleepTrackerBinding(),
      ],
    ),
    GetPage(
      name: blogScreen,
      page: () => BlogScreen(),
      bindings: [
        BlogBinding(),
      ],
    ),
    // GetPage(
    //   name: latestBlogScreen,
    //   page: () => LatestBlogScreen(blogId:FirebaseAuth.instance.currentUser!.uid, blogData: {},
    //   updateBlogRead: (documentID)async{
    //     return null;
    //   },
    //   ),
    //   bindings: [
    //     LatestBlogBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: communityTabContainerScreen,
    //   page: () => CommunityTabContainerScreen(),
    //   bindings: [
    //     CommunityTabContainerBinding(),
    //   ],
    // ),
    GetPage(
      name: commentSectionScreen,
      page: () => CommentSectionScreen(),
      bindings: [
        CommentSectionBinding(),
      ],
    ),
    GetPage(
      name: addFriendsScreen,
      page: () => AddFriendsScreen(),
      bindings: [
        AddFriendsBinding(),
      ],
    ),
    GetPage(
      name: viewFriendsTabContainerScreen,
      page: () => ViewFriendsTabContainerScreen(),
      bindings: [
        ViewFriendsTabContainerBinding(),
      ],
    ),
  // GetPage(
  //     name: viewFriendFullProfilePage,
  //     page: () =>ViewFriendFullProfilePage(),
  //     bindings: [
  //       ViewFriendsFullProfileBinding(),
  //     ],
  //   ),

    GetPage(
      name: accountSettingScreen,
      page: () => AccountSettingScreen(),
      bindings: [
        AccountSettingBinding(),
      ],
    ),
    GetPage(
      name: personalDataUpdateTwoScreen,
      page: () => PersonalDataUpdateTwoScreen(),
      bindings: [
        PersonalDataUpdateTwoBinding(),
      ],
    ),
    GetPage(
      name: personalDataUpdateScreen,
      page: () => PersonalDataUpdateScreen(),
      bindings: [
        PersonalDataUpdateBinding(),
      ],
    ),
    GetPage(
      name: personalDataUpdateOneScreen,
      page: () => PersonalDataUpdateOneScreen(),
      bindings: [
        PersonalDataUpdateOneBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => WelcomeScreenOneScreen(),
      bindings: [
        WelcomeScreenOneBinding(),
      ],
    )
  ];
}
