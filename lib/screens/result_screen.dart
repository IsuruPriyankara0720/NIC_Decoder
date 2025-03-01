import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/nic_controller.dart';

// Screen to display the decoded NIC details
class ResultScreen extends StatelessWidget {
  final NICController nicController = Get.put(NICController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'NIC Decoder Result',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade300, Colors.blue.shade300],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() {
              if (nicController.nicModel.value == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Card(
                color: Colors.white.withOpacity(0.9),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display NIC details using infoTile widget
                      infoTile('NIC', nicController.nicModel.value.nic ?? 'N/A'),
                      infoTile('Birth Year',
                          nicController.nicModel.value.birthYear?.toString() ?? 'N/A'),
                      infoTile('Date of Birth',
                          nicController.nicModel.value.dateOfBirth ?? 'N/A'),
                      infoTile('Gender', nicController.nicModel.value.gender ?? 'N/A'),
                      infoTile('Age', nicController.nicModel.value.age?.toString() ?? 'N/A'),
                      infoTile('Weekday', nicController.nicModel.value.weekday ?? 'N/A'),
                      infoTile('Voting Eligibility',
                          nicController.nicModel.value.votingEligibility ?? 'N/A'),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  // Widget to display a title-value pair
  Widget infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.label, color: Colors.deepPurpleAccent),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              '$title: $value',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}