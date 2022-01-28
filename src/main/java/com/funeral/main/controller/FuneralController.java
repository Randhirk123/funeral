package com.funeral.main.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.funeral.main.model.Funeral;
import com.funeral.main.repository.FuneralRepository;
import com.funeral.main.utility.Utility;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

@Controller
public class FuneralController {
	public static final String geoLocationApi_Key = "e56d46b3344b4c7189c05675747b8dcc";

	public static final String api_key = "d484a88ea0451dd76cdc12f208ab7f57";

	@Autowired
	private FuneralRepository funeralRepository;

	@GetMapping("/funeral")
	public String showFormPage(Model model) {
		model.addAttribute("funeral", new Funeral());
		return "funeral";
	}

	@PostMapping("/funeral")
	public String saveFuneralFormPage(@ModelAttribute("funeral") Funeral funeral, @RequestParam("funeralType") String ftype,
			HttpServletRequest httpServletRequest) {
		if (ftype != null) {
			if (ftype.equals("1")) {
				funeral.setFuneralType("Burial");
			} else {
				funeral.setFuneralType("Cremation");
			}
		}
		Utility utility = new Utility();
		Funeral validFuneral = utility.getGeoLocation(funeral, httpServletRequest);
		if (validFuneral != null) {
			funeral.setDob(funeral.getDay() + funeral.getMonth() + funeral.getYear());
			Funeral savedFuneral = funeralRepository.save(validFuneral);
			if (savedFuneral != null) {
				return "thanku";
			}
		}

		return null;
	}

	@GetMapping("/address")
	@ResponseBody
	public Map<String, String> getaddress(@RequestParam("id") String id, HttpServletRequest httpServletRequest)
			throws IOException {
		Map<String,String> filterMap=new HashedMap<String, String>();
		final String uri = "https://api.postcodes.io/postcodes/"+id;

		URL getUrl = new URL(uri);
		HttpURLConnection conection = (HttpURLConnection) getUrl.openConnection();
		conection.setRequestMethod("GET");
		int responseCode = conection.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(conection.getInputStream()));
            StringBuffer jsonResponseData = new StringBuffer();
            String readLine = null;
            
            // Append response line by line
            while ((readLine = in.readLine()) != null) {
                jsonResponseData.append(readLine);
            } 
            
            in.close();
            // Print result in string format
            System.out.println("JSON String Data " + jsonResponseData.toString());
            ObjectMapper mapper = new ObjectMapper();
            JsonNode tree = mapper.readTree(jsonResponseData.toString());
            filterMap.put("country", tree.get("result").get("country").asText());
            filterMap.put("nhs_ha", tree.get("result").get("nhs_ha").asText());
            filterMap.put("primary_care_trust", tree.get("result").get("primary_care_trust").asText());
            filterMap.put("lsoa", tree.get("result").get("lsoa").asText());
            filterMap.put("msoa", tree.get("result").get("msoa").asText());
            filterMap.put("parliamentary_constituency", tree.get("result").get("parliamentary_constituency").asText());
            filterMap.put("admin_ward", tree.get("result").get("admin_ward").asText());
            filterMap.put("ccg", tree.get("result").get("ccg").asText());
            filterMap.put("nuts", tree.get("result").get("nuts").asText());
            
            
           
            
        } else {
            System.out.println(responseCode);
        }
		return filterMap;
	}

	@GetMapping("/privacy")
	public String showPrivacyPage() {
		return "privacy";
	}
}
