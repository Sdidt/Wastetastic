import 'package:flutter/material.dart';

class RecycleInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlertDialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 40,
        ),
        titlePadding: EdgeInsets.all(0),
        contentPadding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreen.shade700,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 60.00,
          width: double.infinity,
          child: Center(
            child: Text('Lets Recycle', style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: AssetImage('assets/images/Wastetastic (2).png'),
              ),
              Text(
                "Normal Waste",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.teal.shade900,
                  fontSize: 29.0,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Normal waste can be generated from: Biodegradable products like food and kitchen waste, green waste, paper, cardboard, glass, bottles or jars. Composite wastes like clothing, tetra pack food, waste plastic from toys or furniture. Some of these are recyclable but materials like plastic must be treated properly. Regardless of being recyclable, they should be disposed of by proper waste management methods.",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 50,
              ),

              Text(
                "E-Waste",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 29.0,
                  color: Colors.teal.shade900,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "E-waste is generated from electrical devices, including computers and computer parts, printers, DVD and music players, TVs, telephones, vacuum cleaners and so on. These may contain toxic metals like lead, mercury, cadmium, and brominated flame retardants, which are all harmful to humans and the environment.",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Lightning Waste",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 29.0,
                  color: Colors.teal.shade900,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Lightning waste is generated from different types of bulbs/tubes contain chemicals and materials which maybe harmful to people or the environment and need to be properly disposed of.",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Colors.grey,
            child: const Text('Okay, got it!', style: TextStyle(
              fontSize: 16.0,
              //fontFamily: 'DancingScript',
              fontWeight: FontWeight.bold,
            ),),
          ),
        ],
      ),
    );
  }
}
