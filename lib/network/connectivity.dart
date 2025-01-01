import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkAwareWidget extends StatefulWidget {
  final Widget child;

  const NetworkAwareWidget({Key? key, required this.child}) : super(key: key);

  @override
  _NetworkAwareWidgetState createState() => _NetworkAwareWidgetState();
}

class _NetworkAwareWidgetState extends State<NetworkAwareWidget> {
  bool isOffline = false;
  late Timer _timer; 

  @override
  void initState() {
    super.initState();
    _checkConnectivity();

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _checkConnectivity(); 
    });

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _checkConnectivity();
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  Future<void> _checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    bool isConnected = result != ConnectivityResult.none;

    // Only update state if there is a change (prevent unnecessary rebuilds)
    if (isOffline != !isConnected) {
      setState(() {
        isOffline = !isConnected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isOffline
        ? _buildNoInternetScreen() // Show full-screen no-internet message
        : widget.child;           // Show actual screen if online
  }

  Widget _buildNoInternetScreen() {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade600],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Text(
              'Oops!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'No Internet Connection.\nPlease check your internet settings.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _checkConnectivity(); // Check internet connection again
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Try Again',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
