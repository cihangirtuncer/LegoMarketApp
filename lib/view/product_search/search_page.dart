import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/appBar/main_appbar.dart';

class ProductSearch extends StatefulWidget {
  ProductSearch({Key? key}) : super(key: key);

  @override
  _ProductSearchState createState() => _ProductSearchState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ProductSearchState extends State<ProductSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar("Search"),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                hintText: 'what are you looking for',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text(
                  'Search',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
