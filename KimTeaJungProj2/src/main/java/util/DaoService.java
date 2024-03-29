package util;

import java.util.List;
import java.util.Map;

//제너릭 인터페이스
public interface DaoService<T> {
	void close();
	List<T> selectList(Map map);
	int getTotalRecordCount(Map map);
	int insert(T dto);
	T selectOne(String ... one);
	int update(T dto);
	int delete(String no);
	
}
