package kr.ac.kopo.symovie.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.ac.kopo.symovie.model.*;
import kr.ac.kopo.symovie.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.symovie.pager.Pager;
import kr.ac.kopo.symovie.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {
	final String moviePath = "movie/";
	final String uploadPath = "d:/upload/";
	
	@Autowired
	MovieService service;

	@Autowired
	OrdersService ordersService;
	
	@GetMapping("/list")
	String list(Model model, Pager pager, 
			@RequestParam(required = false, defaultValue = "0") int movieSearch, String movieKeyword) {
		
		if(movieSearch == 0 && movieKeyword != null) {
		pager.setMovieSearch(movieSearch);
		pager.setMovieKeyword(movieKeyword);
		}
		
		System.out.println(pager.getMovieKeyword());
		
		List<Movie> list = service.list(pager);
				
		model.addAttribute("list", list);
		
		return moviePath + "list";
	}
	
	@GetMapping("/add")
	String add() {
		
		return moviePath + "add";
	}
	
	
	@PostMapping("/add")
	String add(Movie item, MultipartFile uploadFile) {
		
		MovieImage image = new MovieImage();
		
		MultipartFile file = uploadFile;
		
			if(file != null && !file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				
				try {
					file.transferTo(new File(uploadPath + filename + "_" + uuid));
					
					image.setMovieImageFilename(filename);
					image.setMovieImageUuid(uuid);
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
		item.setMovieImage(image);
		
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{movieNum}")
	String update(@PathVariable Long movieNum, Model model) {
	
		Movie item = service.item(movieNum);
		
		model.addAttribute("item", item);
		
		return moviePath + "update";
	}
	
	@PostMapping("/update/{movieNum}")
	String update(@PathVariable Long movieNum, Movie item, MultipartFile uploadFile) {

		MovieImage image = new MovieImage();

		MultipartFile file = uploadFile;

		if(file != null && !file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();

			try {
				file.transferTo(new File(uploadPath + filename + "_" + uuid));

				image.setMovieImageFilename(filename);
				image.setMovieImageUuid(uuid);

				item.setMovieImage(image);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		item.setMovieNum(movieNum);

		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@ResponseBody
	@GetMapping("/delete/{movieNum}")
	String delete(@PathVariable Long movieNum) {
		
		service.delete(movieNum);
		
		return "OK";
	}
	
	@GetMapping("/dummy")
	String dummy() {
		
		service.dummy();
		
		return "redirect:list";
	}
	
	@GetMapping("/init")
	String init() {
		
		service.init();
		
		return "redirect:list";
	}
	
	@GetMapping("/detail/{movieNum}")
	String detail(@PathVariable Long movieNum, Model model) {
		
		Movie item = service.item(movieNum);

		model.addAttribute("item", item);
		
		return moviePath + "detail";
	}

	@ResponseBody
	@PostMapping("/megabox")
	String megabox(@RequestBody MegaMovie item) {

		String filename = item.getImgFilename();
		MovieImage image = new MovieImage();

		image.setMovieImageFilename(filename);

		item.setMovieImage(image);

		service.megabox(item);

		return "OK";
	}

	@GetMapping("/list-test")
	String listTest(Model model, Pager pager,
					@RequestParam(required = false, defaultValue = "0") int movieSearch, String movieKeyword){

		if(movieSearch == 0 && movieKeyword != null) {
			pager.setMovieSearch(movieSearch);
			pager.setMovieKeyword(movieKeyword);
		}

		System.out.println(pager.getMovieKeyword());

		List<Movie> list = service.list(pager);

		model.addAttribute("list", list);

		return moviePath + "list-test";
	}
}
