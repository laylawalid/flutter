import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Article Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ArticleDetails(),
    );
  }
}

class ArticleDetails extends StatefulWidget {
  const ArticleDetails({super.key});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  bool isSaved = false;

  void toggleSaveArticle() {
    setState(() {
      isSaved = !isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeScreen = constraints.maxWidth > 600;

          final double imageHeight = isLargeScreen
              ? constraints.maxHeight * 0.4
              : constraints.maxHeight * 0.25;
          final double fontSizeDate = isLargeScreen ? 18 : 12;
          final double fontSizeTitle = isLargeScreen ? 24 : 16;
          final double fontSizeAuthor = isLargeScreen ? 16 : 12;
          final double fontSizeContent = isLargeScreen ? 18 : 14;

          return SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Article Image
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image at the top
                    Container(
                      width: constraints.maxWidth,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1527519135413-1e146b552e10?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Container placed below the image
                    Container(
                      width: constraints.maxWidth * 0.9,
                      margin: EdgeInsets.only(
                          top: 8), // Optional margin to add some space
                      color: Colors.white.withOpacity(0.8),
                      padding: EdgeInsets.all(isLargeScreen ? 16 : 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2024-02-01T14:13:00Z',
                            style: TextStyle(
                              fontSize: fontSizeDate,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'The U.S. military plans to strike targets in Iraq and Syria, including Iranian personnel and facilities, in response to a drone attack that killed 3 U.S. troops.',
                            style: TextStyle(
                              fontSize: fontSizeTitle,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Tucker Reals, Eleanor Watson, Alex Sundby',
                            style: TextStyle(
                              fontSize: fontSizeAuthor,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(isLargeScreen ? 16 : 8),
                  child: Column(
                    children: [
                      SizedBox(
                          height: isLargeScreen
                              ? 24
                              : 16), // Add extra space before the text
                      Text(
                        'U.S. officials have confirmed to CBS News that plans have been approved for a series of strikes over a number of days against targets — including Iranian personnel and facilities — inside Iraq and Syria...',
                        style: TextStyle(
                          fontSize: fontSizeContent,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                // Save Article Button
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: isLargeScreen ? 16 : 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_border,
                          color: isSaved ? Colors.red : Colors.grey,
                        ),
                        onPressed: toggleSaveArticle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}
