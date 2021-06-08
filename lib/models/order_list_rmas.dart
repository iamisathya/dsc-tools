import 'package:json_annotation/json_annotation.dart';

import 'package:code_magic_ex/models/common_methods.dart';

part 'order_list_rmas.g.dart';

@JsonSerializable()
class OrdersAndRmas {
  @JsonKey(name: "items")
  List<OrderItem> items;
  
  OrdersAndRmas({
    required this.items,
  });

  factory OrdersAndRmas.fromJson(Map<String, dynamic> json) =>
      _$OrdersAndRmasFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersAndRmasToJson(this);
}

@JsonSerializable()
class OrderItem {
  @JsonKey(name: "creator")
  CommonHumanFullName creator;
  @JsonKey(name: "currency")
  String currency;
  @JsonKey(name: "customer")
  CustomerDetails customer;
  @JsonKey(name: "dateCreated")
  String dateCreated;
  @JsonKey(name: "id")
  CommonIdAndIota id;
  @JsonKey(name: "terms")
  Terms terms;
  @JsonKey(name: "shipToName")
  CommonShipToNameFull shipToName;
  @JsonKey(name: "source")
  Map<String, dynamic> source;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "paymentStatus")
  String paymentStatus;
  @JsonKey(name: "href")
  String href;
  
  OrderItem({
    required this.creator,
    required this.currency,
    required this.customer,
    required this.dateCreated,
    required this.id,
    required this.terms,
    required this.shipToName,
    required this.source,
    required this.type,
    required this.paymentStatus,
    required this.href,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable()
class CustomerDetails {
  @JsonKey(name: "id")
  CommonIdTypeString id;
  @JsonKey(name: "humanName")
  CompleteHumanThName humanName;
  @JsonKey(name: "href")
  String href;
  
  CustomerDetails({
    required this.id,
    required this.humanName,
    required this.href,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);
}

@JsonSerializable()
class Terms {
  @JsonKey(name: "total")
  double total;
  @JsonKey(name: "pv")
  int pv;
  
  Terms({
    required this.total,
    required this.pv,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}
