import 'package:flutter/material.dart';
import 'package:hotelino/feature/booking/presentation/provider/booking_provider.dart';
import 'package:hotelino/feature/booking/presentation/widgets/booking_form_field.dart';
import 'package:hotelino/feature/booking/presentation/widgets/date_picker_field.dart';
import 'package:hotelino/feature/booking/presentation/widgets/number_text_field.dart';
import 'package:hotelino/feature/booking/presentation/widgets/terms_widget.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  static final GlobalKey<BookingPageState> bookingPageKey =
      GlobalKey<BookingPageState>();
  BookingPage({Key? key}) : super(key: bookingPageKey);

  @override
  State<BookingPage> createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _formKey.currentState?.reset();
      TermsWidget.termsKey.currentState?.resetCheckbox();
      NumberFormField.numberFieldKey.currentState?.resetEnteredNumber();
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
                      const SizedBox(height: 12),
                      DatePickerField(
                        title: 'تاریخ رزرو',
                        hint: 'تاریخ رفت و برگشت را انتخاب کنید',
                        initialValue:
                            bookingProvider.booking.cehckInOutRangeDate,
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
                      const SizedBox(height: 8),
                      BookingFormField(
                        title: 'تعداد نفرات',
                        hint: 'تعداد نفرات را وارد کنید',
                        initialValue: bookingProvider.booking.numberOfGuests,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'لطفا تعداد نفرات را وارد کنید';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            bookingProvider.setNumberOfGuest(newValue);
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      NumberFormField(
                        initialValue: bookingProvider.booking.phoneNumber,
                        onSaved: (newValue) {
                          if (newValue != null) {
                            bookingProvider.setPhoneNumber(newValue);
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'لطفا شماره تماس را وارد کنید';
                          }
                          return null;
                        },
                      ),
                      TermsWidget(
                        initialValue: false,
                        validator: (value) {
                          if (value == null || value == false) {
                            return 'لطفا قوانین برنامه را تایید کنید';
                          }
                          return null;
                        },
                        onSaved: (newValue) {},
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'درخواست رزرو با موفقیت ثبت شد! 🎉',
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              );

                              resetForm();
                            }
                          },
                          child: const Text('جستجو هتل ها'),
                        ),
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
