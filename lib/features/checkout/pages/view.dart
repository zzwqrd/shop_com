
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../commonWidget/app_btn.dart';
import '../../../commonWidget/app_field.dart';
import '../controller/controller.dart';
import '../controller/model.dart';
import '../controller/state.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('الدفع'),
        ),
        body: BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AddressForm(),
                  SizedBox(height: 20),
                  _PaymentMethods(),
                  SizedBox(height: 20),
                  _OrderSummary(),
                  SizedBox(height: 20),
                  AppButton(
                    text: 'إتمام الطلب',
                    onPress: () {
                      // TODO: Implement checkout
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AddressForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('عنوان التوصيل', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16),
            AppTextField(
              hint: 'الاسم',
              prefix: Icon(Icons.person),
            ),
            SizedBox(height: 12),
            AppTextField(
              hint: 'رقم الهاتف',
              prefix: Icon(Icons.phone),
            ),
            SizedBox(height: 12),
            AppTextField(
              hint: 'العنوان',
              prefix: Icon(Icons.location_on),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('طريقة الدفع', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16),
            RadioListTile(
              value: 'cod',
              groupValue: 'cod',
              title: Text('الدفع عند الاستلام'),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ملخص الطلب', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16),
            _SummaryRow('المجموع الفرعي', '500 ر.س'),
            _SummaryRow('رسوم التوصيل', '30 ر.س'),
            Divider(),
            _SummaryRow('الإجمالي', '530 ر.س', isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _SummaryRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          )),
          Text(value, style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          )),
        ],
      ),
    );
  }
}
