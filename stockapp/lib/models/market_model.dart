class MarketModel {
  String? sId;
  String? userid;
  String? stockName;
  String? transactionType;
  String? quantity;
  String? amount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MarketModel(
      {this.sId,
      this.userid,
      this.stockName,
      this.transactionType,
      this.quantity,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MarketModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userid = json['userid'];
    stockName = json['stockName'];
    transactionType = json['transactionType'];
    quantity = json['quantity'];
    amount = json['amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userid'] = this.userid;
    data['stockName'] = this.stockName;
    data['transactionType'] = this.transactionType;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
