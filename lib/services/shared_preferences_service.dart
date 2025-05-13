// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import 'package:dozan/model/user.dart';

// class SharedPreferencesService {
//   static Future<void> saveUserToSharedPreferences(User user) async {
//     final prefs = await SharedPreferences.getInstance();

//     // تحويل الـ User إلى JSON
//     String userJson = json.encode(user.toJson());

//     // استرجاع قائمة المستخدمين الحالية
//     List<String> users = prefs.getStringList('users') ?? [];

//     // إضافة المستخدم الجديد إلى القائمة
//     users.add(userJson);

//     // حفظ القائمة في SharedPreferences
//     await prefs.setStringList('users', users);
//   }

//   static Future<List<User>> getUsersFromSharedPreferences() async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> usersJson = prefs.getStringList('users') ?? [];

//     // تحويل الـ JSON إلى كائنات User أو Provider
//     List<User> users =
//         usersJson.map((userJson) {
//           Map<String, dynamic> userMap = json.decode(userJson);
//           if (userMap.containsKey('career')) {
//             return Provider.fromJson(userMap); // مزود الخدمة
//           } else {
//             return User.fromJson(userMap); // عميل
//           }
//         }).toList();

//     return users;
//   }

//   static Future<User?> login(String username, String password) async {
//     List<User> users = await getUsersFromSharedPreferences();

//     for (var user in users) {
//       if (user.username == username && user.password == password) {
//         return user; // العودة بالمستخدم إذا كانت البيانات مطابقة
//       }
//     }

//     return null; // العودة بـ null إذا لم يتم العثور على تطابق
//   }
// }
