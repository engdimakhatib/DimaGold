import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
// static late  SharedPreferences sharedPreferences;
// //للتعريف
//  static init() async { sharedPreferences = await SharedPreferences.getInstance(); }
// //لوضع المعطيات
//  static Future<bool> putBoolean({ required String key ,  required bool value })async
//  { return await  sharedPreferences.setBool('key',value);}
// //لجلب المعطيات
//   static Future<bool?>? getBoolean({ required String key })async
//  {
//   print(' shared value is : ${sharedPreferences.getBool(key)}');
//    return  sharedPreferences.getBool(key);}

  static late SharedPreferences? sharedPreferences;
static init() async { sharedPreferences =await SharedPreferences.getInstance(); }
static Future<bool>  savaData({required String key ,required dynamic value})async
 {
  if(value is String ) return await sharedPreferences!.setString(key, value);
  if(value is int ) return await sharedPreferences!.setInt(key, value);
  if(value is bool ) return await sharedPreferences!.setBool(key, value);
  return await sharedPreferences!.setDouble(key, value);
 }
static dynamic getData({required String key}){return  sharedPreferences!.get(key);}
//for sign out : clear token and navigateandfinish on login
static Future<bool> removeData({required String key})async { return await sharedPreferences!.remove(key); }
}

