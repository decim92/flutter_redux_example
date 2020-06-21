import 'package:intl/intl.dart';
import 'package:redux_example/model/comic/comic.dart';

extension ComicAdditions on Comic {
  static List<Comic> comicsFromJson(Map<String, dynamic> json) {
    List<Comic> comics = [];
    for (Map<String, dynamic> itemJson in json['results']) {
      comics.add(Comic.fromJson(itemJson));
    }
    return comics;
  }

  String issuedName() {
    if (name == null) {
      String volumeName = this.volume.name;
      return '$volumeName $issueNumber';
    } else {
      return '$name $issueNumber';
    }
  }

  String readableDate() {
    DateTime date =
        DateFormat('yyyy-MM-dd HH:mm:ss', 'en_US').parse(this.dateAdded);
    return DateFormat.yMMMMd('en_US').format(date);
  }
}
