import 'request_details.dart';
import 'user_details.dart';

class MarketplaceRequest {
  final String? idHash;
  final UserDetails? userDetails;
  final RequestDetails? requestDetails;
  final bool? isHighValue;
  final String? createdAt;
  final String? description;
  final String? status;
  final String? serviceType;
  final String? targetAudience;
  final bool? isOpen;
  final bool? isPanIndia;
  final bool? anyLanguage;
  final bool? isDealClosed;
  final String? slug;

  const MarketplaceRequest({
    this.idHash,
    this.userDetails,
    this.requestDetails,
    this.isHighValue,
    this.createdAt,
    this.description,
    this.status,
    this.serviceType,
    this.targetAudience,
    this.isOpen,
    this.isPanIndia,
    this.anyLanguage,
    this.isDealClosed,
    this.slug,
  });

  factory MarketplaceRequest.fromJson(Map<String, dynamic> json) {
    return MarketplaceRequest(
      idHash: json['id_hash'],
      userDetails: json['user_details'] != null
          ? UserDetails.fromJson(json['user_details'])
          : null,
      requestDetails: json['request_details'] != null
          ? RequestDetails.fromJson(json['request_details'])
          : null,
      isHighValue: json['is_high_value'],
      createdAt: json['created_at'],
      description: json['description'],
      status: json['status'],
      serviceType: json['service_type'],
      targetAudience: json['target_audience'],
      isOpen: json['is_open'],
      isPanIndia: json['is_pan_india'],
      anyLanguage: json['any_language'],
      isDealClosed: json['is_deal_closed'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_hash': idHash,
      'user_details': userDetails!.toJson(),
      'request_details': requestDetails!.toJson(),
      'is_high_value': isHighValue,
      'created_at': createdAt,
      'description': description,
      'status': status,
      'service_type': serviceType,
      'target_audience': targetAudience,
      'is_open': isOpen,
      'is_pan_india': isPanIndia,
      'any_language': anyLanguage,
      'is_deal_closed': isDealClosed,
      'slug': slug,
    };
  }
}
