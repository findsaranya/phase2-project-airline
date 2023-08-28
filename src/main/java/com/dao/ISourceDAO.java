package com.dao;

import java.util.List;

import com.entity.Source;

public interface ISourceDAO {
  int createSource(Source source);
  int updateSource(Source source);
  int deleteSource(int srcId);
  List<Source> getSourceList();
  Source getSourceDetail(int srcId);
}
