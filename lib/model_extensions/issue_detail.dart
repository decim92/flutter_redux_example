import 'package:redux_example/model/comic/detail/credit.dart';

extension CreditAdditions on Credit {
  static List<Credit> creditsfromJson(List list) {
    List<Credit> credits = [];
    for (Map<String, dynamic> itemJson in list) {
      credits.add(Credit.fromJson(itemJson));
    }
    return credits;
  }
}
