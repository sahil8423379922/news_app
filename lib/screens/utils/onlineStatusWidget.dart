import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class OnlineStatusWidget extends StatelessWidget {
  const OnlineStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        final results = snapshot.data ?? [];
        final connected = results.any(
          (result) => result != ConnectivityResult.none,
        );

        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Row(
            children: [
              Icon(
                connected ? Icons.cloud_done : Icons.cloud_off,
                size: 16,
                color: connected ? Colors.green : Colors.brown,
              ),
              const SizedBox(width: 4),
              Text(
                connected ? 'Online' : 'Offline',
                style: TextStyle(
                  color: connected ? Colors.green : Colors.brown,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
