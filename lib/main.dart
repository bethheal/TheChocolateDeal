import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(ProductLandingPage());
}

class ProductLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isHomeHovered = false;
  bool _isPackagesHovered = false;
  bool _isContactUsHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () {
              _scrollController.animateTo(0, duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
            },
            onHover: (value) {
              setState(() {
                _isHomeHovered = value;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Home',
                style: TextStyle(
                  color: _isHomeHovered ? Colors.black : Colors.white70, // Change color when hovered
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _scrollController.animateTo(550.0, duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
            },
            onHover: (value) {
              setState(() {
                _isPackagesHovered = value;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Packages',
                style: TextStyle(
                  color: _isPackagesHovered ? Colors.black : Colors.white70, // Change color when hovered
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _scrollController.animateTo(1150.0, duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
            },
            onHover: (value) {
              setState(() {
                _isContactUsHovered = value;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Contact Us',
                style: TextStyle(
                  color: _isContactUsHovered ? Color.fromARGB(255, 2, 9, 15) : Colors.white70, // Change color when hovered
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Padding(
  padding: EdgeInsets.all(16.0),
), // <-- Remove this comma
Hero(
  tag: 'homepage_image',
  child: Image.asset(
    'lib/assets/homepage_image.png',
    fit: BoxFit.contain,
    width: double.infinity,
    height: 550.0,
  ),
),

                
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      '-------- Products --------',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: CarouselImages(),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      '-------- GET IN TOUCH ---------',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ContactFormPage(),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}




class CarouselImages extends StatelessWidget {
  final List<String> images = [
    'lib/assets/whitee_choco.jpg',
    'lib/assets/yellow_choco.jpg',
    'lib/assets/blue_choco.jpg',
    'lib/assets/yellow_choco.jpg',
    'lib/assets/whitee_choco.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.brown, Colors.transparent],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 5),
          ),
        ],
      ),
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          final reversedIndex = images.length - 1 - index;

          return Container(
            width: 200,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(9.0),
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 60,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.brown),
                    ),
                    child: Text('Get'),
                    onPressed: () {
                      Scrollable.ensureVisible(
                        context,
                        duration: Duration(seconds:300 ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



class ContactFormPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [Colors.brown, Colors.transparent],begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "FOLLOW US ON" section on the left
                  Text(
                    'FOLLOW US ON',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                 
                  Row(
                    children: [
                      Icon(Icons.facebook),
                      SizedBox(width: 8),
                      Text('Facebook'),
                    ],
                  ),
                  SizedBox(height: 50),
                  
                 Text(
                    'GET IN TOUCH WITH US',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20), // Adding some space between the sections
                  // "Number, Address, and Email" section on the right
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 8),
                      Expanded(child: Text('123-456-7890')),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 8),
                      Expanded(child: Text('123 Main St, City, State')),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 8),
                      Expanded(child: Text('contact@example.com')),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: subjectController,
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: messageController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Implement your submit button functionality here
                        // For example, you can access the text from the text fields:
                        final name = nameController.text;
                        final email = emailController.text;
                        final subject = subjectController.text;
                        final message = messageController.text;

                        // Process the form data or send it to a server
                        // Here you can add your desired functionality when the submit button is pressed
                      },
                       style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.brown),
                    ),
                      child: Text(
              'Submit',
              style: TextStyle(color: Colors.white), // Optionally, you can set text color
            ), 
                               ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
