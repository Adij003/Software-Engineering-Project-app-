import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ResourceHomePage extends StatefulWidget {
  const ResourceHomePage({super.key});

  @override
  _ResourceHomePageState createState() => _ResourceHomePageState();
}

class _ResourceHomePageState extends State<ResourceHomePage> {
  List<String> books = ['Descriptive_statistics.pdf',
    'SQL_Practice_Problems.pdf',];

  List <String> notes = [
    'Number_Theory.pdf',
    'Numerical_Diff.pdf',
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Library'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookListPage(books),
                  ),
                );
              },
              icon: const Icon(Icons.book),
              label: const Text('Important Books'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteListPage(notes),
                  ),
                );
              },
              icon: const Icon(Icons.book),
              label: const Text('Notes'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookListPage extends StatelessWidget {
  final List<String> books;

  const BookListPage(this.books, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.book),
            title: Text(books[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewerPage(
                    key: UniqueKey(),
                    assetPath: 'assets/pdfs/${books[index]}',
                    bookName: books[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NoteListPage extends StatelessWidget {
  final List<String> notes;

  const NoteListPage(this.notes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes List'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.book),
            title: Text(notes[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewerPage(
                    key: UniqueKey(),
                    assetPath: 'assets/pdfs/${notes[index]}',
                    bookName: notes[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class PdfViewerPage extends StatefulWidget {
  final String assetPath;
  final String bookName;
  const PdfViewerPage({required Key key, required this.assetPath, required this.bookName}) : super(key: key);

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookName),
      ),
      body: Center(
        child: SfPdfViewer.asset(
          widget.assetPath,
          canShowScrollHead: false,
        ),
      ),
    );
  }
}
