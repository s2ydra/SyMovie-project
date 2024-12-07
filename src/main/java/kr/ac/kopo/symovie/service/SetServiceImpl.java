package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.dao.SetDao;
import kr.ac.kopo.symovie.model.AddSetDTO;
import kr.ac.kopo.symovie.model.SetMenu;
import kr.ac.kopo.symovie.pager.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SetServiceImpl implements SetService {

    @Autowired
    SetDao dao;

    @Override
    public List<SetMenu> list(Pager pager) {
        int total = dao.total();

        pager.setTotal(total);

        return dao.list(pager);
    }

    @Override
    public void add(AddSetDTO item) {
        dao.add(item);
    }
}
