import 'package:dartz/dartz.dart';
import 'package:flutter_tdd/features/number_trivia/data/repositories/number_trivia_repository.dart';
import 'package:flutter_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  NumberTriviaRepository repository;

  setUp(() {
    repository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(repository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: "Test", number: 1);

  test('should get trivia for the number from the repository', () async {
    when(repository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));
    final result = await usecase(1);
    expect(result, Right(tNumberTrivia));
    // verify(repository.getConcreteNumberTrivia(42));
    verifyNoMoreInteractions(repository);
  });
}