// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatelessWidget {
  final String registerLink =
      "https://55wingo.in/#/register?invitationCode=152181600864";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Steps Header
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StepCircle("1"),
                SizedBox(width: 10),
                LineConnector(),
                SizedBox(width: 10),
                StepCircle("2"),
                SizedBox(width: 10),
                LineConnector(),
                SizedBox(width: 10),
                StepCircle("3"),
              ],
            ),
            const SizedBox(height: 16),
            // Title Text
            const Text(
              "To Start Hack Register With Game Server\nTap To Next Step",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
            const SizedBox(height: 24),
            // Steps Description
            const StepDescription(
                step: "1", description: "Click on 'Register Now'"),
            const StepDescription(
                step: "2",
                description:
                    "You Will Be Redirected To Register Page In Chrome"),
            const StepDescription(
                step: "3", description: "Complete Registration"),
            const StepDescription(
                step: "4", description: "Click on 'Next' Button"),
            const SizedBox(height: 16),
            // Display Local QR Code Image from assets
            Container(
              width: 150,
              height: 150,
              color: Colors.white,
              child: Image.asset(
                'assets/ic_launcher_foreground.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Register Link
            Text(
              "Register Link: $registerLink",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 16),
            // Register Button
            ElevatedButton(
              onPressed: () async {
                if (await canLaunch(registerLink)) {
                  await launch(registerLink);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Could not open the link")),
                  );
                }
              },
              child: const Text("Register Now"),
            ),
            const SizedBox(height: 8),
            // Share Button
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: registerLink));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Link copied to clipboard!")),
                );
              },
              child: const Text("Share Link"),
            ),
          ],
        ),
      ),
    );
  }
}

class StepCircle extends StatelessWidget {
  final String step;

  const StepCircle(this.step, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        step,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class LineConnector extends StatelessWidget {
  const LineConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 2,
      color: Colors.white,
    );
  }
}

class StepDescription extends StatelessWidget {
  final String step;
  final String description;

  const StepDescription(
      {super.key, required this.step, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StepCircle(step),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
