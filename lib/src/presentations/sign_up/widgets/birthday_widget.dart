import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class BirthdayWidget extends StatelessWidget {
  const BirthdayWidget({
    super.key,
    this.title = "Birthday",
    required this.onChange,
    required this.selectedDate,
    required this.lastDate,
  });

  final String title;
  final Function(DateTime date) onChange;
  final DateTime selectedDate;
  final DateTime lastDate;

  @override
  Widget build(BuildContext context) {
    final formater = DateFormat('dd/MM/yyyy');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.boldTextNightBlue),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              formater.format(selectedDate),
              style: AppStyles.normalTextMulledWine,
            ),
          ),
        )
      ],
    );
  }

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: lastDate,
    );
    if (picked != null && picked != selectedDate) onChange(picked);
  }
}
