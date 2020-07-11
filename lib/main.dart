import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/animation_widget/animated_builder_widget.dart';
import 'package:flutter_samples/animation_widget/animated_container_widget.dart';
import 'package:flutter_samples/animation_widget/animated_switcher_widget.dart';
import 'package:flutter_samples/animation_widget/animated_widget.dart';
import 'package:flutter_samples/animation_widget/fade_transition_widget.dart';
import 'package:flutter_samples/async/future_builder_widget.dart';
import 'package:flutter_samples/async/stream_builder_widget.dart';
import 'package:flutter_samples/basic_widget/image_widget.dart';
import 'package:flutter_samples/basic_widget/media_query_widget.dart';
import 'package:flutter_samples/basic_widget/text_widget.dart';
import 'package:flutter_samples/camera/camera.dart';
import 'package:flutter_samples/camera/firebase_barcode.dart';
import 'package:flutter_samples/camera/firebase_face.dart';
import 'package:flutter_samples/camera/firebase_image_label.dart';
import 'package:flutter_samples/camera/firebase_text.dart';
import 'package:flutter_samples/controller/scroll_controller.dart';
import 'package:flutter_samples/input_widget/form_widget.dart';
import 'package:flutter_samples/interaction_model_widget/absorb_pointer_widget.dart';
import 'package:flutter_samples/interaction_model_widget/dismissable_widget.dart';
import 'package:flutter_samples/interaction_model_widget/draggable_widget.dart';
import 'package:flutter_samples/interaction_model_widget/ink_well_widget.dart';
import 'package:flutter_samples/interaction_model_widget/reorderable_list_view_widget.dart';
import 'package:flutter_samples/multi_child_layout_widget/column_row_widget.dart';
import 'package:flutter_samples/multi_child_layout_widget/indexed_stack_widget.dart';
import 'package:flutter_samples/multi_child_layout_widget/stack_widget.dart';
import 'package:flutter_samples/multi_child_layout_widget/table_widget.dart';
import 'package:flutter_samples/other/safe_area_widget.dart';
import 'package:flutter_samples/other/semantics_widget.dart';
import 'package:flutter_samples/other/value_listenable_builder_widget.dart';
import 'package:flutter_samples/painting_effects_widget/effects_widget.dart';
import 'package:flutter_samples/scrolling_widget/grid_view_widget.dart';
import 'package:flutter_samples/scrolling_widget/nested_scroll_view_widget.dart';
import 'package:flutter_samples/scrolling_widget/page_view_widget.dart';
import 'package:flutter_samples/scrolling_widget/scroll_view_widget.dart';
import 'package:flutter_samples/single_child_layout_widget/container_widget.dart';
import 'package:tuple/tuple.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: ${e.code}\nError Message: ${e.description}');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Samples List'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final items = <Tuple2>[
    Tuple2('Basic widgets', <Tuple2>[
      Tuple2('Text/RichText', (_) => TextWidgetSample()),
      Tuple2('Image/Icon', (_) => ImageWidgetSample()),
      Tuple2('MediaQuery', (_) => MediaQuerySample()),
    ]),
    Tuple2('Single-child layout widgets', <Tuple2>[
      Tuple2('Container', (_) => ContainerSample()),
    ]),
    Tuple2('Multi-child layout widgets', <Tuple2>[
      Tuple2('Column/Row', (_) => ColumnRowSample()),
      Tuple2('Stack', (_) => StackSample()),
      Tuple2('Table', (_) => TableSample()),
      Tuple2('IndexedStack', (_) => IndexedStackSample()),
    ]),
    Tuple2('Painting and effects', <Tuple2>[
      Tuple2('Effects', (_) => EffectsSample()),
    ]),
    Tuple2('Scrolling', <Tuple2>[
      Tuple2('GridView', (_) => GridViewSample()),
      Tuple2('ScrollView', (_) => ScrollViewSample()),
      Tuple2('PageView', (_) => PageViewSample()),
      Tuple2('NestedScrollView', (_) => NestedScrollViewSample()),
    ]),
    Tuple2('Input', <Tuple2>[
      Tuple2('Form', (_) => FormSample()),
    ]),
    Tuple2('Interaction model widgets', <Tuple2>[
      Tuple2('InkWell/GestureDetector', (_) => InkWellSample()),
      Tuple2('AbsorbPointer', (_) => AbsorbPointerSample()),
      Tuple2('ReorderableListView', (_) => ReorderableListViewSample()),
      Tuple2('Dismissible', (_) => DismissibleSample()),
      Tuple2('Draggable', (_) => DraggableSample()),
    ]),
    Tuple2('Async', <Tuple2>[
      Tuple2('FutureBuilder', (_) => FutureBuilderSample()),
      Tuple2('StreamBuilder', (_) => StreamBuilderSample()),
    ]),
    Tuple2('Other widgets', <Tuple2>[
      Tuple2('Semantics', (_) => SemanticsSample()),
      Tuple2('SafeArea', (_) => SafeAreaSample()),
      Tuple2('ValueListenableBuilder', (_) => ValueListenableBuilderSample()),
    ]),
    Tuple2('Animation widgets', <Tuple2>[
      Tuple2('AnimatedContainer', (_) => AnimatedContainerSample()),
      Tuple2('AnimatedSwitcher', (_) => AnimatedSwitcherSample()),
      Tuple2('FadeTransition', (_) => FadeTransitionSample()),
      Tuple2('AnimatedWidget', (_) => AnimatedWidgetSample()),
      Tuple2('AnimatedBuilder', (_) => AnimatedBuilderSample()),
    ]),
    Tuple2('Controller class', <Tuple2>[
      Tuple2('ScrollController', (_) => ScrollControllerSample()),
    ]),
    Tuple2('Camera', <Tuple2>[
      Tuple2(
        'Camera',
        (_) => CameraSample(
          camera: cameras.first,
        ),
      ),
      Tuple2(
        'BarcodeScanning',
        (_) => FirebaseBarcode(
          camera: cameras.first,
        ),
      ),
      Tuple2(
        'ImageLabeling',
        (_) => FirebaseImageLabel(
          camera: cameras.first,
        ),
      ),
      Tuple2(
        'Face',
        (_) => FirebaseFace(
          camera: cameras.first,
        ),
      ),
      Tuple2(
        'Text',
        (_) => FirebaseText(
          camera: cameras.first,
        ),
      ),
    ])
  ];
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: textTheme.headline6,
        ),
      ),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].item1),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MySecondPage(
                      title: items[index].item1,
                      items: items[index].item2,
                    ),
                  ));
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
    );
  }
}

class MySecondPage extends StatelessWidget {
  final String title;
  final List<Tuple2> items;

  MySecondPage({this.title, this.items});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: textTheme.headline6,
        ),
      ),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].item1),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: items[index].item2,
                    fullscreenDialog: true,
                  ));
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
    );
  }
}
