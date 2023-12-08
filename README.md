
# **Bangla Converter**

The 'Bangla Converter' Flutter package transforms numbers seamlessly between Bangla and English, aiding developers in creating globally adaptable applications, improving numeric communication in various contexts, supporting localization efforts, and serving as an educational reference for implementing similar functionalities.

## **Features**

- Convert Bangla numeric to English numeric.
- Convert English numeric to Bangla numeric.
- Ignore other character(s) with the Number.
- Support all kind of Data Types.
- Suitable for al type of flutter applications.

## **Installation**

To use the 'Bangla Converter' Flutter package, follow these steps:

1. Add the following line to the dependencies section in your project's **`pubspec.yaml`** file:

```yaml
flutter pub add bangla_convertor
```

2. Import the package in your Dart code:

```dart
import 'package:bangla_convertor/bangla_convertor.dart';
```

## **Usage**

### **Bangla to English**
To Bangla to English, use the **`BanglaConverter.banToEng(number)`** method

### **English to Bangla**
To English to Bangla, use the **`BanglaConverter.engToBan(number)`** method

```dart
import 'package:bangla_convertor/bangla_convertor.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Bangla Converter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bangla To English Converter',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "Input: $banglaPhoneNumber",
            ),
            Text(
              "Output:  ${BanglaConverter.banToEng(banglaPhoneNumber)}",
            ),
            const SizedBox(height: 10),
            const Text(
              'English To Bangla Converter',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "Input: $englishPhoneNumber",
            ),
            Text(
              "Output:  ${BanglaConverter.engToBan(englishPhoneNumber)}",
            ),
            const SizedBox(height: 10),
            const Text(
              'You have pushed the button this many times in Bangla Language:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              BanglaConverter.engToBan("$_counter"),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
```
## **Example Render UI**
<img src="https://github.com/Pritom-Chaki/angla_converter/blob/main/example/images/example_ss.png?raw=true">

## **Contributions**

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## **License**

The 'Bangladesh' Flutter plugin is released under the **[MIT License](https://github.com/Pritom-Chaki/bangla_converter/blob/main/LICENSE)**.