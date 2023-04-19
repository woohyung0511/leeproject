package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller
public class IpgoController {

	@Autowired
	IpgoMapperInter mapper;

	@GetMapping("/")
	public String start() {
		return "/layout/main";
	}

	@GetMapping("/ipgo/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();

		// 전체 갯수
		int totalCount = mapper.getTotalCount();
		// 전체 조회
		List<IpgoDto> list = mapper.getAllDatas();

		for (IpgoDto dto : list) {
			String[] photos = dto.getPhotoname().split(",");
			dto.setDimage(photos[0]);
		}

		model.addObject("list", list);
		model.addObject("totalCount", totalCount);

		// model.setViewName("ipgolist"); //jsp resolver
		model.setViewName("/sub/ipgo/ipgolist"); // tiles resolver /폴더명/파일명

		return model;

	}

	@GetMapping("/ipgo/form")
	public String form() {
		// return "ipgoform";
		return "/sub/ipgo/ipgoform";
	}

	@PostMapping("/ipgo/insert")
	public String insert(@ModelAttribute IpgoDto dto, @RequestParam ArrayList<MultipartFile> upload,
			HttpSession session) 
	{
		String path = session.getServletContext().getRealPath("/photo");
		System.out.println(path);

		String uploadName = "";
		int idx = 1;

		if (upload.get(0).getOriginalFilename().equals(""))
			uploadName = "no";
		else {
			for (MultipartFile f : upload) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String fName = idx++ + "_" + sdf.format(new Date()) + "_" + f.getOriginalFilename();
				uploadName += fName + ",";

				// 업로드
				try {
					f.transferTo(new File(path + "\\" + fName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			// 마지막 컴마 제거
			uploadName = uploadName.substring(0, uploadName.length() - 1);
		}
		dto.setPhotoname(uploadName);

		mapper.insertIpgo(dto);

		return "redirect:list";
	}

	@GetMapping("/ipgo/delete")
	public String delete(@RequestParam String num, 
			HttpSession session) 
	{
		
		String path = session.getServletContext().getRealPath("/photo");
		String uploadfile = mapper.getData(num).getPhotoname();

		String [] upload=uploadfile.split(",");
		
		for(String s:upload)
		{
			 File file = new File(path + "\\" + s);
			 
			  file.delete();
		}
		mapper.deleteIpgo(num);

		return "redirect:list";
	}
	
	@GetMapping("/load/map")
	public String load()
	{
		return "/sub/load/map";
	}
}
