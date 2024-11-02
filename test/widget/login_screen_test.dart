import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catbreeds/blocs/auth_bloc.dart';
import 'package:catbreeds/ui/screens/login_screen.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
  });

  tearDown(() {
    mockAuthBloc.close();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<AuthBloc>(
        create: (context) => mockAuthBloc,
        child: LoginScreen(),
      ),
    );
  }

  testWidgets('should have email and password input fields', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('should call LoginEvent when login button is pressed', (WidgetTester tester) async {
    when(() => mockAuthBloc.state).thenReturn(AuthInitial());

    await tester.pumpWidget(createWidgetUnderTest());

    final emailField = find.byType(TextField).first;
    final passwordField = find.byType(TextField).last;
    final loginButton = find.byType(ElevatedButton);

    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'password');
    await tester.tap(loginButton);

    verify(() => mockAuthBloc.add(LoginEvent('test@example.com', 'password'))).called(1);
  });
}
