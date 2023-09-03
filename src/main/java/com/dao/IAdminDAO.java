package com.dao;

import com.entity.Admin;

public interface IAdminDAO {
  int createAdmin(Admin admin);
  int updateAdminPassword(Admin admin);
  Admin getAdminDetails(String username,String password);
  Long getAdminRowCount();
}
