import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final int? index;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? originatingLeadSource;
  final String? quoteId;
  final String? owningBusinessUnit;
  final int? leadId;
  final String? source;
  final String? capturingUser;
  final String? ageBracket;
  final int? inPatientCoverLimit;
  final String? spouseCovered;
  final int? children;
  final String? coverChildren;
  final String? spouseAgeBracket;
  final String? benefits;

  const Quote({
    this.index,
    this.firstName,
    this.lastName,
    this.middleName,
    this.originatingLeadSource,
    this.quoteId,
    this.owningBusinessUnit,
    this.leadId,
    this.source,
    this.capturingUser,
    this.ageBracket,
    this.inPatientCoverLimit,
    this.spouseCovered,
    this.children,
    this.coverChildren,
    this.spouseAgeBracket,
    this.benefits,
  });

  factory Quote.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Quote.fromMap(data!);
  }

  Map<String, dynamic> toFirestore() {
    return toMap();
  }

  factory Quote.fromMap(Map<String, dynamic> data) => Quote(
        index: data['index'] as int?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        middleName: data['middleName'] as String?,
        originatingLeadSource: data['originatingLeadSource'] as String?,
        quoteId: data['quoteId'] as String?,
        owningBusinessUnit: data['owningBusinessUnit'] as String?,
        leadId: data['leadId'] as int?,
        source: data['source'] as String?,
        capturingUser: data['capturingUser'] as String?,
        ageBracket: data['ageBracket'] as String?,
        inPatientCoverLimit: data['inPatientCoverLimit'] as int?,
        spouseCovered: data['spouseCovered'] as String?,
        children: data['children'] as int?,
        coverChildren: data['coverChildren'] as String?,
        spouseAgeBracket: data['spouseAgeBracket'] as String?,
        benefits: data['benefits'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'index': index,
        'firstName': firstName,
        'lastName': lastName,
        'middleName': middleName,
        'originatingLeadSource': originatingLeadSource,
        'quoteId': quoteId,
        'owningBusinessUnit': owningBusinessUnit,
        'leadId': leadId,
        'source': source,
        'capturingUser': capturingUser,
        'ageBracket': ageBracket,
        'inPatientCoverLimit': inPatientCoverLimit,
        'spouseCovered': spouseCovered,
        'children': children,
        'coverChildren': coverChildren,
        'spouseAgeBracket': spouseAgeBracket,
        'benefits': benefits,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Quote].
  factory Quote.fromJson(String data) {
    return Quote.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Quote] to a JSON string.
  String toJson() => json.encode(toMap());

  Quote copyWith({
    int? index,
    String? firstName,
    String? lastName,
    String? middleName,
    String? originatingLeadSource,
    String? quoteId,
    String? owningBusinessUnit,
    int? leadId,
    String? source,
    String? capturingUser,
    String? ageBracket,
    int? inPatientCoverLimit,
    String? spouseCovered,
    int? children,
    String? coverChildren,
    String? spouseAgeBracket,
    String? benefits,
  }) {
    return Quote(
      index: index ?? this.index,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      originatingLeadSource:
          originatingLeadSource ?? this.originatingLeadSource,
      quoteId: quoteId ?? this.quoteId,
      owningBusinessUnit: owningBusinessUnit ?? this.owningBusinessUnit,
      leadId: leadId ?? this.leadId,
      source: source ?? this.source,
      capturingUser: capturingUser ?? this.capturingUser,
      ageBracket: ageBracket ?? this.ageBracket,
      inPatientCoverLimit: inPatientCoverLimit ?? this.inPatientCoverLimit,
      spouseCovered: spouseCovered ?? this.spouseCovered,
      children: children ?? this.children,
      coverChildren: coverChildren ?? this.coverChildren,
      spouseAgeBracket: spouseAgeBracket ?? this.spouseAgeBracket,
      benefits: benefits ?? this.benefits,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      index,
      firstName,
      lastName,
      middleName,
      originatingLeadSource,
      quoteId,
      owningBusinessUnit,
      leadId,
      source,
      capturingUser,
      ageBracket,
      inPatientCoverLimit,
      spouseCovered,
      children,
      coverChildren,
      spouseAgeBracket,
      benefits,
    ];
  }
}
