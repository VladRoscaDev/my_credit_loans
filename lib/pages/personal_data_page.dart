import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_credit_loans/enum/time_period.dart';
import 'package:my_credit_loans/models/user_model.dart';
import 'package:my_credit_loans/pages/error_page.dart';
import 'package:my_credit_loans/pages/success_page.dart';
import 'package:my_credit_loans/providers/user_provider.dart';
import 'package:my_credit_loans/widgets/app_button.dart';
import 'package:my_credit_loans/widgets/custom_app_bar.dart';
import 'package:my_credit_loans/extensions/context_extensions.dart';
import 'package:my_credit_loans/widgets/fancy_layout.dart';
import 'package:provider/provider.dart';

class PersonalDataPage extends StatefulWidget {
  static const routeName = '/personalData';
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  final _formKey = GlobalKey<FormState>();
  String _lastName = '';
  String _firstName = '';
  bool _isEmployeed = false;
  String _jobTitle = '';
  double _monthlyIncome = 0;
  XFile? _image;
  bool hasImageFromCamera = false;
  bool hasImageFromGallery = false;

  final _firstNameFocusNode = FocusNode();
  final _monthlyIncomeFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: FancyLayout(
        sectionTitle: 'Date Personale',
        layout: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.02,
              ),
              _buildLastNameInputField(_lastName, context, _firstNameFocusNode),
              _buildFirstNameInputField(_firstName, _firstNameFocusNode),
              Divider(),
              _buildEmployementStatusField(),
              Divider(),
              _buildJobTitleInputField(context),
              _buildMonthlyIncomeInputField(),
              _buildImagePicker(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                      message: 'Aplica',
                      callBackFunction: () {
                        if (_formKey.currentState!.validate()) {
                          if (_image != null) {
                            _formKey.currentState!.save();
                            UserModel userModel = new UserModel(
                              moneyAmount: userProvider.currentUser.moneyAmount,
                              periodOfTime:
                                  userProvider.currentUser.periodOfTime,
                              monthlyIncome: _monthlyIncome,
                              firstName: _firstName,
                              lastName: _lastName,
                              isEmployeed: _isEmployeed,
                            );
                            userProvider.storeUserProvider(userModel);
                            userProvider
                                .checkEligibility(context)
                                .then((value) {
                              if (value == 0) {
                                _goToErrorPage(context);
                              } else {
                                _goToSuccessPage(context, value);
                              }
                            });
                          } else {
                            _showErrorDialog(context);
                          }
                        }
                      })
                ],
              ),
              SizedBox(
                height: context.height * 0.01,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showErrorDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Atentit'),
              content: Text(
                  'Este obligatoriu sa introduceti o fotografie a ultimei facturi!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
            ));
  }

  Future<dynamic> _goToErrorPage(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ErrorPage(
          message:
              'Atentie, a aparut o eroare la conexiune catre server, va rugam sa reincercati!',
        ),
      ),
    );
  }

  Future<dynamic> _goToSuccessPage(BuildContext context, int value) {
    return Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => SuccessPage(
                message: value > 5 ? 'Sunteti eligibil' : 'Nu sunteti eligibil',
                isEligible: value > 5,
                eligibleScore: value,
              )),
    );
  }

  Padding _buildImagePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Poza ultimei facturi:'),
          Row(
            children: [
              Column(
                children: [
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () async {
                        final ImagePicker _picker = ImagePicker();
                        final XFile? image =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (image != null) {
                          setState(() {
                            hasImageFromCamera = true;
                            hasImageFromGallery = false;
                            _image = image;
                          });
                        }
                      },
                      child: Container(
                          width: context.width * 0.15,
                          height: context.height * 0.08,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                            child: hasImageFromCamera
                                ? Icon(
                                    Icons.done,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.camera,
                                    color: Colors.grey,
                                  ),
                          )),
                    ),
                  ),
                  Text('Folosind camera')
                ],
              ),
              SizedBox(
                width: context.width * 0.1,
              ),
              Column(
                children: [
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () async {
                        final ImagePicker _picker = ImagePicker();
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (image != null) {
                          setState(() {
                            hasImageFromGallery = true;
                            hasImageFromCamera = false;
                            _image = image;
                          });
                        }
                      },
                      child: Container(
                          width: context.width * 0.15,
                          height: context.height * 0.08,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                            child: hasImageFromGallery
                                ? Icon(
                                    Icons.done,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.upload,
                                    color: Colors.grey,
                                  ),
                          )),
                    ),
                  ),
                  Text('Din galerie')
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Padding _buildMonthlyIncomeInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: _monthlyIncome == 0.0 ? '' : _monthlyIncome.toString(),
        focusNode: _monthlyIncomeFocusNode,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.money_rounded),
            labelText: 'Suma venit lunar'),
        validator: ((value) {
          if (value == null || value.isEmpty) {
            return 'Campul este obligatoriu';
          }
          if (double.parse(value) == 0) {
            return 'Suma nu poate fi 0';
          }
          return null;
        }),
        onSaved: ((value) {
          setState(() {
            double.parse(value!);
          });
        }),
      ),
    );
  }

  Padding _buildJobTitleInputField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: _jobTitle,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.location_city_rounded),
            labelText: 'Titlul job-ului'),
        onSaved: ((value) {
          setState(() {
            _jobTitle = value!;
          });
        }),
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_monthlyIncomeFocusNode);
        },
      ),
    );
  }

  Padding _buildEmployementStatusField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Statut ocupational: '),
              Text(
                '${_isEmployeed ? 'Sunt angajat' : 'Nu sunt angajat'}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Switch(
              value: _isEmployeed,
              onChanged: (value) {
                setState(() {
                  _isEmployeed = value;
                });
              })
        ],
      ),
    );
  }

  Padding _buildFirstNameInputField(
      String _firstName, FocusNode _firstNameFocusNode) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: _firstName,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_rounded),
          labelText: 'Prenume',
        ),
        focusNode: _firstNameFocusNode,
        onSaved: ((value) {
          setState(() {
            _firstName = value!;
          });
        }),
        validator: ((value) {
          if (value == null || value.isEmpty) {
            return 'Campul este obligatoriu';
          }
          return null;
        }),
      ),
    );
  }

  Padding _buildLastNameInputField(
      String _lastName, BuildContext context, FocusNode _firstNameFocusNode) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: _lastName,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_rounded),
          labelText: 'Nume',
        ),
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_firstNameFocusNode);
        },
        onSaved: ((value) {
          setState(() {
            _lastName = value!;
          });
        }),
        validator: ((value) {
          if (value == null || value.isEmpty) {
            return 'Campul este obligatoriu';
          }
          return null;
        }),
      ),
    );
  }
}
