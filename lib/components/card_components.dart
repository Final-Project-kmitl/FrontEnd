import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final Function(String) onSelect;

  const CardComponent({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(title); // Call the onSelect function to handle the selection
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Animation duration
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: isSelected
                ? Colors.black
                : Color(0xffD0D0D0), // Animated border color
          ),
        ),
        height: 60,
        child: Row(
          children: [
            // AnimatedSwitcher(
            //   duration: Duration(milliseconds: 300),
            //   transitionBuilder: (child, animation) {
            //     return ScaleTransition(scale: animation, child: child);
            //   },
            //   child:
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              key:
                  ValueKey<bool>(isSelected), // Unique key for AnimatedSwitcher
            ),
            // ),
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Spacer(),
            Container(
                width: 36,
                height: 36,
                child: SvgPicture.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ))
          ],
        ),
      ),
    );
  }
}
