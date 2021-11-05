import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/app_bar/bottom_navigation_bar.dart';
import '../../../core/widget/checkout_container.dart';
import '../../../core/widget/checkout_title.dart';
import '../../../core/widget/price_counter.dart';

enum SingingCharacter { cash, creditCard }

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key, List? names}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  SingingCharacter? _character = SingingCharacter.cash;
  final TextEditingController addNoteController = TextEditingController();
  bool isChecked = false;
  final firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Checkout"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.green.shade700,
                Colors.green.shade900,
              ],
            ),
          ),
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCheckoutContainer(
                  screenWidth,
                  screenHeight * 0.25,
                  [
                    buildCheckoutTitle(screenWidth, 'Add Note'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 7, 8, 0),
                      child: TextFormField(
                        controller: addNoteController,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "You can write your order note here",
                          fillColor: Colors.black,
                          focusColor: Colors.black,
                          hoverColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                buildCheckoutContainer(
                  screenWidth,
                  screenHeight * 0.2714,
                  [
                    buildCheckoutTitle(screenWidth, "Payment Method"),
                    ListTile(
                      title: const Text('Cash'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.cash,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Credit Card'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.creditCard,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                buildCheckoutContainer(
                  screenWidth,
                  screenHeight * 0.25,
                  [
                    buildCheckoutTitle(screenWidth, "Save the Planet"),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                            'Do not send cutlery(plastic ford, spoon, knife, napkins).'),
                      ],
                    ),
                  ],
                ),
                buildCheckoutContainer(screenWidth, screenHeight * 0.1, [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            height: screenHeight * 0.077,
                            color: Colors.green.shade700,
                            child: Align(
                              alignment: Alignment(-0.55, 0.0),
                              child: PriceCounter(),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green.shade900,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                              ),
                              height: screenHeight * 0.077,
                              width: screenWidth * 0.45,
                              child: Align(
                                alignment: Alignment(0.1, 0.0),
                                child: Text(
                                  "Order Now",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {
                              if (auth.currentUser != null) {
                                Map<String, dynamic> usersData = {
                                  'note': addNoteController.text,
                                  'payment method': _character.toString(),
                                  'save the planet': isChecked.toString(),
                                };
                                User? name = auth.currentUser;
                                CollectionReference usersRef =
                                    firestore.collection('users');

                                await usersRef
                                    .doc(name!.uid.toString())
                                    .collection('order information')
                                    .doc('inforamtion')
                                    .set(usersData, SetOptions(merge: true));

                                Get.to(
                                  () => BottomHomePage(),
                                );
                                var snapshot = await usersRef
                                    .doc(auth.currentUser!.uid.toString())
                                    .collection('basket')
                                    .get();
                                if (snapshot.docs.isNotEmpty) {
                                  for (var doc in snapshot.docs) {
                                    await doc.reference.delete();
                                  }
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(milliseconds: 1200),
                                    backgroundColor: Colors.grey.shade900,
                                    content: const Text(
                                      'The product has been ordered',
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
