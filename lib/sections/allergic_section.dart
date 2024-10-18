import 'package:flutter/material.dart';
import 'package:frontend/components/card_components.dart';

class AllergicSection extends StatefulWidget {
  final List<String> allergicTypes;
  final List<String> allergicTypeImages;
  final String? selectAllergicType;
  final Function(String) onSelect;

  const AllergicSection({
    Key? key,
    required this.allergicTypes,
    required this.allergicTypeImages,
    required this.selectAllergicType,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<AllergicSection> createState() => _AllergicSectionState();
}

class _AllergicSectionState extends State<AllergicSection> {
  List<String> listItem = <String>[
    "Apple",
    "Banana",
    "Canada",
    "Dog",
    "hoohre",
    "pattsfde",
    "kom,ll,zzzz",
    "AAagkpr",
    "ghmomaaa",
    "jotymyoaa"
  ];
  List<String> selectedItem = [];
  List<String> availableItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    availableItems = List.from(listItem);
    availableItems.sort();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'คุณมีสาร/ส่วนผสมที่แพ้หรือไม่??',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        // ใช้ Flexible เพื่อให้ GridView ขยายตามเนื้อที่
        Flexible(
          child: LayoutBuilder(builder: (context, constraints) {
            double itemWidth = 60;
            double itemHeight = 170;
            double aspectRatio = itemHeight / itemWidth;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: aspectRatio,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      CardComponent(
                          title: widget.allergicTypes[0],
                          imagePath: widget.allergicTypeImages[0],
                          isSelected: widget.selectAllergicType ==
                              widget.allergicTypes[0],
                          onSelect: (type) {
                            widget.onSelect(type);
                          }),
                      CardComponent(
                          title: widget.allergicTypes[1],
                          imagePath: widget.allergicTypeImages[1],
                          isSelected: widget.selectAllergicType ==
                              widget.allergicTypes[1],
                          onSelect: (type) {
                            widget.onSelect(type);
                          })
                    ],
                  ),
                  SizedBox(
                    height: selectedItem.length == 0 ? 0 : 24,
                  ),
                  Container(
                      width: double.infinity,
                      child: widget.selectAllergicType == "มี"
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              child: Row(
                                children: selectedItem.map((item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Chip(
                                      side: BorderSide(
                                          color:
                                              selectedItem.indexOf(item) % 2 ==
                                                      0
                                                  ? Colors.black
                                                  : Color(0xffD0D0D0)),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      labelPadding:
                                          EdgeInsets.only(left: 12, right: 8),
                                      label: Row(
                                        mainAxisSize: MainAxisSize
                                            .min, // Min size to fit content
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Center the contents horizontally
                                        children: [
                                          Text(
                                            item,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: selectedItem.indexOf(
                                                                  item) %
                                                              2 ==
                                                          0
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                          ),
                                        ],
                                      ),
                                      deleteIcon: Icon(Icons.close,
                                          size: 20,
                                          color:
                                              selectedItem.indexOf(item) % 2 ==
                                                      0
                                                  ? Colors.white
                                                  : Colors.black),
                                      onDeleted: () {
                                        setState(() {
                                          selectedItem.remove(item);
                                          availableItems.add(item);
                                          availableItems.sort();
                                        });
                                      },
                                      backgroundColor:
                                          selectedItem.indexOf(item) % 2 == 0
                                              ? Colors.black
                                              : Colors.white,
                                    ),
                                  );
                                }).toList(),
                              ),
                            )
                          : SizedBox(
                              height: 0,
                            )),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                      child: widget.selectAllergicType == "มี"
                          ? Autocomplete(
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return Iterable<String>.empty();
                                }
                                return availableItems.where((String item) {
                                  return item.toLowerCase().contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              onSelected: (option) {
                                setState(() {
                                  selectedItem.add(option);
                                  availableItems.remove(option);
                                });
                                _textEditingController.clear();
                              },
                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                return Container(
                                  color: Colors.transparent,
                                  padding: EdgeInsets.only(right: 36, top: 8),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Material(
                                      color: Colors.transparent,
                                      // elevation: 4,
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight: 230,
                                        ),
                                        child: Scrollbar(
                                          thumbVisibility: true,
                                          thickness: 4,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1,
                                                    color: Color(0xffD0D0D0)),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: ListView.builder(
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              itemCount: options.length,
                                              itemBuilder: (context, index) {
                                                final String option =
                                                    options.elementAt(index);
                                                return ListTile(
                                                  title: Text(
                                                    option,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium,
                                                  ),
                                                  onTap: () {
                                                    onSelected(option);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              fieldViewBuilder: (context, textEditingController,
                                  focusNode, onFieldSubmitted) {
                                _textEditingController = textEditingController;
                                return TextField(
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    hintText: "ใส่สารที่แพ้",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Color(0xffD0D0D0)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Color(0xffE1D7CE), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Color(0xffE1D7CE), width: 3),
                                    ),
                                  ),
                                  focusNode: focusNode,
                                  onSubmitted: (String value) {
                                    onFieldSubmitted();
                                  },
                                );
                              },
                            )
                          : SizedBox(
                              height: 0,
                            )),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
