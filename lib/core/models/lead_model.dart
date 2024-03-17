import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Lead extends Equatable {
  final String customerName;
  final int index;

  const Lead({required this.customerName, required this.index});

  Lead copyWith({
    String? customerName,
    int? index,
  }) {
    return Lead(
      customerName: customerName ?? this.customerName,
      index: index ?? this.index,
    );
  }

  factory Lead.fromMap(Map<String, dynamic> map) {
    return Lead(
      customerName: map['customerName'],
      index: map['index'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerName': customerName,
      'index': index,
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
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'customerName': customerName,
      'index': index,
    };
  }

  @override
  List<Object?> get props => [customerName, index];
}
