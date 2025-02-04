```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        for (final item in jsonData) {
          final name = item['name'] ?? 'N/A'; // Handle missing 'name' field
          print('Name: $name');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}
```