import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int counter = 0;
  final List<String> items = [
    "https://cdn-front.freepik.com/images/ai/image-generator/cover/image-generator-header.webp?w=3840&h=1920&q=90%203840w,%20https://cdn-front.freepik.com/images/ai/image-generator/cover/image-generator-header.webp?w=7680&h=3840&q=90%207680w",
    "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
    "https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630",
    "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png"
  ];
  Icon constructIcon(int index) {
    if (index % 3 == 0) {
      return Icon(Icons.add_alert, color: Colors.amber);
    } else if (index % 3 == 1) {
      return Icon(Icons.mail, color: Colors.red);
    } else {
      return Icon(Icons.thumb_up, color: Colors.blue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('SkillRise', style: TextStyle(color: GlobalColors.textColor),)),
        elevation: 13,
        backgroundColor: GlobalColors.mainColor,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: constructIcon(index),
            title: Text('Item ${index + 1}'),
            subtitle: Text('Subtitle for Item ${index + 1}'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Action when the list item is tapped
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action when button is pressed
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}