abstract class Failure{}

class ServerFailure implements Failure{
  final String message;

  ServerFailure({required this.message});
}