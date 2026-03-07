import 'package:flutter/material.dart';

class ImageScalePage extends StatelessWidget {
  const ImageScalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          panEnabled: true, // Set to false to prevent panning.
          minScale: 0.5,
          maxScale: 4.0,
          child: Image.asset(
            'assets/image.png',
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.broken_image,
                size: 100,
                color: Colors.grey,
              );
            },
          ),
        ),
      ),
    );
  }
}
