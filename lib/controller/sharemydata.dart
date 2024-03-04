import 'package:shared_preferences/shared_preferences.dart';

class  SaveMyData {

   static String memeKey = 'MEMEKEY';

   static Future<bool> savaData(int val) async{
     final inst = await SharedPreferences.getInstance();
     return await  inst.setInt(memeKey,val);
   }

   static Future<int?> fetchData() async {
     final inst = await SharedPreferences.getInstance();
     return await  inst.getInt(memeKey);
   }
}
