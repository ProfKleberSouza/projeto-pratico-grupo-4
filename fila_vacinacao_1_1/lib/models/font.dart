class FontModel {
  String tamfonte;

  FontModel({this.tamfonte});

  FontModel.fromJson(Map<String, dynamic> json) {
    tamfonte = json['tamfonte'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tamfonte'] = this.tamfonte;
    return data;
  }
}
