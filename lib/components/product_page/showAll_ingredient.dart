import 'package:flutter/material.dart';
import 'package:frontend/Product.dart';

class showAllIngredients extends StatelessWidget {
  final List<Ingredient> ingredients;
  const showAllIngredients({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    print("ingredients : ${ingredients}");
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        child: (ingredients != null && ingredients.isNotEmpty)
            ? Column(
                mainAxisSize:
                    MainAxisSize.min, // Minimizes height to content size
                children: [
                  ListView.separated(
                    padding: EdgeInsets.zero, // Ensure padding is zero
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ingredients[index].rating == "Good" ||
                                      ingredients[index].rating == "Best"
                                  ? Color(0xffE4FDDA)
                                  : ingredients[index].rating == "Average"
                                      ? Color(0xffE9F2FB)
                                      : ingredients[index].rating == "Bad" ||
                                              ingredients[index].rating ==
                                                  "Worst"
                                          ? Color(0xffFFD4DC)
                                          : Color(0xffD0D0D0),
                            ),
                            child: Center(
                              child: Text(
                                (index + 1).toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                      color:
                                          ingredients[index].rating == "Good" ||
                                                  ingredients[index].rating ==
                                                      "Best"
                                              ? Color(0xff34C759)
                                              : ingredients[index].rating ==
                                                      "Average"
                                                  ? Color(0xff007AFF)
                                                  : ingredients[index].rating ==
                                                              "Bad" ||
                                                          ingredients[index]
                                                                  .rating ==
                                                              "Worst"
                                                      ? Colors.red
                                                      : Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "${ingredients[index].ingredient}",
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                Text(
                                  "${ingredients[index].category}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 10,
                                          color: Color(0xff7E7E7E)),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Divider(
                        height: 0.5,
                      ),
                    ),
                    itemCount: ingredients.length,
                  ),
                ],
              )
            : Center(child: Text("NO INGREDIENT")),
      ),
    );
  }
}
