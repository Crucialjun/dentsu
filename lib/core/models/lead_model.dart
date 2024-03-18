import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Lead extends Equatable {
  final String customerName;
  final int index;
  final String dateCreated;
  final String email;
  final bool isContacted;
  final String lastContacted;
  final String leadCloseReason;
  final String leadSource;
  final String nextAppointment;
  final String productRequested;
  final String productSold;
  final String recordingAgent;

  const Lead(
      {required this.customerName,
      required this.index,
      required this.dateCreated,
      required this.email,
      required this.isContacted,
      required this.lastContacted,
      required this.leadCloseReason,
      required this.leadSource,
      required this.nextAppointment,
      required this.productRequested,
      required this.productSold,
      required this.recordingAgent});

  Lead copyWith({
    String? customerName,
    int? index,
    String? dateCreated,
    String? email,
    bool? isContacted,
    String? lastContacted,
    String? leadCloseReason,
    String? leadSource,
    String? nextAppointment,
    String? productRequested,
    String? productSold,
    String? recordingAgent,
  }) {
    return Lead(
      customerName: customerName ?? this.customerName,
      index: index ?? this.index,
      dateCreated: dateCreated ?? this.dateCreated,
      email: email ?? this.email,
      isContacted: isContacted ?? this.isContacted,
      lastContacted: lastContacted ?? this.lastContacted,
      leadCloseReason: leadCloseReason ?? this.leadCloseReason,
      leadSource: leadSource ?? this.leadSource,
      nextAppointment: nextAppointment ?? this.nextAppointment,
      productRequested: productRequested ?? this.productRequested,
      productSold: productSold ?? this.productSold,
      recordingAgent: recordingAgent ?? this.recordingAgent,
    );
  }

  factory Lead.fromMap(Map<String, dynamic> map) {
    return Lead(
      customerName: map['customerName'],
      index: map['index'],
      dateCreated: map['dateCreated'],
      email: map['email'],
      isContacted: map['isContacted'],
      lastContacted: map['lastContacted'],
      leadCloseReason: map['leadCloseReason'],
      leadSource: map['leadSource'],
      nextAppointment: map['nextAppointment'],
      productRequested: map['productRequested'],
      productSold: map['productSold'],
      recordingAgent: map['recordingAgent'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerName': customerName,
      'index': index,
      'dateCreated': dateCreated,
      'email': email,
      'isContacted': isContacted,
      'lastContacted': lastContacted,
      'leadCloseReason': leadCloseReason,
      'leadSource': leadSource,
      'nextAppointment': nextAppointment,
      'productRequested': productRequested,
      'productSold': productSold,
      'recordingAgent': recordingAgent,
    };
  }

  factory Lead.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Lead(
      customerName: data['customerName'],
      index: data['index'],
      dateCreated: data['dateCreated'],
      email: data['email'],
      isContacted: data['isContacted'],
      lastContacted: data['lastContacted'],
      leadCloseReason: data['leadCloseReason'],
      leadSource: data['leadSource'],
      nextAppointment: data['nextAppointment'],
      productRequested: data['productRequested'],
      productSold: data['productSold'],
      recordingAgent: data['recordingAgent'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'customerName': customerName,
      'index': index,
      'dateCreated': dateCreated,
      'email': email,
      'isContacted': isContacted,
      'lastContacted': lastContacted,
      'leadCloseReason': leadCloseReason,
      'leadSource': leadSource,
      'nextAppointment': nextAppointment,
      'productRequested': productRequested,
      'productSold': productSold,
      'recordingAgent': recordingAgent,
    };
  }

  @override
  List<Object?> get props => [
        customerName,
        index,
        dateCreated,
        email,
        isContacted,
        lastContacted,
        leadCloseReason,
        leadSource,
        nextAppointment,
        productRequested,
        productSold,
        recordingAgent
      ];
}
