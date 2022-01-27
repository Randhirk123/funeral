package com.funeral.main.service;

import java.io.ByteArrayInputStream;
import java.util.List;

import org.springframework.stereotype.Service;

import com.funeral.main.model.Funeral;

@Service
public interface ExcelFileService {

	ByteArrayInputStream export(List<Funeral> funeral);
}
