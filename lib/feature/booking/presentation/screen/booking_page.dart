import 'package:flutter/material.dart';
import 'package:hotelino/feature/booking/presentation/provider/booking_provider.dart';
import 'package:hotelino/feature/booking/presentation/widgets/booking_form_field.dart';
import 'package:hotelino/feature/booking/presentation/widgets/date_picker_field.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();

  void _resetForm() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _formKey.currentState?.reset();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'رزرو هتل',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Consumer<BookingProvider>(
              builder: (context, bookingProvider, child) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookingFormField(
                        title: 'نام و نام خانوادگی',
                        hint: 'نام و نام خانوادگی خود را وارد کنید',
                        initialValue: bookingProvider.booking.fullName,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'لطفا نام و نام خانوادگی خود را وارد کنید';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            bookingProvider.setName(newValue);
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      BookingFormField(
                        title: 'مقصد',
                        hint: 'مقصد خود را وارد کنید',
                        initialValue: bookingProvider.booking.destination,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'لطفا مقصد خود را وارد کنید';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            bookingProvider.setDestination(newValue);
                          }
                        },
                      ),
                      const SizedBox(height: 8,),
                      DatePickerField(
                        title: 'تاریخ رزرو',
                        hint: 'تاریخ رفت و برگشت را انتخاب کنید',
                        initialValue: bookingProvider.booking.cehckInOutRangeDate,
                        validator: (value) {
                          if (value == null) {
                            return 'لطفا تاریخ رفت و برگشت را انتخاب کنید';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            bookingProvider.setRangeDate(newValue);
                          }
                        },
                      ),  
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
