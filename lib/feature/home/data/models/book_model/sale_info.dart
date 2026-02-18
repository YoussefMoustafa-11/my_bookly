import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final String? buyLink;
  final RetailPrice? retailPrice;
  const SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.buyLink,
    this.retailPrice,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: json['country'] as String?,
    saleability: json['saleability'] as String?,
    isEbook: json['isEbook'] as bool?,
    buyLink: json['buyLink'] as String?,
    retailPrice: json['retailPrice'] == null
        ? null
        : RetailPrice.fromJson(json['retailPrice']),
  );

  Map<String, dynamic> toJson() => {
    'country': country,
    'saleability': saleability,
    'isEbook': isEbook,
    'buyLink': buyLink,
    'retailPrice': retailPrice?.toJson(),
  };

  @override
  List<Object?> get props => [
    country,
    saleability,
    isEbook,
    buyLink,
    retailPrice,
  ];
}

class RetailPrice {
  final double? amount;
  final String? currencyCode;

  const RetailPrice({this.amount, this.currencyCode});

  factory RetailPrice.fromJson(Map<String, dynamic> json) => RetailPrice(
    amount: (json['amount'] as num?)?.toDouble(),
    currencyCode: json['currencyCode'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'currencyCode': currencyCode,
  };
}
