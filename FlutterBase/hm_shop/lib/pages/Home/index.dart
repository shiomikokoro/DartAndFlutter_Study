import 'package:flutter/material.dart';
import 'package:hm_shop/api/Home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/utils/Toastutils.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryItem> _categoryList = [];
  List<BannerItem> _bannerList = [];
  SpecialRecommendResult _recommendResult = SpecialRecommendResult(id: "",title: "",subTypes: []);
  List<GoodsItem>  _inVogueResult = [];
  List<GoodsItem> _oneStopResult = [];
  List<GoodDetailItem> _recommendList = [];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _registerEvent();
    Future.microtask((){
      _paddingTop = 100;
      setState(() {});
      _key.currentState?.show();//刷新数据
    });
  }
  // 监听滚动事件
  void _registerEvent(){
    _controller.addListener(() {
      if(_controller.position.pixels >= _controller.position.maxScrollExtent -50){
        _getRecommendList();
      }
    });
  }

  Future<void> _getBannerList() async{
    _bannerList = await getBannerListAPI();
  }

  Future<void> _getCategoryList() async{
    _categoryList = await getCategoryListAPI();
  }
  
  Future<void> _getSuggestionList() async{
    _recommendResult = await getHotListAPI();
  }

  Future<void> _getInVogueList() async{
    _inVogueResult = await getInVogueListAPI();
  }
  
  Future<void> _getOneStopList() async{
    _oneStopResult = await getOneStopListAPI();
  }

  //当前弊端，每次加载更多数据时，都会重新请求前面已经请求过的数据，
  //导致性能问题。解决方法是使用分页请求，每次只请求当前页的数据，并在加载更多时增加页码。
  int _page = 1; // 页码
  bool _isLoading = false; // 是否正在加载数据
  bool _hasMore = true; // 是否有更多数据
  Future<void> _getRecommendList() async{
    if(_isLoading || !_hasMore) {
      return;
    } // 如果正在加载或者没有更多数据，直接返回 
    _isLoading = true;
    _recommendList = await getRecommendListAPI({"limit":_page*10});
    _isLoading = false;
    setState(() {}); 
    if(_recommendList.length<_page*10){
      _hasMore = false; // 如果返回的数据少于请求的数量，说明没有更多数据了
      return;
    }
    _page++;
  }
  Future<void> _onRefresh() async{
    _page = 1;
    _isLoading = false;
    _hasMore = true;
    await _getBannerList();
    await _getCategoryList();
    await _getSuggestionList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();
    Toastutils.showToast("刷新成功", context);
    _paddingTop = 0;
    setState(() {});

  }

  List<Widget> _getSlivers(){
    return [
      //轮播图
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList,)),
      //分类
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList,)),
      //推荐
      SliverToBoxAdapter(child: HmSuggestion(recommendResult: _recommendResult)),
      SliverToBoxAdapter(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Flex(
          spacing: 10,
          direction: Axis.horizontal, 
          children: [Expanded(child: HmHot(result: _inVogueResult,type: "hot",)),Expanded(child: HmHot(result: _oneStopResult,type: "step",))],
        )),
      ),
      //因为直接返回列表无法进行包裹（逻辑和其他不一样），在内部设置。
      HmMoreList(recommendList: _recommendList),
    ];
  }
  //GlobalKey可以创建一个全局唯一的标识符，可以用来访问和操作对应的Widget。
  final GlobalKey<RefreshIndicatorState> _key = GlobalKey<RefreshIndicatorState>();
  double _paddingTop = 0;
  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      key: _key,
      onRefresh: _onRefresh,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.only(top: _paddingTop),
        child: CustomScrollView(
          controller: _controller,
          slivers: _getSlivers(),
        ),
      )
    );
  }
}
