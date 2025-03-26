class PeriodTipsModel {
  List<Tips>? tips;

  PeriodTipsModel({this.tips});

  PeriodTipsModel.fromJson(Map<String, dynamic> json) {
    if (json['tips'] != null) {
      tips = <Tips>[];
      json['tips'].forEach((v) {
        tips!.add(new Tips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tips != null) {
      data['tips'] = this.tips!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tips {
  String? title;
  String? body;
  String? image;

  Tips({this.title, this.body, this.image});

  Tips.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    return data;
  }
}
