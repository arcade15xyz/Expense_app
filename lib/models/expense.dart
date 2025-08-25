import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum EnumCategory { food, travel, leisure, work }

const categoryIcons = {
  EnumCategory.food: Icons.lunch_dining,
  EnumCategory.travel: Icons.flight_takeoff,
  EnumCategory.leisure: Icons.movie,
  EnumCategory.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final EnumCategory category;

  get formattedDate {
    return formatter.format(date);
  }
}
