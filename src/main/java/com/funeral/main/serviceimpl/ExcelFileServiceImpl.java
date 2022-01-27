package com.funeral.main.serviceimpl;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.funeral.main.model.Funeral;
import com.funeral.main.service.ExcelFileService;

@Service
public class ExcelFileServiceImpl implements ExcelFileService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public ByteArrayInputStream export(List<Funeral> funeral) {
		try(Workbook workbook = new XSSFWorkbook()){
			Sheet sheet = workbook.createSheet("Contacts");
			
			Row row = sheet.createRow(0);
			
			// Define header cell style
	        CellStyle headerCellStyle = workbook.createCellStyle();
	        headerCellStyle.setFillForegroundColor(IndexedColors.LIGHT_GREEN.getIndex());
	        headerCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	        
	        // Creating header cells 
	        Cell cell = row.createCell(0);
	        cell.setCellValue("ID");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(1);
	        cell.setCellValue("Address");
	        cell.setCellStyle(headerCellStyle);
	
	        cell = row.createCell(2);
	        cell.setCellValue("Created_Date");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(3);
	        cell.setCellValue("DOB");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(4);
	        cell.setCellValue("Email");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(5);
	        cell.setCellValue("FirstName");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(6);
	        cell.setCellValue("Funeral Type");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(7);
	        cell.setCellValue("IP");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(8);
	        cell.setCellValue("Last Name");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(9);
	        cell.setCellValue("Latitude");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(10);
	        cell.setCellValue("Longitude");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(11);
	        cell.setCellValue("Phone Number");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(12);
	        cell.setCellValue("Post code");
	        cell.setCellStyle(headerCellStyle);
	        
	        cell = row.createCell(13);
	        cell.setCellValue("Zip code");
	        cell.setCellStyle(headerCellStyle);
	        
	        // Creating data rows for each Fields
	        for(int i = 0; i < funeral.size(); i++) {
	        	Row dataRow = sheet.createRow(i + 1);
	        	dataRow.createCell(0).setCellValue(funeral.get(i).getId());
	        	dataRow.createCell(1).setCellValue(funeral.get(i).getAddress());
	        	dataRow.createCell(2).setCellValue(funeral.get(i).getCreated_at());
	        	dataRow.createCell(3).setCellValue(funeral.get(i).getDob());
	        	dataRow.createCell(4).setCellValue(funeral.get(i).getEmail());
	        	dataRow.createCell(5).setCellValue(funeral.get(i).getFirst_name());
	        	dataRow.createCell(6).setCellValue(funeral.get(i).getFuneralType());
	        	dataRow.createCell(7).setCellValue(funeral.get(i).getIp());
	        	dataRow.createCell(8).setCellValue(funeral.get(i).getLast_name());
	        	dataRow.createCell(9).setCellValue(funeral.get(i).getLatitude());
	        	dataRow.createCell(10).setCellValue(funeral.get(i).getLongitude());
	        	dataRow.createCell(11).setCellValue(funeral.get(i).getMobile());
	        	dataRow.createCell(12).setCellValue(funeral.get(i).getPostCode());
	        	dataRow.createCell(13).setCellValue(funeral.get(i).getZipcode());
	        }
	
	        // Making size of column auto resize to fit with data
	        sheet.autoSizeColumn(0);
	        sheet.autoSizeColumn(1);
	        sheet.autoSizeColumn(2);
	        sheet.autoSizeColumn(3);
	        sheet.autoSizeColumn(4);
	        sheet.autoSizeColumn(5);
	        sheet.autoSizeColumn(6);
	        sheet.autoSizeColumn(7);
	        sheet.autoSizeColumn(8);
	        sheet.autoSizeColumn(9);
	        sheet.autoSizeColumn(10);
	        sheet.autoSizeColumn(11);
	        sheet.autoSizeColumn(12);
	        sheet.autoSizeColumn(13);
	        
	        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	        workbook.write(outputStream);
	        return new ByteArrayInputStream(outputStream.toByteArray());
		} catch (IOException ex) {
			logger.error("Error during export Excel file", ex);
			return null;
		}
	}

}
