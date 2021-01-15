import 'package:journey/generated/json/base/json_convert_content.dart';
import 'package:journey/generated/json/base/json_field.dart';

class ProductListEntity with JsonConvert<ProductListEntity> {
	double id;
	String name;
	String price;
	String url;
	String image;
	@JSONField(name: "shopify_created_at")
	double shopifyCreatedAt;
}
