package com.dongguk.Raview;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongguk.Raview.dao.*;
import com.dongguk.Raview.dto.ImageDto;
import com.google.api.services.discovery.model.JsonSchema.Variant.Map;
import com.google.appengine.api.datastore.Entity;

@Controller
public class AdminController {
	@RequestMapping({"/", "/chart"})
	public String welcomeForm(Locale locale, Model model) {
		return "chartForm";
	}
	
	@RequestMapping("/cctv")
	public String cctvForm(Locale locale, Model model) {

		IImageDao dao = new ImageDao();
		Entity en = dao.getDao("100");
		String time = (String) en.getProperty("time");
		String base64 = (String) en.getProperty("base64");
		String countCar = (String) en.getProperty("countCar");
		String prefix = "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgr/2wBDAQICAgICAgUDAwUKBwYHCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgr/wAARCAAgACADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/";
		String imgSrc = "data:image/bmp;base64," + prefix + base64;
		
		// 파라미터 추가 영역
		model.addAttribute("gps", "100");
		model.addAttribute("time", time);
		model.addAttribute("countCar", countCar);
		model.addAttribute("imgSrc", imgSrc);

		return "cctvForm";
	}
	
	@RequestMapping("/data")
    @ResponseBody 
    public List<ImageDto> data()
	{
		IImageDao dao = new ImageDao();
		List<Entity> listEntity = dao.listDao();
		List<ImageDto> listDto = new ArrayList<ImageDto>();
		for(int i = 1; i<listEntity.size(); i++)
		{
			Entity en = listEntity.get(i);
			String time = (String) en.getProperty("time");
			String base64 = (String) en.getProperty("base64");
			String countCar = (String) en.getProperty("countCar");
			listDto.add(new ImageDto("100", time, Integer.parseInt(countCar), base64));
		}
        return listDto;
    } 

	@RequestMapping("/login")
	public String loginForm(Locale locale, Model model) {
		return "loginForm";
	}

	@RequestMapping("/home")
	public String home(Locale locale, Model model) {
		return "homeForm";
	}
	

	@RequestMapping("/receiveImg")
	public String receiveImg(HttpServletRequest request, Locale locale, Model model) throws ServletException {
		IImageDao dao = new ImageDao();
		List<Entity> listDto = dao.listDao();
		int size = listDto.size();
		for(int i =10; i<size; i++)
		{
			Entity en = listDto.get(i);
			dao.deleteDao((String) en.getProperty("time"));
		}
		
		String gps = request.getParameter("gps");
		String time = request.getParameter("time");
		String base64 = request.getParameter("base64");
		String countCar = request.getParameter("countCar");
		
		dao.writeDao(gps, time, countCar, base64);
		dao.writeDao(time, time, countCar, "0");
		return "homeForm";
	}

	@RequestMapping("/setImg")
	public String setImg(HttpServletRequest request, Locale locale, Model model) throws ServletException {
		IImageDao dao = new ImageDao();		
		dao.writeDao("100", "dongguk", "13", "dongguk");
		return "homeForm";
	}
}