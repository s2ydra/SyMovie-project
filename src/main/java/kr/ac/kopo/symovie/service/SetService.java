package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.model.AddSetDTO;
import kr.ac.kopo.symovie.model.SetMenu;
import kr.ac.kopo.symovie.pager.Pager;

import java.util.List;

public interface SetService {

    List<SetMenu> list(Pager pager);

    void add(AddSetDTO item);
}
