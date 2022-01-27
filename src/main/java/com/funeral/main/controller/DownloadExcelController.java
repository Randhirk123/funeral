package com.funeral.main.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.funeral.main.model.Funeral;
import com.funeral.main.repository.FuneralRepository;
import com.funeral.main.service.ExcelFileService;

@Controller
public class DownloadExcelController {

	@Autowired
	private FuneralRepository funeralRepository;
	
	@Autowired
	private ExcelFileService excelFileService;
	
	@GetMapping("/downloadExcelFile")
	public void downloadExcelFile(HttpServletResponse response) throws IOException {
		List<Funeral> contacts = (List<Funeral>)funeralRepository.findAll();
        ByteArrayInputStream byteArrayInputStream = excelFileService.export(contacts);
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=contacts.xlsx");
        IOUtils.copy(byteArrayInputStream, response.getOutputStream());
	}
}
