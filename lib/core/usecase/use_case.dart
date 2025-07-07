abstract class UseCase<SuccessType, Params> {
  Future<SuccessType> call({Params params});
}

abstract class UseCaseSource<SuccessType, Params> {
  Future<SuccessType> call({Params params, String? source});
}

class NoParams {}

class ParamsAsType {
  String typeOfData;
  ParamsAsType({required this.typeOfData});
}

class ParamsAsValue {
  String value;
  ParamsAsValue({required this.value});
}

class ParamsWithPage {
  final int page;
  ParamsWithPage({required this.page});
}
