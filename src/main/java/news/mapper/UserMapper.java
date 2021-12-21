package news.mapper;

import news.beans.User;
import news.beans.W_stat;

import java.util.ArrayList;

public interface UserMapper {
      User finduser(User user);
      int addUser(User user);
      User findusername(User user);
      ArrayList<User> userlist();
      //根据用户ID删除用户
      boolean deleteUser(String id);
      //修改普通用户个人信息
      boolean modiUser(User user);
      User getUserByName(String name);
}
