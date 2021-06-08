// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryRecords _$InventoryRecordsFromJson(Map<String, dynamic> json) {
  return InventoryRecords(
    item: CustomerData.fromJson(json['item'] as Map<String, dynamic>),
    catalogSlideContent: CatalogSlideContent.fromJson(
        json['catalogSlide'] as Map<String, dynamic>),
    quantityOnHand: json['quantityOnHand'] as String,
    terms: Terms.fromJson(json['Terms'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InventoryRecordsToJson(InventoryRecords instance) =>
    <String, dynamic>{
      'catalogSlide': instance.catalogSlideContent,
      'item': instance.item,
      'quantityOnHand': instance.quantityOnHand,
      'Terms': instance.terms,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) {
  return CustomerData(
    href: json['href'] as String,
    id: CommonUserIdString.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
    };

CatalogSlideContent _$CatalogSlideContentFromJson(Map<String, dynamic> json) {
  return CatalogSlideContent(
    content:
        ContentDescription.fromJson(json['content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CatalogSlideContentToJson(
        CatalogSlideContent instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

ContentDescription _$ContentDescriptionFromJson(Map<String, dynamic> json) {
  return ContentDescription(
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ContentDescriptionToJson(ContentDescription instance) =>
    <String, dynamic>{
      'description': instance.description,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) {
  return Terms(
    pvEach: json['pvEach'] as int,
    priceEach: json['priceEach'] as int,
  );
}

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'priceEach': instance.priceEach,
      'pvEach': instance.pvEach,
    };
