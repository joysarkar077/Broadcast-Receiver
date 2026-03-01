import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BroadcastReceiverPage extends StatefulWidget {
  const BroadcastReceiverPage({super.key});

  @override
  State<BroadcastReceiverPage> createState() => _BroadcastReceiverPageState();
}

class _BroadcastReceiverPageState extends State<BroadcastReceiverPage> {
  String _selectedOption = 'Custom broadcast receiver';
  final List<String> _options = [
    'Custom broadcast receiver',
    'System battery notification receiver',
  ];

  void _proceedToNext() {
    if (_selectedOption == 'Custom broadcast receiver') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CustomBroadcastInputPage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BatteryReceiverPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selection Activity')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select broadcast operation:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedOption,
              isExpanded: true,
              items: _options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue!;
                });
              },
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _proceedToNext,
                child: const Text('Proceed to Next Activity'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Option 1: First Activity -> Second Activity (Input)
class CustomBroadcastInputPage extends StatefulWidget {
  const CustomBroadcastInputPage({super.key});

  @override
  State<CustomBroadcastInputPage> createState() =>
      _CustomBroadcastInputPageState();
}

class _CustomBroadcastInputPageState extends State<CustomBroadcastInputPage> {
  final TextEditingController _controller = TextEditingController();

  void _sendBroadcast() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CustomBroadcastReceiverPage(message: _controller.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Activity')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter plain text to broadcast',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendBroadcast,
              child: const Text('Send to Receiver Activity'),
            ),
          ],
        ),
      ),
    );
  }
}

// Option 1: First Activity -> Second Activity -> Third Activity (Receiver)
class CustomBroadcastReceiverPage extends StatelessWidget {
  final String message;
  const CustomBroadcastReceiverPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receiver Activity')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.podcasts, size: 64, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Broadcast Received:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              message.isEmpty ? '(Empty message)' : message,
              style: const TextStyle(fontSize: 24, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Option 2: First Activity -> Second Activity (Battery Receiver)
class BatteryReceiverPage extends StatefulWidget {
  const BatteryReceiverPage({super.key});

  @override
  State<BatteryReceiverPage> createState() => _BatteryReceiverPageState();
}

class _BatteryReceiverPageState extends State<BatteryReceiverPage> {
  final Battery _battery = Battery();
  int _batteryLevel = 0;
  BatteryState _batteryState = BatteryState.unknown;

  @override
  void initState() {
    super.initState();
    _initBatteryState();
  }

  Future<void> _initBatteryState() async {
    final level = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = level;
    });

    _battery.onBatteryStateChanged.listen((BatteryState state) {
      if (mounted) {
        setState(() {
          _batteryState = state;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Battery Receiver')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.battery_charging_full,
              size: 64,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            Text(
              'Battery Level: $_batteryLevel%',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'State: ${_batteryState.name}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
