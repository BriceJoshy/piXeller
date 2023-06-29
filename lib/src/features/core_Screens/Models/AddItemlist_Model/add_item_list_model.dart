class AddItemListModel {
  AddItemListModel({
    required this.id,
    required this.itemCategory,
    required this.itemName,
    required this.itemQuantity,
    required this.itemPrice,
    required this.producerNumber,
    required this.image,
    required this.producerWarning,
    required this.itemDescription,
    required this.createdAt,
  });
  late String id;
  late String itemCategory;
  late String itemName;
  late String itemQuantity;
  late String itemPrice;
  late String producerNumber;
  late String image;
  late String producerWarning;
  late String itemDescription;
  late String createdAt;

  AddItemListModel.fromJson(Map<String, dynamic> json) {
    // if the value is null that is if not filled then return empty String ?? ''

    id = json['id'] ?? '';
    itemCategory = json['itemCategory'] ?? '';
    itemName = json['itemName'] ?? '';
    itemQuantity = json['itemQuantity'] ?? '';
    itemPrice = json['itemPrice'] ?? '';
    producerNumber = json['producerNumber'] ?? '';
    image = json['image'] ?? '';
    producerWarning = json['producerWarning'] ?? '';
    itemDescription = json['itemDescription'] ?? '';
    createdAt = json['created_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    // no need to maje data private "_data"
    final data = <String, dynamic>{};
    data['id'] = id;
    data['itemCategory'] = itemCategory;
    data['itemName'] = itemName;
    data['itemQuantity'] = itemQuantity;
    data['itemPrice'] = itemPrice;
    data['producerNumber'] = producerNumber;
    data['image'] = image;
    data['producerWarning'] = producerWarning;
    data['itemDescription'] = itemDescription;
    data['created_at'] = createdAt;
    return data;
  }
}
