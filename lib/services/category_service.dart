import 'package:lego_market_app/utils/dbhelper.dart';

class CategoryService {
  DatabaseHelper _databaseHelper;

  CategoryService() {
    _databaseHelper = DatabaseHelper();
  }

  readCategories(String table) async {
    return await _databaseHelper.readData(table);
  }
}
