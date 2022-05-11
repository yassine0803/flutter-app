import 'package:flutter_test/flutter_test.dart';
import 'package:notify/model/user_model.dart';
import 'package:notify/providers/user_provider.dart';

void main() {
  test('check crud users', () {
    UserProvider userProvider = UserProvider();
    expect(userProvider.users, <UserModel>[]);

    userProvider.getUsers();
    expect(userProvider.users.length, 3);

    userProvider.deleteUser(0);

    expect(userProvider.users.length, 2);

    userProvider.users[0] = UserModel.fromJson(
      {
        "name": "Jamal Izzedin",
        "role": "Branch Admin",
        "place": "Sanaya",
        "city": "Riyadh",
        "branch": "branch 1"
      },
    );

    userProvider.editUserRole(0, 'User');

    expect(userProvider.users[0].role, 'User');
  });
}
