// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class RegisterScreen extends StatelessWidget {
  final String registerLink =
      "https://55wingo.in/#/register?invitationCode=152181600864";

  const RegisterScreen({super.key});

  Future<void> _launchURL(BuildContext context) async {
    try {
      final Uri url = Uri.parse(registerLink);
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ),
      )) {
        throw Exception('Could not launch $registerLink');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error opening link: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
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
            const Text(
              "To Start Hack Register With Game Server\nTap To Next Step",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
            const SizedBox(height: 24),
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
            Text(
              "Register Link: $registerLink",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _launchURL(context),
              child: const Text("Register Now"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Share.share(registerLink);
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
