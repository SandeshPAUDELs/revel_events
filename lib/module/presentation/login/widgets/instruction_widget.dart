import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InstructionWidget extends StatelessWidget {
  final List<String> instructions;
  final bool formInstructions;
  const InstructionWidget({
    super.key,
    required this.instructions,
    this.formInstructions = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      contentPadding: EdgeInsets.all(15),
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Instructions',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () => context.pop(context),
                child: Icon(Icons.close)
              ),
            ],
          ),

          Divider(color: Colors.amber),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(instructions.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "${formInstructions ? "" : "${index + 1} ."} ${instructions[index]}",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }),
          ),

        ],
      ),
    );
  }
}
