import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final idController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visible = false;
  int centuryId = 0;
  int century = 0;
  int year = 0;
  String month = "";
  String day = "";
  int govCode = 0;
  String bornIn = "";
  int genderId = 0;
  String gender = "";
  String cardNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 243, 244, 1.0),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1 / 2,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(94, 30, 96, 1.0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(
                  top: 70,
                ),
                width: 300,
                height: 100,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(124, 71, 126, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
              ),
              Container(
                width: 320,
                height: 500,
                margin: const EdgeInsetsDirectional.only(
                  top: 90,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(253, 253, 254, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "National ID",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Mention your ID",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Id required!";
                              }
                              if (!(value.length == 14)) {
                                visible = false;
                                return "Invalid id";
                              }
                              return null;
                            },
                            controller: idController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            cursorColor: const Color.fromRGBO(94, 30, 96, 1.0),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(94, 30, 96, 1.0),
                                ),
                              ),
                              suffixIcon: Icon(
                                FontAwesomeIcons.idCard,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            analysis();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(29, 29, 30, 1.0)),
                        child: const Text(
                          "Analysis",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: visible,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Year:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "$year",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Month:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                month,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Day:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                day,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Born In:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                bornIn,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Gender:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                gender,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Card Number:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                cardNumber,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                idController.text="";
                                visible=false;
                              });
                            },
                            child: const Text(
                              "Clear",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void analysis() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    String id = idController.text;
    centuryId = int.parse(id.substring(0, 1));
    year = int.parse(id.substring(1, 3));
    month = id.substring(3, 5);
    day = id.substring(5, 7);
    govCode = int.parse(id.substring(7, 9));
    cardNumber = id.substring(7, 14);
    genderId = int.parse(id.substring(12, 13));

    switch (centuryId) {
      case 2:
        century = 1900;
        break;
      case 3:
        century = 2000;
        break;
      default:
        {
          setState(() {
            idController.text = "Invalid century";
            visible = false;
          });
          return;
        }
    }
    year = century + year;
    if (int.parse(month) < 1 || int.parse(month) > 12) {
      setState(() {
        idController.text = "Invalid month";
        visible = false;
      });
      return;
    }
    if (int.parse(day) < 1 || int.parse(day) > 31) {
      setState(() {
        idController.text = "Invalid month";
        visible = false;
      });
      return;
    }
    switch (govCode) {
      case 1:
        bornIn = "Cairo";
        break;
      case 2:
        bornIn = "Alexandria";
        break;
      case 3:
        bornIn = "Port Said";
        break;
      case 4:
        bornIn = "Suez";
        break;
      case 11:
        bornIn = "Damietta";
        break;
      case 12:
        bornIn = "Dakahlia";
        break;
      case 13:
        bornIn = "Sharqia";
        break;
      case 14:
        bornIn = "Qalyubia";
        break;
      case 15:
        bornIn = "Kafr El Sheikh";
        break;
      case 16:
        bornIn = "Gharbia";
        break;
      case 17:
        bornIn = "Monufia";
        break;
      case 18:
        bornIn = "Beheira";
        break;
      case 19:
        bornIn = "Ismailia";
        break;
      case 21:
        bornIn = "Giza";
        break;
      case 22:
        bornIn = "Beni Suef";
        break;
      case 23:
        bornIn = "Faiyum";
        break;
      case 24:
        bornIn = "Minya";
        break;
      case 25:
        bornIn = "Asyut";
        break;
      case 26:
        bornIn = "Sohag";
        break;
      case 27:
        bornIn = "Qena";
        break;
      case 28:
        bornIn = "Aswan";
        break;
      case 29:
        bornIn = "Luxor";
        break;
      case 31:
        bornIn = "Red Sea";
        break;
      case 32:
        bornIn = "New Valley";
        break;
      case 33:
        bornIn = "Matruh";
        break;
      case 34:
        bornIn = "North Sinai";
        break;
      case 35:
        bornIn = "South Sinai";
        break;
      case 88:
        bornIn = "Outside the Arab Republic of \nEgypt ";
        break;
      default:
        {
          setState(() {
            idController.text = "Invalid government";
            visible = false;
          });
          return;
        }
    }
    if (genderId % 2 == 0) {
      gender = "Female";
    } else {
      gender = "Male";
    }
    visible = true;
  }
}