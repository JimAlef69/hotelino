import 'package:flutter/material.dart';

class BookingFormField extends StatelessWidget {


final String hint;
final String title;
final String initialValue;
final TextInputType keyboardType;
final FormFieldValidator<String>? validator;
final FormFieldSetter<String>? onSaved;

  const BookingFormField({super.key, 
  required this.hint,
  required this.title, 
  required this.initialValue,
  required this.keyboardType,
  this.validator,
  this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( 
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8,),
        Directionality(
          textDirection: TextDirection.rtl,
           child: TextFormField(
            textAlign: TextAlign.right, //for persian text
            textDirection: TextDirection.rtl, //for persian text
            initialValue: initialValue,
            decoration: InputDecoration(
              hintText: hint,
            ),
            validator: validator,
            onSaved: onSaved,
           ),
           ),
      ],
    );
  }
}