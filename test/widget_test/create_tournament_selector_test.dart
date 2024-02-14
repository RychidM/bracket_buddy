import 'package:bracket_buddy/app/modules/tournament/views/widgets/select_players.dart';
import 'package:bracket_buddy/app/widgets/select_player_count_view.dart';
import 'package:bracket_buddy/app/widgets/tournament_setup_view_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:bracket_buddy/app/modules/tournament/views/tournament_view.dart';
import 'package:bracket_buddy/app/modules/tournament/controllers/tournament_controller.dart';
import 'package:bracket_buddy/app/modules/tournament/controllers/tournament_state.dart';

void main() {
  // Define a test for each step of the tournament creation process
  group('CreateTournamentViewSelector', () {
    testWidgets(
        'displays TournamentSetupViewOne when currentTournamentStep is stepOne',
        (WidgetTester tester) async {
      // Setup the initial state of the controller
      final tournamentController = TournamentController();
      tournamentController.tournamentState.currentTournamentStep =
          CreateTournamentStep.stepOne;

      // Build the widget tree
      await tester.pumpWidget(ScreenUtilInit(
        designSize: const Size(393, 852),
        child: GetMaterialApp(
          home: const CreateTournamentViewSelector(),
          initialBinding: BindingsBuilder(() {
            Get.put(tournamentController);
          }),
        ),
      ));

      await tester.pumpAndSettle();

      // Verify that TournamentSetupViewOne is displayed
      expect(find.byType(TournamentSetupViewOne), findsOneWidget);
    });

    testWidgets(
        'displays SelectPlayerCountView when currentTournamentStep is stepTwo',
        (WidgetTester tester) async {
      // Setup the initial state of the controller
      final tournamentController = TournamentController();
      tournamentController.tournamentState.currentTournamentStep =
          CreateTournamentStep.stepTwo;

      // Build the widget tree
      await tester.pumpWidget(ScreenUtilInit(
        designSize: const Size(393, 852),
        child: GetMaterialApp(
          home: const CreateTournamentViewSelector(),
          initialBinding: BindingsBuilder(() {
            Get.put(tournamentController);
          }),
        ),
      ));

      await tester.pumpAndSettle();

      // Verify that SelectPlayerCountView is displayed
      expect(find.byType(SelectPlayerCountView), findsOneWidget);
    });

    testWidgets(
        'displays SelectPlayersView when currentTournamentStep is stepThree',
        (WidgetTester tester) async {
      // Setup the initial state of the controller
      final tournamentController = TournamentController();
      tournamentController.tournamentState.currentTournamentStep =
          CreateTournamentStep.stepThree;

      // Build the widget tree
      await tester.pumpWidget(ScreenUtilInit(
        designSize: const Size(393, 852),
        child: GetMaterialApp(
          home: const CreateTournamentViewSelector(),
          initialBinding: BindingsBuilder(() {
            Get.put(tournamentController);
          }),
        ),
      ));

      await tester.pumpAndSettle();

      // Verify that SelectPlayersView is displayed
      expect(find.byType(SelectPlayersView), findsOneWidget);
    });
  });
}
