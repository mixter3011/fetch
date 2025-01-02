import 'package:fetch/constants/colors.dart';
import 'package:fetch/widgets/search_section.dart';
import 'package:fetch/widgets/side_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          kIsWeb ? const SideBar() : const SizedBox(),
          Expanded(
            child: Padding(
              padding: !kIsWeb ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
              child: Column(
                children: [
                  const Expanded(
                    child: SearchSection(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: const Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Pro",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.footerGray,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Enterprise",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.footerGray,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Store",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.footerGray,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Blog",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.footerGray,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Careers",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.footerGray,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "English (English)",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.footerGray,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
