import 'package:journey/models/Product_List_entity.dart';

productListEntityFromJson(ProductListEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? double.tryParse(json['id'])
				: json['id'].toDouble();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['price'] != null) {
		data.price = json['price'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['shopify_created_at'] != null) {
		data.shopifyCreatedAt = json['shopify_created_at'] is String
				? double.tryParse(json['shopify_created_at'])
				: json['shopify_created_at'].toDouble();
	}
	return data;
}

Map<String, dynamic> productListEntityToJson(ProductListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['price'] = entity.price;
	data['url'] = entity.url;
	data['image'] = entity.image;
	data['shopify_created_at'] = entity.shopifyCreatedAt;
	return data;
}