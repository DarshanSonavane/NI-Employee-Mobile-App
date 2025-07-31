import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:flutter/material.dart';

class SearchableDropdown<T> extends StatefulWidget {
  final T? value;
  final String hintText;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final Color borderColor;
  final double borderRadius;
  final Color iconColor;
  final Color textColor;
  final Color dropdownColor;
  final bool isEnabled;

  const SearchableDropdown({
    super.key,
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.borderColor = AppPallete.label2Color,
    this.borderRadius = 14.0,
    this.iconColor = AppPallete.deepNavy,
    this.textColor = AppPallete.label3Color,
    this.dropdownColor = AppPallete.backgroundClosed,
    this.isEnabled = true,
  });

  @override
  State<SearchableDropdown<T>> createState() => _SearchableDropdownState<T>();
}

class _SearchableDropdownState<T> extends State<SearchableDropdown<T>> {
  late List<DropdownMenuItem<T>> filteredItems;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  void _openSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        List<DropdownMenuItem<T>> filteredItems = widget.items;
        String searchText = '';

        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: widget.dropdownColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 400,
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(
                        color: AppPallete
                            .label3Color, // 👈 Set your desired search input text color here
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle:
                            const TextStyle(color: AppPallete.label3Color),
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: AppPallete.backgroundColor,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: AppPallete.label2Color),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: AppPallete.gradientColor),
                        ),
                      ),
                      onChanged: (value) {
                        searchText = value.toLowerCase();
                        setState(() {
                          filteredItems = widget.items.where((item) {
                            final child = item.child;
                            if (child is Text) {
                              return child.data!
                                  .toLowerCase()
                                  .contains(searchText);
                            } else if (child is CustomGlolbalText) {
                              return child.text
                                  .toLowerCase()
                                  .contains(searchText);
                            }
                            return false;
                          }).toList();
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: filteredItems.isEmpty
                          ? const Center(child: Text("No matching items"))
                          : ListView.separated(
                              itemCount: filteredItems.length,
                              separatorBuilder: (_, __) =>
                                  const Divider(height: 1),
                              itemBuilder: (_, index) {
                                final item = filteredItems[index];
                                return ListTile(
                                  title: item.child,
                                  onTap: () {
                                    widget.onChanged(item.value);
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedItem = widget.items.firstWhere(
      (item) => item.value == widget.value,
      orElse: () => DropdownMenuItem<T>(
        value: null,
        child: Text(
          widget.hintText,
          style: TextStyle(
            color: widget.isEnabled ? widget.textColor : AppPallete.label3Color,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: widget.isEnabled ? () => _openSearchDialog(context) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: AppPallete.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color:
                widget.isEnabled ? widget.borderColor : AppPallete.label3Color,
          ),
        ),
        child: Row(
          children: [
            Expanded(child: selectedItem.child),
            Icon(
              Icons.arrow_drop_down,
              color:
                  widget.isEnabled ? widget.iconColor : AppPallete.label3Color,
            ),
          ],
        ),
      ),
    );
  }
}
