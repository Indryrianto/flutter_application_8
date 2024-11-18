import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'font_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer2<ThemeProvider, FontProvider>(
        builder: (context, themeProvider, fontProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Title Section
                  Text(
                    'Customize Your Experience',
                    style: fontProvider.currentFont.copyWith(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Theme Options
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select a Theme',
                            style: fontProvider.currentFont.copyWith(fontSize: 20),
                          ),
                          const Divider(),
                          DropdownButton<int>(
                            value: themeProvider.selectedThemeIndex,
                            onChanged: (value) {
                              themeProvider.changeTheme(value!);
                            },
                            items: [
                              DropdownMenuItem<int>(
                                value: 0,
                                child: Text(
                                  'Theme A',
                                  style: fontProvider.currentFont,
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 1,
                                child: Text(
                                  'Theme B',
                                  style: fontProvider.currentFont,
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 2,
                                child: Text(
                                  'Theme C',
                                  style: fontProvider.currentFont,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Font Options
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select a Font',
                            style: fontProvider.currentFont.copyWith(fontSize: 20),
                          ),
                          const Divider(),
                          DropdownButton<int>(
                            value: fontProvider.selectedFontIndex,
                            onChanged: (value) {
                              fontProvider.changeFont(value!);
                            },
                            items: [
                              DropdownMenuItem<int>(
                                value: 0,
                                child: Text(
                                  'Roboto',
                                  style: fontProvider.currentFont,
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 1,
                                child: Text(
                                  'Poppins',
                                  style: fontProvider.currentFont,
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 2,
                                child: Text(
                                  'Lora',
                                  style: fontProvider.currentFont,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
