package kr.ac.kopo.symovie.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.symovie.model.Food;
import kr.ac.kopo.symovie.model.FoodImage;
import kr.ac.kopo.symovie.pager.Pager;
import kr.ac.kopo.symovie.service.FoodService;

@Controller
@RequestMapping("/food")
public class FoodController {
	final String foodPath = "food/";
	final String uploadPath = "d:/upload/";
	
	@Autowired
	FoodService service;
	
	@GetMapping("/list")
	String list(Model model, Pager pager) {
		List<Food> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return foodPath + "list";
	}

	@GetMapping("/list-popup")
	String listPopup(Model model, Pager pager) {

		pager.setPerPage(5);

		List<Food> list = service.list(pager);
		model.addAttribute("list", list);

		return foodPath + "list-popup";
	}

	@GetMapping("/add")
	String add() {
		
		return foodPath + "add";
	}
	
	@PostMapping("/add")
	String add(Food item, List<MultipartFile> uploadFile) {
		
		List<FoodImage> foodImage = new ArrayList<FoodImage>();
		
		for(MultipartFile file : uploadFile)
			if(file != null && !file.isEmpty()) {
				String fileName = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				
				try {
					file.transferTo(new File(uploadPath + fileName + "_" + uuid));
					
					FoodImage image = new FoodImage();
					
					image.setFoodImageFilename(fileName);
					image.setFoodImageUuid(uuid);
					
					foodImage.add(image);
					
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
		
		item.setFoodImage(foodImage);
		
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{foodNum}")
	String update(@PathVariable Long foodNum, Model model) {
		Food item = service.item(foodNum);
		
		model.addAttribute("item", item);
		
		return foodPath + "update";
	}
	
	@PostMapping("/update/{foodNum}")
	String update(@PathVariable Long foodNum, Food item) {
		item.setFoodNum(foodNum);
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@ResponseBody
	@GetMapping("/delete/{foodNum}")
	String delete(@PathVariable Long foodNum) {
		
		service.delete(foodNum);
		
		return "OK";
	}

	@GetMapping("/detail/{foodNum}")
	String detail(@PathVariable Long foodNum, Model model) {

		Food item = service.item(foodNum);

		model.addAttribute("item", item);

		return foodPath + "detail";
	}

	@GetMapping("/list-popup-set")
	String listPopupSet(Model model, Pager pager) {

		pager.setPerPage(5);

		List<Food> list = service.list(pager);
		model.addAttribute("list", list);

		return foodPath + "list-popup-set";
	}

	@ResponseBody
	@GetMapping("/addToSet/{foodNum}")
	Food addToSet(@PathVariable Long foodNum) {

		Food food = service.item(foodNum);

		return food;
	}

}
