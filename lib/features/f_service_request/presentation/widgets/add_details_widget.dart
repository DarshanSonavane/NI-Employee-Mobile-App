import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/widgets/set_text_normal.dart';
import '../provider/total_amount_provider.dart';
import 'add_details_card.dart';

class AddDetailsWidget extends StatefulWidget {
  const AddDetailsWidget({super.key});

  @override
  State<AddDetailsWidget> createState() => _AddDetailsWidgetState();
}

class _AddDetailsWidgetState extends State<AddDetailsWidget> {
  final List<Widget> cards = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void addCard() {
    final cardKey = ValueKey<int>(cards.length);
    debugPrint(cardKey.toString());
    final newCard = AddDetailsCard(
      key: cardKey,
      onDelete: (key) {
        removeCard(key);
      },
      onAmountChanged: (value) {
        return value;
      },
    );

    listKey.currentState?.insertItem(cards.length);
    cards.add(newCard);
  }

  void removeCard(Key key) {
    final index = cards.indexWhere((card) => card.key == key);
    debugPrint(index.toString());
    if (index != -1) {
      Provider.of<TotalAmountProvider>(context, listen: false).removeCard(key);
      final removedCard = cards[index];
      listKey.currentState?.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: FadeTransition(
            opacity: animation,
            child: removedCard,
          ),
        ),
      );
      cards.removeAt(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        AnimatedList(
          key: listKey,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          initialItemCount: cards.length,
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: FadeTransition(
                opacity: animation,
                child: cards[index],
              ),
            );
          },
        ),
        Row(
          spacing: 10,
          children: [
            setTextNormal("Add Details", 1),
            InkWell(
              onTap: addCard,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppPallete.gradientColor,
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: AppPallete.gradientColor,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
