import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class StatsController extends GetxController {

  final RxList<int> weeklyData = List<int>.filled(7, 0).obs;
  final RxList<int> intentionWeeklyData = List<int>.filled(7, 0).obs;
  final RxList<int> taskWeeklyData = List<int>.filled(7, 0).obs;
  final RxList<int> blogsWeeklyData = List<int>.filled(7, 0).obs;



 final user = FirebaseAuth.instance.currentUser!.email;
  @override
  void onInit() {
    fetchOwnAffirmationsForWeek();
    fetchBlogReadForWeek();
    fetchDailyIntentionsVideosForWeek();
    fetchTasksCompleteForWeek();
//    print(DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)));
    super.onInit();
  }

  Future<void> fetchOwnAffirmationsForWeek() async {
    // Your data fetching logic here, updating weeklyData
    // Example: Fetch data from Firestore and update weeklyData
    final weekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));

    final ownAffirmationListCollection = FirebaseFirestore.instance.collection('users')
    .doc(user).collection('OwnAffirmationList');

    try {
      final QuerySnapshot ownAffirmationsSnapshot = await ownAffirmationListCollection
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(weekStart))
          .where('date', isLessThan: Timestamp.fromDate(weekEnd))
          .get();

      for (final doc in ownAffirmationsSnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final date = (data['date'] as Timestamp).toDate();

        final dayIndex = date.weekday - 1; // Adjust for 0-based indexing
        weeklyData[dayIndex]++;
      }
    } catch (e) {
      print('Error fetching OwnAffirmationList documents: $e');
    }
  }

  Future<void> fetchDailyIntentionsVideosForWeek() async {


    final weekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));

    final dailyIntentionsListCollection = FirebaseFirestore.instance.collection('users')
    .doc(user).collection('VideosUrl');

    try {
      final QuerySnapshot intentionsSnapshot = await dailyIntentionsListCollection
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(weekStart))
          .where('date', isLessThan: Timestamp.fromDate(weekEnd))
          .get();

      for (final doc in intentionsSnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final date = (data['date'] as Timestamp).toDate();

        final dayIndex = date.weekday - 1; // Adjust for 0-based indexing
        intentionWeeklyData[dayIndex]++;
      }
    } catch (e) {
      print('Error fetching daily Intention Videos List documents: $e');
    }
  }

  Future<void> fetchTasksCompleteForWeek() async {
    final weekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));

    final tasksListCollection = FirebaseFirestore.instance.collection('users')
    .doc(user).collection('tasks');

    try {
      final QuerySnapshot tasksSnapshot = await tasksListCollection
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(weekStart))
          .where('date', isLessThan: Timestamp.fromDate(weekEnd))
          .get();

      for (final doc in tasksSnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final date = (data['date'] as Timestamp).toDate();

        final dayIndex = date.weekday - 1; // Adjust for 0-based indexing
        taskWeeklyData[dayIndex]++;
      }
    } catch (e) {
      print('Error fetching daily Intention Videos List documents: $e');
    }
  }

  Future<void> fetchBlogReadForWeek() async {
    final weekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));

    final blogReadCollection = FirebaseFirestore.instance.collection('users')
    .doc(user).collection('blogReadList');

    try {
      final QuerySnapshot blogsSnapshot = await blogReadCollection
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(weekStart))
          .where('date', isLessThan: Timestamp.fromDate(weekEnd))
          .get();

      for (final doc in blogsSnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final date = (data['date'] as Timestamp).toDate();

        final dayIndex = date.weekday - 1; // Adjust for 0-based indexing
        blogsWeeklyData[dayIndex]++;
      }
    } catch (e) {
      print('Error From blog read List documents: $e');
    }
  }



}
