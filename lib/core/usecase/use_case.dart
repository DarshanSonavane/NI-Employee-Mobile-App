abstract class UseCase<SuccessType, Params> {
  Future<SuccessType> call({Params params});
}

abstract class UseCaseSource<SuccessType, Params> {
  Future<SuccessType> call({Params params, String? source});
}

class NoParams {}
