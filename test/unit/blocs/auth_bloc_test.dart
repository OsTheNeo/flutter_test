import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:catbreeds/blocs/auth_bloc.dart';
import 'package:catbreeds/data/repositories/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthBloc authBloc;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authBloc = AuthBloc(mockAuthRepository);
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthBloc', () {
    test('initial state is AuthInitial', () {
      expect(authBloc.state, AuthInitial());
    });

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthAuthenticated] when login is successful',
      build: () {
        when(() => mockAuthRepository.login(any(), any()))
            .thenAnswer((_) async => true);
        return authBloc;
      },
      act: (bloc) => bloc.add(LoginEvent('test@example.com', 'password')),
      expect: () => [AuthLoading(), AuthAuthenticated()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthUnauthenticated] when login fails',
      build: () {
        when(() => mockAuthRepository.login(any(), any()))
            .thenAnswer((_) async => false);
        return authBloc;
      },
      act: (bloc) => bloc.add(LoginEvent('test@example.com', 'password')),
      expect: () => [AuthLoading(), AuthUnauthenticated()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthUnauthenticated] when logout is successful',
      build: () {
        when(() => mockAuthRepository.logout()).thenAnswer((_) async => {});
        return authBloc;
      },
      act: (bloc) => bloc.add(LogoutEvent()),
      expect: () => [AuthLoading(), AuthUnauthenticated()],
    );
  });
}
