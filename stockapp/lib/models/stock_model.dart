class StockModel {
  String? sId;
  String? stockName;
  int? quantity;
  int? amount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  StockModel(
      {this.sId,
      this.stockName,
      this.quantity,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.iV});

  StockModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    stockName = json['stockName'];
    quantity = json['quantity'];
    amount = json['amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['stockName'] = this.stockName;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
