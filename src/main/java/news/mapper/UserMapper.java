package news.mapper;

import news.beans.User;
import news.beans.W_stat;

import java.util.ArrayList;

public interface UserMapper {
      User finduser(User user);
      int addUser(User user);
      User findusername(User user);
      ArrayList<User> userlist();
}
