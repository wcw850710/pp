void main() {
  '''
  dart 靜態強類型OOP語言
    JIT 即時編譯, 開發期間, 更快編譯, 更快的重載
    AOT 事前編譯, release期間, 更快更流暢
  ''';

  '''
  常用數據類型
    數字類型
    num 數字類型的父類
  ''';
  print('----num type----');
  num num1 = -1.0;
  num num2 = 2;

  '整數';
  int int1 = 3;

  '雙精度';
  double d1 = 1.68;
  print('num:$num1, num:$num2, int:$int1, double:$d1');

  '''
  常用方法
  絕對值
  ''';
  num1.abs();

  '轉換成int類型';
  num1.toInt();

  '轉換成double類型';
  num1.toDouble();

  '''
  字符串類型
  ''';
  print('----string type----');
  String str1 = '字符串', str2 = "雙引號字符串";
  String str3 = str1 + ' ' + str2;

  '可以使用單或雙引號+\$[變量名稱]來拼接字符串';
  String str4 = '$str1 $str2';
  String str5 = 'hello world';

  '''
  常用方法
  擷取字符串 hel
  ''';
  print(str5.substring(0, 3));

  '獲取字符串索引 6';
  print(str5.indexOf('wor'));
  'startsWith, replaceAll, contains, split...';

  '''
  布爾類型
  dart是強bool類型檢查，只有值是true才被認為是true
  ''';
  print('----bool type----');
  bool success = true, fail = false;
  print(success);
  print(fail);
  print(success || fail); // true
  print(success && fail); // false

  '''
  List集合 List<T>
  使用List, []表示集合
  ''';
  print('----list type----');
  List list = [1, 3, 5, '集合'];
  print(list);

  List<int> intList = [1, 3, 5];
  intList.add(7);
  intList.addAll([9, 11]);
  print(intList);
  '[1,3,5,7,9,11]';

  'List.generate如同js的Array.from(new Array)';
  List list3 = List.generate(3, (i) => i * 2);
  print(list3);

  '''
  集合遍歷方式
  ''';
  for (int i = 0; i < list3.length; i++) {
    int e = list3[i];
  }
  for (var e in list) {}
  list3.forEach((e) {});
  '常用方法removeXx,insert,sublist,indexOf,...';

  '''
  Map key-value
  ''';
  print('----list type----');
  Map users = {'1': 'frank', 2: 'jeff'};
  print(users);
  Map ages = {};
  ages['frank'] = 24;

  '遍歷';
  ages.forEach((key, value) {});
  'dart map也可以使用map, 這裡用MapEntry更改原本的key-value';
  Map ages2 = ages.map((key, value) => MapEntry(value, key));
  print('ages: $ages');
  '{frank: 24}';
  print('ages2: $ages2');
  '{24: frank}';
  for (var key in ages.keys) {
    '\${}如同js的\${}, 用來處理非單一值得區塊';
    print('$key: ${ages[key]}');
  }
  '''
  ages.key == Object.keys(arr)
  ages.values == Object.values(arr)
  ''';
  '常見方法keys,values,remove,containsKey';

  '''
  dynamic, var, Object三者區別
  ''';
  print('----dynamic, var, Object三者區別----');
  dynamic aa = 'aa';
  '運行時的type, dynamic只能在運行時知道type, 但會讓dart語法檢查失效';
  print(aa.runtimeType);
  'String';
  print(aa);
  // aa.foo(); 不會報錯，因為放棄類型檢查
  aa = 123;
  print(aa.runtimeType);
  'int';
  print(aa);

  'var 為類型推斷，申明是什麼類型最終就是什麼類型';
  var aaa = 'aaa';
  print(aaa.runtimeType);
  'String';
  print(aaa);
  // aaa=123; 報錯，aaa應該是字串

  'Object dart對象的基類';
  Object o1 = '111';
  print(o1.runtimeType); //String
  print(o1);
  // o1.foo() 與dynamic插在不能調用Object裡沒有的方法

  '''
  OOP
  ''';
  print('----OOP----');
  '實例化可以省略new關鍵字';
  var person = Person('frank', 24);
  print(person);

  var student = Student('真香國小', 'frank', 24);
  print(student);

  var log1 = Logger();
  var log2 = Logger();
  print(log1 == log2);
  log1.log('hello world');











  '''
  方法 function
  返回值類型 方法名(參數){}
  返回值類型：可以省略
  方法名：匿名方法可省
  參數：參數類型和參數名，類型可省(又可分可選參數跟默認參數)
  ''';
  print('----function----');
  study(){
    print('study');
  }
  int sum(int v, int v2) {
    return v + v2;
  }
  print(sum(5, 8)); '13';
  '默認可選參數[類型 名稱 = 默認值]';
  int sum2(int v, [int v2 = 0]) => v + v2;
  print(sum2(5)); '5';
  print(sum2(5, 9)); '14';

  int sum3(int v, {int v2 = 0}) => v + v2;
  print(sum3(5, v2: 20)); '25';

  // 可以使用_創建私有方法，作用域為當前文件
  void _a() {}

  [1].forEach((e) => e + 5); '這個(e) => ...就是匿名方法';







  '''
  泛型 generic
  ''';
  print('----泛型 generic----');
  var cache = Cache<String>();
  cache.setItem('k', 'v');
  print(cache.getItem('k')); 'v';
  print(cache.getItem('ks')?.length); 'null 可以使用 ?. 可選鍊';

  '泛型約束 使用 extends 關鍵字';
  int sum4<T extends int>(int v, T v2) => v + v2;
  sum4(1, 2);





  '''
  可用於flutter的OOP技巧
  1 封裝、繼承、多態
    不管小大都封裝，且不要在一個方法體寫太多代碼<100
  2 點點的技巧
    在一個類的世界裡：萬物皆對象
      1 點查看對象有哪些方法和屬性
      2 點看源碼
      3 點探究竟
      
  Dart編程小技巧
  1 安全調用 防止空異常(2前用，使用?.可選鍊防止空)
  2 設置默認值(2前用，如： ?? 0)
  3 簡化判斷
  可參閱：Effective Dart 最佳實踐(https://www.dartcn.com/guides/language/effective-dart/)
  ''';
  print('----小技巧----');
  var list2 = [0, '', null];

  '簡化判斷';
  if(list[0]==null||list[0]==''||list[0]==0) {
    print('list[0] is empty');
  }
  '簡寫成↓';
  if([null, '', 0].contains(list[0])){}
}

// OOP 在dart裡所有類都繼承於Object
class Person {
  String name;
  int age;

  // constructor, 可以使用這種方式省略 this.name=name, ... 的寫法
  // this.xxx == 初始化自有參數
  Person(this.name, this.age);

  @override
  String toString() {
    '可以使用@override複寫父類方法';
    return 'Person:: name: $name, age: $age';
  }
}

//繼承
class Student extends Person {
  String _school; // 通過_表示私有字段
  String? city; // ? 表示可選
  String? country;
  String name;

  // 初始化子類必須要調用父類構造方法(super)
  // {}表示可選參數, =xx默認參數
  Student(this._school, String name, int age,
      {this.country = 'taiwan', this.city = 'taichung'})
      :
        // 初始化列表：除了調用父類構造器，在子類構造器方法體之前，你也可以初始化實例變量，不同的初始化變量之間用逗號分開
        // 這裡的name=為this.name=，不是構造參數的name
        name = '$country.$city.$name',
        // 如果父類沒有默認構造方法，則需要在初始化列表中調用父類的構造方法
        // super(值, 值) // 將值傳給父類構造器
        super(name, age) {
    '構造方法體 不是必需的';
    print('this.name: ${this.name}, name: $name');
  }

  // 命名構造方法: [類明.方法名]
  // 使用命名構造方法為類實現多個構造方法
  Student.cover(Student stu, this._school, this.name): super(stu.name, stu.age);

  @override
  String toString() {
    return '_school: $_school, city: $city, name: $name';
  }

  // getter 類型可省略(此指String)，可以用來暴露私有變量
  String get school => _school;
  // setter 類型可省略(此指String)
  set school(String val) {
    _school = val;
  }

  static hello() {
    'static 靜態方法';
    print('hello my name is Student-class.');
  }
}

class Logger {
  static Logger _cache = Logger._internal();
  factory Logger(){
    '''
    工廠構造方法：
    不僅是構造方法，更是一種模式
    有時候為了返回一個之前已經創建的緩存對象, 原始的構造方法已經不能滿足要求
    那麼便可使用工廠模式來定義構造方法(也可理解為單例)
    ''';
    return Logger._cache;
  }
  Logger._internal();
  void log(String msg) {
    print(msg);
  }
}

class Logger2 {
  String history;
  Logger2(this.history);

  factory Logger2.v(Logger2 log){
    '''
    命名工廠構造方法：factory 類名.方法名
    她可以有返回值, 而且不需要將類型的final變量作為參數，是提供一種靈活獲取類對象的方式
    可以當作靈活的命名構造類看待
    ''';
    return Logger2(log.history);
  }
}



//抽象類
//使用abstract修飾符定義抽象類，該類不能被實例化
//在定義接口時非常有用
abstract class Study {
  //沒有方法體的方法就是抽象方法
  void study();
}

//繼承類要實現抽象方法
class StudyFlutter extends Study {
  @override
  void study() {
    print('learning flutter');
  }
}



// mixins
// mixins 是在多個層次結構中重用代碼的一種方式
// 要使用mixins，在with關鍵字後面跟上一個或多個mixin的名字, 並且with要在extends關鍵字之後
// 特徵：實現mixin，就創建一個繼承Object類的子類(不能繼承其他類)，不申明任何構造方法，不調用super
class Test extends Person with Study {
  Test(String name, int age) : super(name, age);

  @override
  void study() {
    // TODO: implement study
  }
}



// 泛型類
class Cache<T> {
  static final Map<String, Object> _cached = Map();
  setItem(String k, T v) {
    _cached[k] = v!;
  }
  getItem(String k) {
    return _cached[k];
  }
}

 //泛型約束 使用 extends 關鍵字
class Member<T extends Person> {
  T _person;
  Member(this._person);
  String fixedName(){
    return 'fixed:${_person.name}';
  }
}