import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'ExpansionTile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CarShowroomScreen(),
    );
  }
}

class CarShowroomScreen extends StatelessWidget {
  final List<Car> cars = [
    Car(
      model: 'Tesla Model S',
      imageUrl:
          'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=400&h=250&fit=crop',
      price: '\$89,990',
      mileage: '405 miles',
      makerYear: 'Tesla - 2023',
      condition: 'New',
    ),
    Car(
      model: 'BMW X5',
      imageUrl:
          'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=400&h=250&fit=crop',
      price: '\$65,750',
      mileage: '25,000 miles',
      makerYear: 'BMW - 2022',
      condition: 'Used - Excellent',
    ),
    Car(
      model: 'Audi A4',
      imageUrl:
          'https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=400&h=250&fit=crop',
      price: '\$42,500',
      mileage: '15,000 miles',
      makerYear: 'Audi - 2023',
      condition: 'Used - Good',
    ),
  ];

  CarShowroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Listing'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.grey,
        elevation: 2,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey.shade100, Colors.grey.shade200],
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: cars.length,
          itemBuilder: (context, index) {
            return CarCard(car: cars[index]);
          },
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Car Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: Image.network(
                car.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_car,
                          size: 60,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(height: 8),
                        Text(
                          car.model,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // Car Model Name
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              car.model,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
          ),

          // ExpansionTile for Car Details
          ExpansionTile(
            title: Text(
              'View Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade700,
              ),
            ),
            // leading: Icon(Icons.info_outline, color: Colors.blue.shade700),
            // iconColor: Colors.blue.shade700,
            // collapsedIconColor: Colors.blue.shade700,
            childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    _buildDetailRow(Icons.monetization_on, 'Price', car.price),
                    SizedBox(height: 12),
                    _buildDetailRow(Icons.speed, 'Mileage', car.mileage),
                    SizedBox(height: 12),
                    _buildDetailRow(
                      Icons.calendar_today,
                      'Maker & Year',
                      car.makerYear,
                    ),
                    SizedBox(height: 12),
                    _buildDetailRow(Icons.verified, 'Condition', car.condition),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blue.shade600),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}

class Car {
  final String model;
  final String imageUrl;
  final String price;
  final String mileage;
  final String makerYear;
  final String condition;

  Car({
    required this.model,
    required this.imageUrl,
    required this.price,
    required this.mileage,
    required this.makerYear,
    required this.condition,
  });
}
