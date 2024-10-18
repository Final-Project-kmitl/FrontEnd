import 'package:flutter/material.dart';
import 'package:frontend/pages/find_page.dart';
import 'package:frontend/pages/skinTypeQuiz_page.dart';
import 'package:frontend/sections/allergic_section.dart';
import 'package:frontend/sections/skintype_section.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? selectedSkinType;
  String? selectAllergicType;

  int _currentQuestion = 0;
  final int totalQuestion = 2;
  final PageController _pageController = PageController();

  final List<String> _skinTypes = [
    'ผิวแห้ง',
    'ผิวมัน',
    'ผิวผสม',
    'ผิวปกติ',
    "ไม่ทราบ"
  ];
  final List<String> _skinTypeImages = [
    "assets/form/Dry skin.svg",
    "assets/form/Oily skin.svg",
    "assets/form/Combination skin.svg",
    "assets/form/Normal skin.svg",
    "assets/form/Unknown.svg"
  ];
  final List<String> _allergicTypes = ["ไม่มี", "มี"];
  final List<String> _allergicTypesImg = [
    "assets/allergic/Non allergic.svg",
    "assets/allergic/Allergic.svg"
  ];
  bool? _allergic;

  void increaseCurrentPage() {
    if (selectedSkinType == "ไม่ทราบ" && _currentQuestion == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: EdgeInsets.only(top: 16, left: 16, right: 16),
              // actionsPadding: EdgeInsets.only(right: 16, bottom: 16),
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ทำแบบประเมินสภาพผิว?",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close),
                  )
                ],
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              content: Text(
                "คุณสามารถทำภายหลังได้ในแอปพลิเคชัน",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                        Navigator.of(context).pop();
                        setState(() {
                          _currentQuestion++;
                        });
                      },
                      child: Text(
                        "ภายหลัง",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        final result = await Navigator.push<String>(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SkinTypeQuiz()),
                        );

                        if (result != null) {
                          setState(() {
                            selectedSkinType = result;
                            _currentQuestion++;
                          });

                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }
                      },
                      child: Text(
                        "ทำแบบทดสอบ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            );
          });
    } else if (_currentQuestion <= totalQuestion) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      setState(() {
        _currentQuestion++;
      });
    }
  }

  void decreaseCurrentPage() {
    if (_currentQuestion > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      setState(() {
        _currentQuestion--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
                child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentQuestion = index;
                });
                print("INDEX");
                print(index);
                print("_CURRENT");
                print(_currentQuestion);
              },
              children: [
                QuestionSection(
                  skinTypes: _skinTypes,
                  skinTypeImages: _skinTypeImages,
                  selectedSkinType: selectedSkinType,
                  onSelect: (type) {
                    setState(() {
                      selectedSkinType = type;
                    });
                    print(selectedSkinType);
                  },
                ),
                AllergicSection(
                  allergicTypes: _allergicTypes,
                  allergicTypeImages: _allergicTypesImg,
                  selectAllergicType: selectAllergicType,
                  onSelect: (type) {
                    setState(() {
                      selectAllergicType = type;
                      _allergic = type == "มี";
                    });
                  },
                ),
                FindPage()
              ],
            )),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'แบบสอบถาม',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
              ),
              const Spacer(),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: [
                      Text((_currentQuestion + 1).toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w900)),
                      const Text("/",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w900)),
                      Text((totalQuestion + 1).toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w900))
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(10),
            value: (_currentQuestion + 1) / (totalQuestion + 1),
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
          )
        ],
      ),
    );
  }

  Widget _buildSectionContent() {
    if (_currentQuestion == 1) {
      return QuestionSection(
        skinTypes: _skinTypes,
        skinTypeImages: _skinTypeImages,
        selectedSkinType: selectedSkinType,
        onSelect: (type) {
          setState(() {
            selectedSkinType = type;
          });
          print(selectedSkinType);
        },
      );
    } else if (_currentQuestion == 2) {
      return AllergicSection(
        allergicTypes: _allergicTypes,
        allergicTypeImages: _allergicTypesImg,
        selectAllergicType: selectAllergicType,
        onSelect: (type) {
          setState(() {
            selectAllergicType = type;
            _allergic = type == "มี";
          });
        },
      );
    } else {
      return FindPage();
    }
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
          child: _currentQuestion > 0
              ? Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: decreaseCurrentPage,
                        child: Text('ย้อนกลับ',
                            style: Theme.of(context).textTheme.headlineLarge),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: selectAllergicType == null
                            ? null
                            : () {
                                increaseCurrentPage();
                              },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text(
                            _currentQuestion == totalQuestion
                                ? 'เสร็จสิ้น'
                                : 'ต่อไป',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        selectedSkinType == null ? null : increaseCurrentPage,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text('ต่อไป',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: Colors.white)),
                  ),
                ),
        ),
      ],
    );
  }
}
