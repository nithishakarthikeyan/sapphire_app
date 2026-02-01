import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Color.fromARGB(255, 0, 69, 104),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wallet');
            },
            icon: Icon(Icons.account_balance_wallet),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/calendar');
            },
            icon: Icon(Icons.calendar_month_outlined),
          ),
        ],
      ),
    );
  }
}


void main() {
  runApp(HomeServicesApp());
}

class HomeServicesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Services App',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 69, 104),
      ),
      home: HomePage(),
      routes: {
        '/cleaning': (context) => CleaningPage(),
        '/painting': (context) => PaintingPage(),
        '/carwash': (context) => CarwashPage(),
        '/fixing': (context) => FixingPage(),
        '/aircon': (context) => AirconPage(),
        '/electrical': (context) => ElectricalPage(),
        '/plumbing': (context) => PlumbingPage(),
        '/moving': (context) => MovingPage(),
        '/gardening': (context) => GardeningPage(),
        '/profile': (context) => ProfilePage(),
        '/home': (context) => HomePage(),
        '/wallet': (context) => WalletPage(),
        '/list': (context) => ListPage(), 
        '/calendar': (context) => CalendarPage(), 
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Service> services = [
    Service(
      title: 'Cleaning',
      iconPath: 'cleaning.png',
      route: '/cleaning',
    ),
    Service(
      title: 'Painting',
      iconPath: 'painting.png',
      route: '/painting',
    ),
    Service(
      title: 'Carwash',
      iconPath: 'carwash.png',
      route: '/carwash',
    ),
    Service(
      title: 'Fixing',
      iconPath: 'service.png',
      route: '/fixing',
    ),
    Service(
      title: 'Aircon',
      iconPath: 'aircon.png',
      route: '/aircon',
    ),
    Service(
      title: 'Electrical',
      iconPath: 'electrical.png',
      route: '/electrical',
    ),
    Service(
      title: 'Plumbing',
      iconPath: 'plumbing.png',
      route: '/plumbing',
    ),
    Service(
      title: 'Moving',
      iconPath: 'delivery.png',
      route: '/moving',
    ),
    Service(
      title: 'Gardening',
      iconPath: 'gardening.png',
      route: '/gardening',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile'); // Navigate to the profile page
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Hey Jega! What would you like today?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontFamily: 'Fire Sans',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for services...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                // Implement search functionality
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(left: 40, top: 40, right: 40),
              itemCount: services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, services[index].route);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Color.fromRGBO(217, 248, 244, 1),
                    child: SizedBox(
                      width: 10, // Adjust the width of the card
                      height: 10, // Adjust the height of the card
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/${services[index].iconPath}',
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(height: 15),
                          Text(
                            services[index].title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class Service {
  final String title;
  final String route;
  final String iconPath;

  Service({required this.title, required this.route, required this.iconPath});
}

class ServiceProvider {
  final String name;
  final double rating;
  final double hourlyRate;
  final int jobsDone;
  final String profilePic;

  ServiceProvider({
    required this.name,
    required this.rating,
    required this.hourlyRate,
    required this.jobsDone,
    required this.profilePic,
  });
}

class CleaningPage extends StatelessWidget {
  final List<ServiceProvider> cleaningServiceProviders = [
    ServiceProvider(
      name: 'Alice Johnson',
      rating: 4.7,
      hourlyRate: 30.0,
      jobsDone: 15,
      profilePic: 'assets/user.png',
    ),
    ServiceProvider(
      name: 'Bob Smith',
      rating: 4.5,
      hourlyRate: 25.0,
      jobsDone: 10,
      profilePic: 'assets/user.png',
    ),
    ServiceProvider(
      name: 'Eva Thompson',
      rating: 4.8,
      hourlyRate: 35.0,
      jobsDone: 20,
      profilePic: 'assets/user.png',
    ),
    // Add more cleaning service providers here
  ];

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Cleaning Service'),
    ),
    body: ListView.builder(
      itemCount: cleaningServiceProviders.length,
      itemBuilder: (context, index) {
        final provider = cleaningServiceProviders[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CleaningBookingPage()),
              );
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 3.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(provider.profilePic),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Text(provider.rating.toString()),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('${provider.jobsDone} jobs done'),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Text(
                      '\$${provider.hourlyRate.toStringAsFixed(2)}/hr',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 69, 104),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
       );
      },
    ),
  );
}
}


class PaintingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painting'),
      ),
      body: Center(
        child: Text('Painting Page'),
      ),
    );
  }
}

class CarwashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Wash'),
      ),
      body: Center(
        child: Text('Carwash Page'),
      ),
    );
  }
}

class FixingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fixing'),
      ),
      body: Center(
        child: Text('Fixing Page'),
      ),
    );
  }
}

class AirconPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aircon Service'),
      ),
      body: Center(
        child: Text('Aircon Page'),
      ),
    );
  }
}

class ElectricalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electrical Service'),
      ),
      body: Center(
        child: Text('Electrical Page'),
      ),
    );
  }
}

class PlumbingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plumbing Service'),
      ),
      body: Center(
        child: Text('Plumbing Page'),
      ),
    );
  }
}

class MovingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Service'),
      ),
      body: Center(
        child: Text('Moving Page'),
      ),
    );
  }
}

class GardeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gardening Service'),
      ),
      body: Center(
        child: Text('Gardening Page'),
      ),
    );
  }
}

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color.fromARGB(255, 16, 24, 84), // Set the desired color here
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SappCard',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Fire Sans',
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 120),
                    Text(
                      '\$500',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(217, 248, 244, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle top-up action
                },
                child: Column(
                  children: [
                    Icon(Icons.add_circle),
                    SizedBox(height: 10),
                    Text('Top Up'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle edit card details action
                },
                child: Column(
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(height: 10),
                    Text('Edit Card Details'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Number of dummy transactions
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('May 23, 2023'),
                  subtitle: Text('USD 50'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Handle view details button click
                    },
                    child: Text('View Details'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool isOngoingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List'),
      ),

      body: Container(
        padding:EdgeInsets.zero,
        child:Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isOngoingSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    primary:
                        isOngoingSelected ? Colors.blue : Colors.grey,
                  ),
                  child: Text('Ongoing'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isOngoingSelected = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    primary:
                        isOngoingSelected ? Colors.grey : Colors.blue,
                  ),
                  child: Text('Completed'),
                ),
              ),
            ],
          ),
          
          isOngoingSelected
              ? OngoingList()
              : CompletedList(),
        ],
      ),
    ),
    );
  }
}

class OngoingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your actual list of ongoing items
    List<Widget> ongoingItems = [
      OngoingItemCard(
        profilePicture: Image.asset('assets/user.png'),
        service: 'Cleaning Service',
        name: 'Anna Lee',
        date: 'May 26, 2023',
        time: '10:00AM',
      ),
      OngoingItemCard(
        profilePicture: Image.asset('assets/user.png'),
        service: 'Car Wash',
        name: 'John Smith',
        date: 'May 27, 2023',
        time: '3:00PM',
      ),
    ];

    return Expanded(
      child: Container(
        padding: EdgeInsets.zero,
        child: ListView.builder(
          itemCount: ongoingItems.length,
          itemBuilder: (context, index) {
            return ongoingItems[index];
          },
        ),
      ),
    );



  }
}

class OngoingItemCard extends StatelessWidget {
  final Image profilePicture;
  final String name;
  final String service;
  final String date;
  final String time;

  const OngoingItemCard({
    required this.profilePicture,
    required this.name,
    required this.service,
    required this.date,
    required this.time,
  });

  @override
@override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Adjust the value to control the roundness
      ),
      child: ListTile(
        leading: profilePicture,
        title: Text(
          service,
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the text bold
            color: Colors.blue, // Change the color of the text
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name),
            SizedBox(height: 15),
            Text(date),
            Text(time),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.message_rounded),
          onPressed: () {
            // Handle chat option
          },
        ),
      ),
    );
  }
}

class CompletedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your actual list of completed items
    List<Widget> completedItems = [
      CompletedItemCard(
        profilePicture: Image.asset('assets/user.png'),
        service: 'Gardening Service',
        name: 'Angelina',
        date: 'May 25, 2023',
        timeCompleted: '12:00 PM - 2:00 PM',
        amountPaid: '\$100',
      ),
      CompletedItemCard(
        profilePicture: Image.asset('assets/user.png'),
        service: 'Painting Service',
        name: 'Maria',
        date: 'May 24, 2023',
        timeCompleted: '9:00 AM - 11:00 AM',
        amountPaid: '\$80',
      ),
    ];

    return Expanded(
      child: Container(
        padding:EdgeInsets.zero,
      child: ListView(
        //padding: EdgeInsets.all(20),
        children: completedItems,
      ),
      ),
    );
  }
}

class CompletedItemCard extends StatelessWidget {
  final Image profilePicture;
  final String name;
  final String service;
  final String date;
  final String timeCompleted;
  final String amountPaid;

  const CompletedItemCard({
    required this.profilePicture,
    required this.name,
    required this.service,
    required this.date,
    required this.timeCompleted,
    required this.amountPaid,
  });

  @override
Widget build(BuildContext context) {
  return Card(
    child: ListTile(
      leading: profilePicture,
      title: Text(
        service,
        style: TextStyle(
          fontWeight: FontWeight.bold, // Make the title text bold
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          SizedBox(height: 15),
          Text(date),
          Text(timeCompleted),
        ],
      ),
      trailing: Text(
        amountPaid,
        style: TextStyle(
          fontWeight: FontWeight.bold, // Make the trailing text bold
        ),
      ),
    ),
  );
}
}



class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Progress',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.5, // Assuming the user has progressed halfway
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          backgroundColor: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '50% off!',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Total Hires',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '25',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Ongoing Hires',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '10',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              onTap: () {
                // Handle edit profile option
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle settings option
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQ'),
              onTap: () {
                // Handle FAQ option
              },
            ),
            ListTile(
              leading: Icon(Icons.headphones_rounded),
              title: Text('Help Centre'),
              onTap: () {
                // Handle FAQ option
              },
            ),
            ListTile(
              title: Text('Legal'),
              onTap: () {
                // Handle FAQ option
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                // Handle FAQ option
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: Text('Calendar'),
      ),
    );
  }
}

class CleaningBookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<CleaningBookingPage> {
  List<DateTime> availableDates = [
    DateTime.now().add(Duration(days: 1)),
    DateTime.now().add(Duration(days: 2)),
    DateTime.now().add(Duration(days: 3)),
    DateTime.now().add(Duration(days: 4)),
    DateTime.now().add(Duration(days: 5)),
  ];



  DateTime? selectedDate;
  String location = '';
  int numOfBedrooms = 0;
  int numOfBathrooms = 0;
  String additionalNotes = '';
  List<String> availableTimes = ['9:00 AM', '11:00 AM', '2:00 PM', '4:00 PM'];
  String? selectedTime;

  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;
  int selectedDuration = 1;


  PageController pageController = PageController(initialPage: DateTime.now().month - 1);
  

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          location = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter location',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Select Duration',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (selectedDuration > 1) {
                          selectedDuration--;
                        }
                      });
                    },
                    icon: Icon(Icons.remove),
                  ),
                  NumberPicker(
                    value: selectedDuration,
                    minValue: 1,
                    maxValue: 24,
                    onChanged: (value) {
                      setState(() {
                        selectedDuration = value;
                      });
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (selectedDuration < 24) {
                          selectedDuration++;
                        }
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            
              
              SizedBox(height: 5),
              Text(
                'Select Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentMonth = currentMonth == 1 ? 12 : currentMonth - 1;
                        if (currentMonth == 12) currentYear--;
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_left),
                  ),
                  Text(
                    _getMonthName(currentMonth),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentMonth = currentMonth == 12 ? 1 : currentMonth + 1;
                        if (currentMonth == 1) currentYear++;
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),

              Container(
                height: 100,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    DateTime currentDate = DateTime.now().add(Duration(days: 30 * index));
                    List<DateTime> currentMonthDates = _getDatesForMonth(currentDate.month, currentDate.year);
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: currentMonthDates.map((date) {
                          bool isSelected = date == selectedDate;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = date;
                              });
                            },
                    child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                width: 80,
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.blue : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _getWeekdayAbbreviation(date.weekday),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${date.day}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                );
                  
                }).toList(),
              ),
              );
              },
              ),
              ),
              SizedBox(height: 20),
              Text(
                'Select Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(availableTimes.length, (index) {
                  String time = availableTimes[index];
                  bool isSelected = time == selectedTime;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = time;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        time,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Text(
                'Number of Bedrooms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildBedroomOption(1),
                  _buildBedroomOption(2),
                  _buildBedroomOption(3),
                  _buildBedroomOption(4),
                  _buildBedroomOption(5),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Number of Bathrooms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildBathroomOption(1),
                  _buildBathroomOption(2),
                  _buildBathroomOption(3),
                  _buildBathroomOption(4),
                  _buildBathroomOption(5),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Add Note',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    additionalNotes = value;
                  });
                },
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Bring cleaning supplies...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                   // Handle booking submission and navigate to the summary page
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                         builder: (context) => BookingSummaryPage(
                             serviceProviderName: 'Service Provider Name',
                             date: 'date',
                             time: 'time',
                             location: 'location',
                             subtotal: 0.00,
                             serviceFee: 0.00,
                             additionalFee: 0.00,
                             totalAmount: 0.00,
                           ),
                          ),
                        );
                       },
                       child: Text('Book Now'),
               ),
            ],
          ),
        ),
      ),
    );
  }

  


  List<DateTime> _getDatesForMonth(int month, int year) {
    int daysInMonth = DateTime(year, month + 1, 0).day;
    return List.generate(daysInMonth, (index) => DateTime(year, month, index + 1));
  }

  String _getWeekdayAbbreviation(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  Widget _buildBedroomOption(int value) {
    bool isSelected = numOfBedrooms == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          numOfBedrooms = value;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bed,
                color: isSelected ? Colors.white : Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                value.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBathroomOption(int value) {
    bool isSelected = numOfBathrooms == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          numOfBathrooms = value;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bathtub,
                color: isSelected ? Colors.white : Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                value.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingSummaryPage extends StatelessWidget {
  final String serviceProviderName;
  final String date;
  final String time;
  final String location;
  final double subtotal;
  final double serviceFee;
  final double additionalFee;
  final double totalAmount;

  BookingSummaryPage({
    required this.serviceProviderName,
    required this.date,
    required this.time,
    required this.location,
    required this.subtotal,
    required this.serviceFee,
    required this.additionalFee,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Summary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blue.withOpacity(0.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service Provider Details',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      serviceProviderName,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    // Add other service provider details here
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 10.0),
                Text(date),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 10.0),
                Text(time),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 10.0),
                Text(location),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Subtotal',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rate'),
                Text('\$${subtotal.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Service Fee'),
                Text('\$${serviceFee.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Additional Fee'),
                Text('\$${additionalFee.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Total',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'),
                Text(
                  '\$${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add action for the "Review" button
                  },
                  child: Text('Review'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                         builder: (context) => BookingConfirmationPage(
                             serviceProviderName: 'Service Provider Name',
                             serviceName: 'Cleaning',
                             date: 'date',
                             time: 'time',
                             bookingId: 'ghtyf678356',
                             totalAmount: 0.00,
                           ),
                          ),
                        );// Add action for the "Confirm and Book" button
                  },
                  child: Text('Confirm and Book'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BookingConfirmationPage extends StatelessWidget {
  final String bookingId;
  final String serviceName;
  final String serviceProviderName;
  final String date;
  final String time;
  final double totalAmount;

  BookingConfirmationPage({
    required this.bookingId,
    required this.serviceName,
    required this.serviceProviderName,
    required this.date,
    required this.time,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFECEFF1),
              Color(0xFFCFD8DC),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 120,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Booking Confirmed!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Thank you for your booking! Your booking has been confirmed with the following details:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30),
            BookingDetailsCard(
              bookingId: bookingId,
              serviceName: serviceName,
              serviceProviderName: serviceProviderName,
              date: date,
              time: time,
              totalAmount: totalAmount,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                         builder: (context) => HomePage(),
                          ),
                        );// Handle button action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                backgroundColor: Color.fromARGB(255, 0, 69, 104),
              ),
              child: Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingDetailsCard extends StatelessWidget {
  final String bookingId;
  final String serviceName;
  final String serviceProviderName;
  final String date;
  final String time;
  final double totalAmount;

  BookingDetailsCard({
    required this.bookingId,
    required this.serviceName,
    required this.serviceProviderName,
    required this.date,
    required this.time,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            BookingInfoRow(
              label: 'Booking ID',
              value: bookingId,
            ),
            SizedBox(height: 10),
            BookingInfoRow(
              label: 'Service',
              value: serviceName,
            ),
            SizedBox(height: 10),
            BookingInfoRow(
              label: 'Service Provider',
              value: serviceProviderName,
            ),
            SizedBox(height: 10),
            BookingInfoRow(
              label: 'Date',
              value: date,
            ),
            SizedBox(height: 10),
            BookingInfoRow(
              label: 'Time',
              value: time,
            ),
            SizedBox(height: 10),
            BookingInfoRow(
              label: 'Total Amount',
              value: '\$${totalAmount.toStringAsFixed(2)}',
            ),
          ],
        ),
      ),
    );
  }
}

class BookingInfoRow extends StatelessWidget {
  final String label;
  final String value;

  BookingInfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
