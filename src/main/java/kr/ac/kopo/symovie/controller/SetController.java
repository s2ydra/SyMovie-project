package kr.ac.kopo.symovie.controller;

import kr.ac.kopo.symovie.model.AddSetDTO;
import kr.ac.kopo.symovie.model.Movie;
import kr.ac.kopo.symovie.model.SetMenu;
import kr.ac.kopo.symovie.pager.Pager;
import kr.ac.kopo.symovie.service.MovieService;
import kr.ac.kopo.symovie.service.SetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping("/set")
public class SetController {

    @Autowired
    SetService service;

    @Autowired
    MovieService movieService;

    final String path = "set/";

    @GetMapping("/list")
    String list(Model model, Pager pager) {
        List<SetMenu> list = service.list(pager);

        model.addAttribute("list", list);
        return "set/list";
    }

    @GetMapping("/add")
    String add() {
        return path + "add";
    }

    @PostMapping("/add")
    String add(AddSetDTO item) {

        service.add(item);

        return "redirect:list";
    }


}
