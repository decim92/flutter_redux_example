import 'package:intl/intl.dart';

class Comic {
  final String imageUrl;
  final String date;
  final String name;
  final String issueNumber;

  Comic({this.imageUrl, this.date, this.name, this.issueNumber});

  factory Comic.fromJSON(Map<String, dynamic> json) => Comic(
        imageUrl: json['image']['original_url'] as String,
        date: json['date_added'] as String,
        name: json['name'] as String != null
            ? json['name'] as String
            : json['volume']['name'] as String,
        issueNumber: json['issue_number'] as String,
      );

  static List<Comic> comicsFromJSON(Map<String, dynamic> json) {
    List<Comic> comics = [];
    for (Map<String, dynamic> itemJson in json['results']) {
      comics.add(Comic.fromJSON(itemJson));
    }
    return comics;
  }

  String issuedName() {
    return '$name $issueNumber';
  }

  String readableDate() {
    DateTime date = DateFormat('yyyy-MM-dd HH:mm:ss', 'en_US').parse(this.date);
    return DateFormat.yMMMMd('en_US').format(date);
  }
}

class IssueDetail {
  final String imageUrl;
  final String characterCredits;
  final String teamCredits;
  final String locationCredits;

  IssueDetail(
      {this.imageUrl,
      this.characterCredits,
      this.teamCredits,
      this.locationCredits});

  factory IssueDetail.fromJSON(Map<String, dynamic> json) => IssueDetail(
        imageUrl: json['image']['original_url'] as String,
        characterCredits: json['character_credits'] as String,
        teamCredits: json['team_credits'] as String,
        locationCredits: json['location_credits'] as String,
      );
}
