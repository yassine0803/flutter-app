import 'package:flutter/material.dart';
import 'package:notify/model/user_model.dart';
import 'package:notify/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UsersWidget extends StatefulWidget {
  final UserModel user;
  final int index;
  UsersWidget({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  @override
  State<UsersWidget> createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> {
  bool _edit = false;
  bool _selectRole = true;
  bool _selectBranch = true;
  String dropdownValue = 'One';

  String _userRole = '(select)';
  String _userBranch = '(select)';

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('user-widget-${widget.index}'),
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 21,
        top: 11,
        right: 17,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment:
                  _edit ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  key: Key('name-${widget.index}'),
                  onTap: () {
                    setState(() {
                      _edit = !_edit;
                      _userRole = '(select)';
                      _userBranch = '(select)';
                      _selectRole = true;
                      _selectBranch = true;
                    });
                  },
                  child: Container(
                    width: 108,
                    child: Text(
                      widget.user.name.toString(),
                      style: TextStyle(
                        color: Color(0xff27AE60),
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff27AE60),
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 1.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: _edit ? 18 : 44,
                  ),
                  child: _edit
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xffD4D4D4),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xffD4D4D4),
                                    ),
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectRole = !_selectRole;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 44,
                                        child: Text(
                                          _selectRole ? '(select)' : _userRole,
                                          style: TextStyle(
                                            color: Color(0xff585858),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        _selectRole
                                            ? Icons.arrow_drop_up
                                            : Icons.arrow_drop_down,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              _selectRole
                                  ? Padding(
                                      padding: _selectRole
                                          ? EdgeInsets.only(
                                              top: 13,
                                              left: 5,
                                            )
                                          : EdgeInsets.zero,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _userRole = 'User';
                                            _selectRole = !_selectRole;
                                          });
                                          Provider.of<UserProvider>(context,
                                                  listen: false)
                                              .editUserRole(
                                                  widget.index, 'User');
                                        },
                                        child: Text(
                                          'User',
                                          style: TextStyle(
                                            color: Color(0xff585858),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              _selectRole
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        left: 5,
                                        bottom: 15,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _userRole = 'Admin';
                                            _selectRole = !_selectRole;
                                          });
                                          Provider.of<UserProvider>(context,
                                                  listen: false)
                                              .editUserRole(
                                                  widget.index, 'Branch Admin');
                                        },
                                        child: SizedBox(
                                          width: 38,
                                          child: Text(
                                            'Branch Admin',
                                            style: TextStyle(
                                              color: Color(0xff585858),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(
                          width: 44,
                          child: Text(
                            widget.user.role.toString(),
                            style: TextStyle(
                              color: Color(0xff585858),
                              fontSize: 12,
                            ),
                          ),
                        ),
                ),
                Container(
                  width: 127,
                  child: _edit
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xffD4D4D4),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xffD4D4D4),
                                    ),
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectBranch = !_selectBranch;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _selectBranch
                                            ? '(select)'
                                            : _userBranch,
                                        style: TextStyle(
                                          color: Color(0xff585858),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Icon(
                                        _selectBranch
                                            ? Icons.arrow_drop_up
                                            : Icons.arrow_drop_down,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              _selectBranch
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        top: 13,
                                        left: 5,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _userBranch = 'Branch 1';
                                            _selectBranch = !_selectBranch;
                                          });
                                          Provider.of<UserProvider>(context,
                                                  listen: false)
                                              .editUserBranch(
                                                  widget.index, 'Branch 1');
                                        },
                                        child: Text(
                                          'Branch 1',
                                          style: TextStyle(
                                            color: Color(0xff585858),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              _selectBranch
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        top: 13,
                                        left: 5,
                                        bottom: 19,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _userBranch = 'Branch 2';
                                            _selectBranch = !_selectBranch;
                                          });
                                          Provider.of<UserProvider>(context,
                                                  listen: false)
                                              .editUserBranch(
                                                  widget.index, 'Branch 2');
                                        },
                                        child: Text(
                                          'Branch 2',
                                          style: TextStyle(
                                            color: Color(0xff585858),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.user.branch.toString(),
                              style: TextStyle(
                                color: Color(0xff585858),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              widget.user.place.toString() +
                                  ' - ' +
                                  widget.user.city.toString(),
                              style: TextStyle(
                                color: Color(0xff585858),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
            SizedBox(
              height: !_edit ? 0 : 27,
            ),
            !_edit
                ? Container()
                : Container(
                    key: Key('delete-${widget.index}'),
                    width: 135,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff27AE60),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      child: Text(
                        'Delete Account',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _edit = false;
                        });
                        Provider.of<UserProvider>(context, listen: false)
                            .deleteUser(widget.index);
                      },
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(
                top: 15,
              ),
              height: 1,
              color: Color(0xffE2E4E5),
            ),
          ],
        ),
      ),
    );
  }
}
