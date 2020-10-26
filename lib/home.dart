import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    print(data);
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    print(data);
//pick image
    String img = data['isDay'] ? 'day.jpg' : 'nght.jpg';
    Color clr = data['isDay'] ? Colors.black : Colors.white;
    print(clr);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/$img"), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = {
                        'location': result['location'],
                        'time': result['time'],
                        'isDay': result['isDay'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  color: Colors.blue[200],
                  label: Text(
                    "Edit Location",
                    style: TextStyle(color: clr),
                  )),
              SizedBox(
                height: 50.0,
              ),
              Text(
                data['location'],
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.amber,
                  letterSpacing: 1.0,
                ),
              ),
              Center(
                child: Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 58.0,
                      color: clr,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
