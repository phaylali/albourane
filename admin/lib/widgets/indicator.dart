import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';

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
              if (status == null)
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
