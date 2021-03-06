import 'package:json_annotation/json_annotation.dart';

part 'common_methods.g.dart';

//*  GenericHref example
//*  "profilePicture": {
//*    "href": "https://hydra.unicity.net/v5a/customers/blah-blah"
//*   },
@JsonSerializable()
class CommonGenericHref {
  @JsonKey(name: "href")
  final String href;

  const CommonGenericHref({
    this.href = "",
  });

  factory CommonGenericHref.fromJson(Map<String, dynamic> json) =>
      _$CommonGenericHrefFromJson(json);

  Map<String, dynamic> toJson() => _$CommonGenericHrefToJson(this);
}

//*  HumanNameFull example
//*  "humanName": {
//*    "firstName": "Lord",
//*    "lastName": "Voldemort",
//*    "fullName": "Lord Voldemort",
//*    "fullName@th": "ซื้อ 1000 ครั้ง ปลดล๊อกสกินเขียว"
//*  },
@JsonSerializable()
class CommonHumanNameFull {
  final String firstName;
  final String lastName;
  final String fullName;
  @JsonKey(name: "fullName@th")
  final String fullNameTh;

  const CommonHumanNameFull(
      {this.firstName = "",
      this.lastName = "",
      this.fullName = "",
      this.fullNameTh = ""});

  factory CommonHumanNameFull.fromJson(Map<String, dynamic> json) =>
      _$CommonHumanNameFullFromJson(json);

  Map<String, dynamic> toJson() => _$CommonHumanNameFullToJson(this);
}

//*  "id": {
//*    "unicity": "XX-123456",
//*  },
@JsonSerializable()
class CommonUserIdCountry {
  @JsonKey(name: "id")
  final CommonIdWithCountryCode id;

  CommonUserIdCountry({
    this.id = const CommonIdWithCountryCode(),
  });

  factory CommonUserIdCountry.fromJson(Map<String, dynamic> json) =>
      _$CommonUserIdCountryFromJson(json);

  Map<String, dynamic> toJson() => _$CommonUserIdCountryToJson(this);
}

//* "unicity": "XX-123456",
@JsonSerializable()
class CommonIdWithCountryCode {
  @JsonKey(name: "unicity")
  final String unicity;

  const CommonIdWithCountryCode({
    this.unicity = "",
  });

  factory CommonIdWithCountryCode.fromJson(Map<String, dynamic> json) =>
      _$CommonIdWithCountryCodeFromJson(json);

  Map<String, dynamic> toJson() => _$CommonIdWithCountryCodeToJson(this);
}

//*  "id": {
//*    "unicity": "123456",
//*  },
@JsonSerializable()
class CommonUserIdString {
  @JsonKey(name: "id")
  final CommonIdTypeString id;

  const CommonUserIdString({
    this.id = const CommonIdTypeString(),
  });

  factory CommonUserIdString.fromJson(Map<String, dynamic> json) =>
      _$CommonUserIdStringFromJson(json);

  Map<String, dynamic> toJson() => _$CommonUserIdStringToJson(this);
}

//* "unicity": "123456",
@JsonSerializable()
class CommonIdTypeString {
  @JsonKey(name: "unicity")
  final String unicity;

  const CommonIdTypeString({
    this.unicity = "",
  });

  factory CommonIdTypeString.fromJson(Map<String, dynamic> json) =>
      _$CommonIdTypeStringFromJson(json);

  Map<String, dynamic> toJson() => _$CommonIdTypeStringToJson(this);
}

//*  HumanNameFull example
//*  "humanName": {
//*    "fullName": "Thailand DSC Training"
//*  }

@JsonSerializable()
class CommonHumanNameObject {
  @JsonKey(name: "humanName")
  final CommonFullName humanName;

  const CommonHumanNameObject({
    this.humanName = const CommonFullName(),
  });

  factory CommonHumanNameObject.fromJson(Map<String, dynamic> json) =>
      _$CommonHumanNameObjectFromJson(json);

  Map<String, dynamic> toJson() => _$CommonHumanNameObjectToJson(this);
}

@JsonSerializable()
class CommonFullName {
  @JsonKey(name: "fullName")
  final String fullName;

  const CommonFullName({
    this.fullName = "",
  });

  factory CommonFullName.fromJson(Map<String, dynamic> json) =>
      _$CommonFullNameFromJson(json);

  Map<String, dynamic> toJson() => _$CommonFullNameToJson(this);
}

@JsonSerializable()
class CommonHumanFullName {
  @JsonKey(name: "fullName")
  final CommonFullNameOnly fullName;

  CommonHumanFullName({
    this.fullName = const CommonFullNameOnly(),
  });

  factory CommonHumanFullName.fromJson(Map<String, dynamic> json) =>
      _$CommonHumanFullNameFromJson(json);

  Map<String, dynamic> toJson() => _$CommonHumanFullNameToJson(this);
}

//*  HumanNameFull example
//*  "fullName": "Thailand DSC Training"
@JsonSerializable()
class CommonFullNameOnly {
  @JsonKey(name: "fullName")
  final String fullName;

  const CommonFullNameOnly({
    this.fullName = "",
  });

  factory CommonFullNameOnly.fromJson(Map<String, dynamic> json) =>
      _$CommonFullNameOnlyFromJson(json);

  Map<String, dynamic> toJson() => _$CommonFullNameOnlyToJson(this);
}

//*  HumanNameFull example
//*  "fullName": "Thailand DSC Training"
@JsonSerializable()
class CommonIdAndIota {
  @JsonKey(name: "unicity")
  final String unicity;
  @JsonKey(name: "iota")
  final String iota;

  const CommonIdAndIota({
    this.unicity = "",
    this.iota = "",
  });

  factory CommonIdAndIota.fromJson(Map<String, dynamic> json) =>
      _$CommonIdAndIotaFromJson(json);

  Map<String, dynamic> toJson() => _$CommonIdAndIotaToJson(this);
}

//*  CompleteHumanThName example
//*  "humanName": {
//*    "firstName": "walaa",
//*    "lastName": "bushakhar",
//*    "fullName": "walaa bushakhar",
//*    "firstName@th": "walaa",
//*    "lastName@th": "fawzi bushakhar",
//*    "fullName@th": "walaa fawzi bushakhar"
//*  }
@JsonSerializable()
class CompleteHumanThName {
  @JsonKey(name: "firstName")
  final String firstName;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "fullName")
  final String fullName;
  @JsonKey(name: "firstName@th")
  final String firstNameTh;
  @JsonKey(name: "lastName@th")
  final String lastNameTh;
  @JsonKey(name: "fullName@th")
  final String fullNameTh;

  const CompleteHumanThName({
    this.firstName = "",
    this.lastName = "",
    this.fullName = "",
    this.firstNameTh = "",
    this.lastNameTh = "",
    this.fullNameTh = "",
  });

  factory CompleteHumanThName.fromJson(Map<String, dynamic> json) =>
      _$CompleteHumanThNameFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteHumanThNameToJson(this);
}

//*  CompleteHumanThName example
//*  "humanName": {
//*    "firstName": "walaa",
//*    "lastName": "bushakhar",
//*    "fullName": "walaa bushakhar",
//*  }
@JsonSerializable()
class CommonShipToNameFull {
  @JsonKey(name: "firstName")
  final String firstName;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "fullName")
  final String fullName;

  const CommonShipToNameFull(
      {this.firstName = "", this.lastName = "", this.fullName = ""});

  factory CommonShipToNameFull.fromJson(Map<String, dynamic> json) =>
      _$CommonShipToNameFullFromJson(json);

  Map<String, dynamic> toJson() => _$CommonShipToNameFullToJson(this);
}

//* "content": {
//*   "description": "Easyship 100HN Rev1 TH"
//* }

@JsonSerializable()
class CommonCatalogSlideContent {
  @JsonKey(name: "content")
  final CommonContentDescription content;

  const CommonCatalogSlideContent(
      {this.content = const CommonContentDescription()});

  factory CommonCatalogSlideContent.fromJson(Map<String, dynamic> json) =>
      _$CommonCatalogSlideContentFromJson(json);

  Map<String, dynamic> toJson() => _$CommonCatalogSlideContentToJson(this);
}

//* "description": "Easyship 100HN Rev1 TH"
@JsonSerializable()
class CommonContentDescription {
  @JsonKey(name: "description")
  final String description;

  const CommonContentDescription({
    this.description = "",
  });

  factory CommonContentDescription.fromJson(Map<String, dynamic> json) =>
      _$CommonContentDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$CommonContentDescriptionToJson(this);
}

//* "terms": {
//*   "priceEach": 7080,
//*   "pvEach": 101
//* }
@JsonSerializable()
class CommonTermsEach {
  @JsonKey(name: "priceEach")
  final double priceEach;
  @JsonKey(name: "pvEach")
  final int pvEach;

  const CommonTermsEach({
    this.pvEach = 0,
    this.priceEach = 0.0,
  });

  factory CommonTermsEach.fromJson(Map<String, dynamic> json) =>
      _$CommonTermsEachFromJson(json);

  Map<String, dynamic> toJson() => _$CommonTermsEachToJson(this);
}

//* "terms": {
//*   "period": "2020-12"
//* }
@JsonSerializable()
class TermsPeriod {
  @JsonKey(name: "period")
  final String period;

  const TermsPeriod({
    this.period = "",
  });

  factory TermsPeriod.fromJson(Map<String, dynamic> json) =>
      _$TermsPeriodFromJson(json);

  Map<String, dynamic> toJson() => _$TermsPeriodToJson(this);
}

//* "customer": {
//*   "href": "https://hydra.unicity.net/v5a/customers/7db0b8ee213916d87bca8c57aa6a0c65",
//*   "id": {
//*       "unicity": 2970466
//*   }
//* }
@JsonSerializable()
class CommonCustomerIdHref {
  @JsonKey(name: "href")
  final String href;

  const CommonCustomerIdHref({
    this.href = "",
  });

  factory CommonCustomerIdHref.fromJson(Map<String, dynamic> json) =>
      _$CommonCustomerIdHrefFromJson(json);

  Map<String, dynamic> toJson() => _$CommonCustomerIdHrefToJson(this);
}

//*  "id": {
//*    "unicity": 123456,
//*  },
@JsonSerializable()
class CommonUserIdIntObject {
  @JsonKey(name: "id")
  final CommonIdTypeInt id;

  const CommonUserIdIntObject({
    this.id = const CommonIdTypeInt(),
  });

  factory CommonUserIdIntObject.fromJson(Map<String, dynamic> json) =>
      _$CommonUserIdIntObjectFromJson(json);

  Map<String, dynamic> toJson() => _$CommonUserIdIntObjectToJson(this);
}

//*    "unicity": 123456,
@JsonSerializable()
class CommonIdTypeInt {
  @JsonKey(name: "unicity")
  final int unicity;

  const CommonIdTypeInt({
    this.unicity = 0,
  });

  factory CommonIdTypeInt.fromJson(Map<String, dynamic> json) =>
      _$CommonIdTypeIntFromJson(json);

  Map<String, dynamic> toJson() => _$CommonIdTypeIntToJson(this);
}
