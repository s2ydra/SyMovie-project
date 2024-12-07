package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.AddSetDTO;
import kr.ac.kopo.symovie.model.SetMenu;
import kr.ac.kopo.symovie.pager.Pager;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SetDaoImpl implements SetDao {
    @Autowired
    SqlSession sql;


    @Override
    public List<SetMenu> list(Pager pager) {
        return sql.selectList("set.list", pager);
    }

    @Override
    public int total() {

        
        return sql.selectOne("set.total");
    }

    @Override
    public void add(AddSetDTO item) {
        sql.insert("set.add", item);
    }
}
