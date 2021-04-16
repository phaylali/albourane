import 'package:admin/auth.dart';
import 'package:admin/home.dart';
import 'package:admin/login.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Root extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("هناك خطأ ما في قاعدة البيانات"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return AuthChecker();
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class AuthChecker extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authState = watch(authStateProvider);
    return _authState.when(
      data: (value) {
        if (value != null) {
          return HomePage();
        }
        return AdminSignIn();
      },
      loading: () {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (_, __) {
        return Scaffold(
          body: Center(
            child: Text("هناك خطأ ما في التوثيق"),
          ),
        );
      },
    );
  }
}

class GotToHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _auth = watch(authServicesProvider);
    return FutureBuilder(
      future: _auth.signout(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something Went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return AdminSignIn();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class ConnectionIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Center(
        child: ConnectivityBuilder(
          builder: (context, isConnected, status) => Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (isConnected == true)
                Icon(
                  Icons.signal_wifi_4_bar,
                  color: Colors.green[400],
                ),
              if (isConnected == false)
                Icon(
                  Icons.signal_wifi_off,
                  color: Colors.red[400],
                ),
              if (isConnected == null)
                Icon(
                  Icons.signal_wifi_off,
                  color: Colors.grey[400],
                ),
              const SizedBox(width: 10),
              if (status == ConnectivityStatus.none)
                Text(
                  "غير متصل بالأنترنت",
                  style: TextStyle(color: Colors.red[400]),
                ),
              if (status == ConnectivityStatus.unknown)
                Text(
                  "متصل بالأنترنت",
                  style: TextStyle(color: Colors.green[400]),
                ),
              if (status == ConnectivityStatus.wifi)
                Text(
                  "WIFI متصل بالأنترنت",
                  style: TextStyle(color: Colors.green[400]),
                ),
              if (status == ConnectivityStatus.ethernet)
                Text(
                  "ETHERNET متصل بالأنترنت",
                  style: TextStyle(color: Colors.green[400]),
                ),
              if (status == ConnectivityStatus.mobile)
                Text(
                  "3G/4G/5G متصل بالأنترنت",
                  style: TextStyle(color: Colors.green[400]),
                ),
              if (status == null)
                Text(
                  "غير معروف",
                  style: TextStyle(color: Colors.grey[400]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
