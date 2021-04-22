part of 'pages.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // set background
    Color bgColor =
        data['isDaytime'] ? Colors.lightBlue[400] : Colors.indigo[400];

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(color: bgColor),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag']
                    };
                  });
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
                style: TextButton.styleFrom(primary: Colors.black),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 28, letterSpacing: 2, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66, color: Colors.white),
              )
            ],
          ),
        ),
      )),
    );
  }
}
