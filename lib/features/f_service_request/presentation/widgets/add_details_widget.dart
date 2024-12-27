import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/quantity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/common/widgets/set_text_normal.dart';
import '../../../../core/constants/constants.dart';
import '../provider/total_amount_provider.dart';
import 'add_details_card.dart';

class AddDetailsWidget extends StatefulWidget {
  const AddDetailsWidget({super.key});

  @override
  State<AddDetailsWidget> createState() => _AddDetailsWidgetState();
}

class _AddDetailsWidgetState extends State<AddDetailsWidget> {
  final List<(Widget, Key)> cardEntries = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final uuid = const Uuid();

  void addCard() {
    final cardId = uuid.v4();
    final cardKey = ValueKey<String>(cardId);

    final newCard = ChangeNotifierProvider(
      create: (_) => QuantityProvider(),
      child: AddDetailsCard(
        key: cardKey,
        cardKey: cardKey,
        isLastCard: true,
        onDelete: (Key key) => removeCard(key),
      ),
    );

    if (cardEntries.isNotEmpty) {
      final lastCard = cardEntries.last;
      cardEntries[cardEntries.length - 1] = (
        ChangeNotifierProvider(
          create: (_) => QuantityProvider(),
          child: AddDetailsCard(
            key: lastCard.$2,
            cardKey: lastCard.$2,
            isLastCard: false,
            onDelete: (Key key) => removeCard(key),
          ),
        ),
        lastCard.$2
      );
    }
    cardEntries.add((newCard, cardKey));
    listKey.currentState?.insertItem(cardEntries.length - 1);
  }

  void removeCard(Key key) {
    final index = cardEntries.indexWhere((entry) => entry.$2 == key);
    if (index != -1) {
      final removedEntry = cardEntries[index];
      cardEntries.removeAt(index);
      Provider.of<TotalAmountProvider>(context, listen: false).removeCard(key);
      listKey.currentState?.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: FadeTransition(
            opacity: animation,
            child: removedEntry.$1,
          ),
        ),
      );

      if (cardEntries.isNotEmpty) {
        final lastIndex = cardEntries.length - 1;
        final lastCard = cardEntries[lastIndex];
        cardEntries[lastIndex] = (
          ChangeNotifierProvider(
            create: (_) => QuantityProvider(),
            child: AddDetailsCard(
              key: lastCard.$2,
              cardKey: lastCard.$2,
              isLastCard: true,
              onDelete: (Key key) => removeCard(key),
            ),
          ),
          lastCard.$2
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedList(
          key: listKey,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          initialItemCount: cardEntries.length,
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: FadeTransition(
                opacity: animation,
                child: cardEntries[index].$1,
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: setTextNormal(Constants.addDetails, 1),
            ),
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
