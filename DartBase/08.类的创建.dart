class User{
  int? age;
  String? name;
  int? sex;//0:保密、1男、2女
  void study(){
    print("$name is studying");
  }

  //使用可选命名参数创建默认构造函数
  // User({String? name,int? age,int? sex}){
  //   this.age=age;
  //   this.name=name;
  //   this.sex=sex;
  // }

  //命名构造函数
  User.noSex({String? name,int? age}){
    this.age=age;
    this.name=name;
  }

  //(最常见)构造函数语法糖：语法糖的意思就是简写，这种写法后面要分号
  User({this.age,this.name,this.sex});//默认
  User.noAge({this.name,this.sex});//命名
  


  //重写toString方法
  @override
  String toString() {
    return "User[name:$name,age:$age,sex:${this.sex==null?null:this.sex==0?'保密':this.sex==1?'男':'女'}]";
  }
}

class File{
  //带下划线的都是私有属性，其余都是公有属性
  String? _id;
  String? name;
  //带下划线的是私有方法
  String? _getId(){return this._id;}
  void setId({String? id}){this._id=id;}
  //报错，疑似不能使用语法糖
  //[x] File({this._id,this.name});
}
void main(List<String> args) {
  User user = User();
  User user2 = User(name: 'shiomi',sex: 1,age: 11);
  User user3 = User.noSex(name: 'iroha',age: 1);
  User user4 = User.noAge(name: 'aibo',sex: 2);
  print(user);
  print(user2);
  print("new user: $user3");
  print("new user: $user4");

  File file = File();
  file.setId(id: "ssss");
  //同一文件下可以访问私有属性和私有方法。文件不同就不行。
  // print(file._getId());//ssss
}