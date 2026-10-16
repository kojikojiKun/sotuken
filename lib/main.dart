import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // このWidgetはアプリケーションのルートとなるWidgetです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // これはアプリケーションのテーマです。
        //
        // 試してみよう：
        // 「flutter run」を実行してアプリを起動してみてください。
        // 緑色のツールバーが表示されます。
        // その後、アプリを終了せずに、下のcolorSchemeにある
        // seedColorをColors.greenに変更して、
        // Hot Reload（変更を保存するか、Flutterに対応したIDEの
        // 「Hot Reload」ボタンを押す）を実行してみてください。
        // コマンドラインから起動した場合は「r」を押しても
        // Hot Reloadできます。
        //
        // カウンターの値が0にリセットされていないことに注目してください。
        // Hot Reloadではアプリの状態が失われないためです。
        // 状態をリセットするには、Hot Restartを使用してください。
        //
        // これは値だけでなく、コードの変更にも適用されます。
        // ほとんどのコード変更は、Hot Reloadだけで確認できます。
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // このクラスはStatefulWidgetで、状態を持つことができます。
  // Stateとは、画面の表示に影響する値などを保持するオブジェクトです。
  //
  // このクラスはStateの設定を行います。
  // このWidgetには、親Widget（ここではMyApp）から渡された
  // titleという値が保存されています。
  // そして、その値は下にあるbuildメソッドで使用されます。
  //
  // Widgetのサブクラスにあるフィールドは、必ずfinalとして
  // 宣言されます。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // setStateを呼び出すことで、Flutterのフレームワークに
      // 「状態が変更された」ことを伝えます。
      // これによって、下にあるbuildメソッドが再度実行され、
      // 変更された値が画面に反映されます。
      //
      // もしsetState()を呼ばずに_counterの値だけを変更した場合、
      // buildメソッドは再実行されません。
      // そのため、画面上では何も変化していないように見えます。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドは、setStateが呼び出されるたびに再実行されます。
    // 例えば、上にある_incrementCounterメソッドから
    // setStateが呼び出された場合などです。
    //
    // Flutterのフレームワークは、buildメソッドを高速に再実行できるよう
    // 最適化されています。
    // そのため、変更が必要な部分だけを再構築することができます。
    // Widgetを1つずつ個別に変更する必要はありません。
    return Scaffold(
      appBar: AppBar(
        // 試してみよう：
        // ここで色をColors.amberなどの特定の色に変更してみてください。
        // そしてHot Reloadを実行すると、他の色はそのままにして
        // AppBarの色だけが変化することを確認できます。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        // ここでは、MyAppのbuildメソッドによって作成された
        // MyHomePageオブジェクトからtitleを取得し、
        // AppBarのタイトルとして設定しています。
        title: Text(widget.title),
      ),
      body: Center(
        // Centerはレイアウト用のWidgetです。
        // 1つのchildを受け取り、親Widgetの中央に配置します。
        child: Column(
          // Columnもレイアウト用のWidgetです。
          // childrenに指定された複数のWidgetを受け取り、
          // 縦方向に並べて配置します。
          //
          // デフォルトでは、横方向については子Widgetに合わせたサイズになり、
          // 縦方向については親Widgetの高さに合わせようとします。
          //
          // ここではmainAxisAlignmentを使って、
          // 子Widgetを縦方向の中央に配置しています。
          //
          // Columnではメイン軸が縦方向になるため、
          // mainAxisは縦方向を意味します。
          // それに対してcrossAxisは横方向を意味します。
          //
          // 試してみよう：
          // IDEから「Toggle Debug Paint」を選択するか、
          // コンソールで「p」を押して、
          // Debug Paintを有効にしてみてください。
          // すると、それぞれのWidgetの枠組みを確認できます。
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
