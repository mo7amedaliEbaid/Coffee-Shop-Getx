import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search_controller.dart';

class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;
  TextEditingController _textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    MySearchController _searchController=Get.put(MySearchController());

    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _folded ? mediaQuery.width * 0.5 : mediaQuery.width * 0.75,
      height: mediaQuery.width * 0.02,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16.0),
              child: !_folded
                  ? TextField(
                controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: Theme.of(context).textTheme.headline6,
                        border: InputBorder.none,
                      ),
                onChanged: (searchedvalue){
                  searchedvalue=_textEditingController.text.toString().trim();
                  _searchController.getsearchedlist(searchedvalue);
                  print(_searchController.searchedfordrinks.first.name.toString());
                  _searchController.setSearchingstate(1);
                },
                    )
                  : null,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:_folded ? Icon(
                      Icons.search ,
                    size: 30,
                    color: Colors.black,
                  ):InkWell(
                    onTap: (){
                     // setState(() {
                    //    _folded = !_folded;
                       // _searchController.setSearchingstate(0);
                        //_textEditingController.clear();
                    //  });

                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 12),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.close,size: 30,color: Colors.black,),
                      ),
                    ),
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
