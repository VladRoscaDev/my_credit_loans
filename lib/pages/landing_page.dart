import 'package:flutter/material.dart';
import 'package:my_credit_loans/enum/time_period.dart';
import 'package:my_credit_loans/pages/personal_data_page.dart';
import 'package:my_credit_loans/providers/user_provider.dart';
import 'package:my_credit_loans/services/monthly_rate_service.dart';
import 'package:my_credit_loans/widgets/custom_app_bar.dart';
import 'package:my_credit_loans/extensions/context_extensions.dart';
import 'package:my_credit_loans/widgets/fancy_layout.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  static const routeName = '/landing';
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _moneyValue = 100;
  TimePeriod _timePeriod = TimePeriod.ONE_MONTH;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: CustomAppBar(),
        body: FancyLayout(
          sectionTitle: 'Imprumutul dorit',
          layout: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: context.height * 0.05,
                ),
                _buildMoneyDescriptionField(),
                _buildMoneySlider(),
                Divider(),
                SizedBox(
                  height: context.height * 0.1,
                ),
                _buildPeriodDescriptionField(),
                _buildPeriodDropDown(),
                SizedBox(
                  height: context.height * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rata lunara:',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 22),
                      ),
                      Text(
                        '${MonthlyRateService.computeMonthlyRate(_moneyValue, _timePeriod).toStringAsFixed(4)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            userProvider.storePartialData(_moneyValue, _timePeriod);
            Navigator.of(context).pushNamed(PersonalDataPage.routeName,
                arguments: {_moneyValue, _timePeriod});
          },
        ));
  }

  Padding _buildPeriodDropDown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text('Selecati perioada dorita'),
        value: _timePeriod.name,
        items: _timePeriod.allNames.map<DropdownMenuItem<String>>((element) {
          return DropdownMenuItem<String>(
            child: Text(element),
            value: element,
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _timePeriod = TimePeriod.values
                .where((element) => element.name == newValue)
                .first;
          });
        },
      ),
    );
  }

  Padding _buildPeriodDescriptionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            'Perioada de timp selectata: ',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
          Text(
            '${_timePeriod.name}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
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
      value: _moneyValue.toDouble(),
      min: 100,
      max: 1000,
      divisions: 18,
      label: _moneyValue.round().toString() + ' RON',
      onChanged: (value) {
        setState(() {
          _moneyValue = value.toInt();
        });
      },
    );
  }
}
