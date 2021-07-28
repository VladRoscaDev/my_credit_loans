import 'package:flutter/material.dart';
import 'package:my_credit_loans/enum/time_period.dart';
import 'package:my_credit_loans/widgets/custom_app_bar.dart';
import 'package:my_credit_loans/extensions/context_extensions.dart';

class LandingPage extends StatefulWidget {
  static const routeName = '/landing';
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double _moneyValue = 100;
  TimePeriod _timePeriod = TimePeriod.ONE_MONTH;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        color: Colors.indigo,
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.05,
            ),
            _buildSectionTitle(),
            SizedBox(
              height: context.height * 0.02,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: context.height * 0.1,
                          ),
                          _buildMoneyDescriptionField(),
                          _buildMoneySlider(),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          print('ceva');
        },
      ),
    );
  }

  Padding _buildMoneyDescriptionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Text(
            'Suma de bani dorita: ',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
          ),
          Text(
            '$_moneyValue RON',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      ),
    );
  }

  Slider _buildMoneySlider() {
    return Slider(
      value: _moneyValue,
      min: 100,
      max: 1000,
      divisions: 18,
      label: _moneyValue.round().toString() + ' RON',
      onChanged: (value) {
        setState(() {
          _moneyValue = value;
        });
      },
    );
  }

  Padding _buildSectionTitle() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Imprumutul dorit',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          )
        ],
      ),
    );
  }
}
