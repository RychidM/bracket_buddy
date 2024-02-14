import 'package:bracket_buddy/app/modules/tournament/controllers/tournament_controller.dart';
import 'package:bracket_buddy/app/modules/tournament/views/widgets/select_players.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('SelectPlayerView widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Get.put(TournamentController());
    await tester.pumpWidget(const ScreenUtilInit(
        designSize: Size(393, 852),
        child: GetMaterialApp(home: SelectPlayersView())));

    await tester.pumpAndSettle();

    // Verify that SelectPlayerView is shown
    expect(find.byType(SelectPlayersView), findsOneWidget);

    // Add more assertions here to test the functionality of your widget
  });
}
