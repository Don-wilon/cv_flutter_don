import 'package:flutter_test/flutter_test.dart';

import 'package:cv_flutter_don/main.dart';

void main() {
  testWidgets('Connexion page is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bienvenue'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
  });
}
