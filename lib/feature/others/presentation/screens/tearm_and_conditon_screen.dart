import 'package:flutter/material.dart';
import 'package:iwalker/core/themes/text_extensions.dart';

class TearmAndConditonScreen extends StatelessWidget {
  const TearmAndConditonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xff438B92),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: 'Term & Condition'.text20Black(),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis risus eget magna euismod rhoncus. Vivamus eu lectus a lectus interdum placerat. Praesent consectetur ante orci, non mattis massa posuere in. Integer blandit ut mi eu efficitur. Praesent congue, arcu vitae malesuada vehicula, lacus velit facilisis velit, ut vehicula sapien erat id dui. Proin nisi ante, ullamcorper vitae libero eu, mollis venenatis lectus. Integer auctor et sem at sollicitudin. Sed eget diam nisi. Nulla in id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis risus eget magna euismod rhoncus. Vivamus eu lectus a lectus interdum placerat. Praesent consectetur ante orci, non mattis massa posuere in. Integer blandit ut mi eu efficitur. Praesent congue, arcu vitae malesuada vehicula, lacus velit facilisis velit, ut vehicula sapien erat id dui. Proin nisi ante, ullamcorper vitae libero eu, mollis venenatis lectus. Integer auctor et sem at sollicitudin. Sed eget diam nisi. Nulla in id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis risus eget magna euismod rhoncus. Vivamus eu lectus a lectus interdum placerat. Praesent consectetur ante orci, non mattis massa posuere in. Integer blandit ut mi eu efficitur. Praesent congue, arcu vitae malesuada vehicula, lacus velit facilisis velit, ut vehicula sapien erat id dui. Proin nisi ante, ullamcorper vitae libero eu, mollis venenatis lectus. Integer auctor et sem at sollicitudin. Sed eget diam nisi. Nulla in id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis risus eget magna euismod rhoncus. Vivamus eu lectus a lectus interdum placerat. Praesent consectetur ante orci, non mattis massa posuere in. Integer blandit ut mi eu efficitur. Praesent congue, arcu vitae malesuada vehicula, lacus velit facilisis velit, ut vehicula sapien erat id dui. Proin nisi ante, ullamcorper vitae libero eu, mollis venenatis lectus. Integer auctor et sem at sollicitudin. Sed eget diam nisi. Nulla in id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis risus eget magna euismod rhoncus. Vivamus eu lectus a lectus interdum placerat. Praesent consectetur ante orci, non mattis massa posuere in. Integer blandit ut mi eu efficitur. Praesent congue, arcu vitae malesuada vehicula, lacus velit facilisis velit, ut vehicula sapien erat id dui. Proin nisi ante, ullamcorper vitae libero eu, mollis venenatis lectus. Integer auctor et sem at sollicitudin. Sed eget diam nisi. Nulla in id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis risus eget magna euismod rhoncus. Vivamus eu lectus a lectus interdum placerat. Praesent consectetur ante orci, non mattis massa posuere in. Integer blandit ut mi eu efficitur. Praesent congue, arcu vitae malesuada vehicula, lacus velit facilisis velit, ut vehicula sapien erat id dui. Proin nisi ante, ullamcorper vitae libero eu, mollis venenatis lectus. Integer auctor et sem at sollicitudin. Sed eget diam nisi. Nulla in id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis risus eget magna euismod rhoncus. Vivamus eu lectus a lectus interdum placerat. Praesent consectetur ante orci, non mattis massa posuere in. Integer blandit ut mi eu efficitur. Praesent congue, arcu vitae malesuada vehicula, lacus velit facilisis velit, ut vehicula sapien erat id dui. Proin nisi ante, ullamcorper vitae libero eu, mollis venenatis lectus. Integer auctor et sem at sollicitudin. Sed eget diam nisi. Nulla in id."
                      .text14Black(),
            ),
          ),
        ),
      ),
    );
  }
}
