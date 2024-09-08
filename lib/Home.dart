import 'package:flutter/material.dart';
import 'package:medicalapp/Dental_Category.dart';
import 'package:medicalapp/Profile_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    NotificationsScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// HomeScreen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dev Medical Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.mail_outline),
            onPressed: () {
              // Handle mail icon press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section with user info
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                          radius: 28),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Devendra Parmar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Welcome to Dev Medical Store',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 25),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          'Search Medicine & Healthcare products',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Top Categories
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Top Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryItem('Dental', Colors.pink),
                  CategoryItem('Wellness', Colors.green),
                  CategoryItem('Homeo', Colors.orange),
                  CategoryItem('Eye care', Colors.blue),
                  CategoryItem('Hair Care', Colors.purple),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Promo Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/poster.png',
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 150,
                      padding: EdgeInsets.all(16),
                      color: Colors.black.withOpacity(0.1),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Save extra on every order\nEtiam mollis metus non faucibus.',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Deals of the Day
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Deals of the Day',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'More',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15),
              children: List.generate(16, (index) => ProductItem()),
            ),
          ],
        ),
      ),
    );
  }
}

// Category of the Home Screen
class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dental_Category(categoryName: title),
          ),
        );
      },
      child: Container(
        width: 70,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// Product Items of the Home Screen
class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset('assets/images/product.png'),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Accu-check Active\nTest Strip'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rs.112',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text('2'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ProfileScreen
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Profile();
  }
}

// NotificationsScreen
class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationsScreen> {
  List<Map<String, String>> notifications = [
    {
      'title':
          'We know that—for children AND adults—learning is most effective when it is',
      'date': 'Sep 09, 2024 at 11:08 AM',
      'icon': 'alarm',
    },
    {
      'title':
          'The future of professional learning is immersive, communal experiences for',
      'date': 'Aug 20, 2024 at 11:08 PM',
      'icon': 'event',
    },
    {
      'title':
          'With this in mind, Global Online Academy created the Blended Learning Design',
      'date': 'Aug 12, 2024 at 05:08 PM',
      'icon': 'notifications',
    },
    {
      'title':
          'Technology should serve, not drive, pedagogy. Schools often discuss',
      'date': 'Aug 24, 2024 at 12:30 PM',
      'icon': 'notifications_none',
    },
    {
      'title':
          'Peer learning works. By building robust personal learning communities both',
      'date': 'Aug 02, 2024 at 06:08 PM',
      'icon': 'notifications_none',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                notifications.clear(); // Clear all notifications
              });
            },
            child: Text(
              'Clear all',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                'No notifications',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return _buildNotificationItem(notifications[index]);
              },
            ),
    );
  }

  // Build each notification item
  Widget _buildNotificationItem(Map<String, String> notification) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: _buildLeadingIcon(notification['icon']),
        title: Text(
          notification['title']!,
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          notification['date']!,
          style: TextStyle(color: Colors.grey),
        ),
        trailing:
            Icon(Icons.circle, color: Colors.red, size: 8), // Indicator dot
      ),
    );
  }

  // Build the leading icon based on type
  Widget _buildLeadingIcon(String? iconType) {
    switch (iconType) {
      case 'alarm':
        return Icon(Icons.alarm, color: Colors.blue);
      case 'event':
        return Icon(Icons.event, color: Colors.blue);
      default:
        return Icon(Icons.notifications_none, color: Colors.blue);
    }
  }
}

// CartScreen
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int itemCount1 = 1;
  int itemCount2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),
        title: Text('Your cart', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Items in the cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2 Items in your cart', style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () {
                    // Handle add more items
                  },
                  child: Text(
                    '+ Add more',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildCartItem(
              context,
              'assets/images/item1.png',
              'Sugar free gold',
              'bottle of 500 pellets',
              25.00,
              itemCount1,
              (count) {
                setState(() {
                  itemCount1 = count;
                });
              },
            ),
            SizedBox(height: 16),
            _buildCartItem(
              context,
              'assets/images/item2.png',
              'Sugar free gold',
              'bottle of 500 pellets',
              18.00,
              itemCount2,
              (count) {
                setState(() {
                  itemCount2 = count;
                });
              },
            ),
            SizedBox(height: 30),
            // Payment Summary
            Text(
              'Payment Summary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildPaymentSummary('Order Total', 228.80),
            _buildPaymentSummary('Items Discount', -28.80),
            _buildPaymentSummary('Coupon Discount', -15.80),
            _buildPaymentSummary('Shipping', 0.00, isFree: true),
            Divider(thickness: 1),
            _buildPaymentSummary('Total', 185.00, isTotal: true),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle place order
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                ),
                child: Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget to build cart items
  Widget _buildCartItem(
      BuildContext context,
      String imagePath,
      String title,
      String subtitle,
      double price,
      int itemCount,
      Function(int) onItemCountChanged) {
    return Row(
      children: [
        Image.asset(imagePath, width: 50, height: 50),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              SizedBox(height: 8),
              Text('Rs.${price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(width: 10),
        _buildQuantityChanger(itemCount, onItemCountChanged),
      ],
    );
  }

  // Widget to build quantity changer
  Widget _buildQuantityChanger(
      int itemCount, Function(int) onItemCountChanged) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (itemCount > 1) {
              onItemCountChanged(itemCount - 1);
            }
          },
          icon: Icon(Icons.remove_circle_outline, color: Colors.blue),
        ),
        Text(
          '$itemCount',
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          onPressed: () {
            onItemCountChanged(itemCount + 1);
          },
          icon: Icon(Icons.add_circle_outline, color: Colors.blue),
        ),
      ],
    );
  }

  // Widget to build payment summary rows
  Widget _buildPaymentSummary(String title, double value,
      {bool isFree = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            isFree ? 'Free' : 'Rs.${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
