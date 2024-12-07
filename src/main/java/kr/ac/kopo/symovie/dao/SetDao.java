package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.AddSetDTO;
import kr.ac.kopo.symovie.model.SetMenu;
import kr.ac.kopo.symovie.pager.Pager;

import java.util.List;

public interface SetDao {
    List<SetMenu> list(Pager pager);

    int total();

    void add(AddSetDTO item);
}
