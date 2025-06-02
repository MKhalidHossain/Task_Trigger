import 'package:flutter/material.dart';
import 'package:iwalker/core/widgets/normal_custom_button.dart';

class PopUpManuWidget extends StatelessWidget {
  const PopUpManuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () => _showPopupMenuFromTopRight(context),
    );
  }

  void _showPopupMenuFromTopRight(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent, // Transparent background
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: 60,
              right: 16,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NormalCustomButton(
                        weight: 100,
                        text: "Edit",
                        showIcon: true,
                        sufixIcon: Icons.edit_outlined,
                        onPressed: () {
                          Navigator.pop(context);
                          // Add your Edit logic here
                        },
                      ),
                      NormalCustomButton(
                        weight: 100,
                        text: "Delete",
                        showIcon: true,
                        sufixIcon: Icons.delete_outlined,
                        onPressed: () {
                          Navigator.pop(context);
                          // Add your Delete logic here
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
