package com.funeral.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funeral.main.model.Funeral;
import com.funeral.main.repository.FuneralRepository;
import com.funeral.main.utility.RequestServiceImpl;
import com.funeral.main.utility.Utility;

import io.ipgeolocation.api.Geolocation;
import io.ipgeolocation.api.GeolocationParams;
import io.ipgeolocation.api.IPGeolocationAPI;

@Controller
public class FuneralController {
	public static final String geoLocationApi_Key = "e56d46b3344b4c7189c05675747b8dcc";
	@Autowired
	private FuneralRepository funeralRepository;
	@GetMapping("/funeral")
	public String showFormPage(Model model)
	{
		model.addAttribute("funeral", new Funeral());
		return "funeral";
	}
	
	@PostMapping("/funeral")
	public String saveFuneralFormPage(@ModelAttribute("funeral") Funeral funeral,@RequestParam("address") String address,@RequestParam("funeralType") String ftype,HttpServletRequest httpServletRequest)
	{
	  if(ftype!=null)
	  {
		  if(ftype.equals("1"))
		  {
			  funeral.setFuneralType("Burial");
		  }
		  else
		  {
			  funeral.setFuneralType("Cremation");
		  }
	  }
	Utility utility=new Utility();
	Funeral validFuneral=utility.getGeoLocation(funeral, httpServletRequest);   
	if(validFuneral!=null)
	{
		funeral.setDob(funeral.getDay()+funeral.getMonth()+funeral.getYear());
		Funeral savedFuneral= funeralRepository.save(validFuneral);
		if(savedFuneral!=null)
		{
			return "thanku";
		}
	}
		
		
		
		return null;
	}
	
	@GetMapping("/address")
	@ResponseBody
	public String getaddress(@RequestParam("id") String id,HttpServletRequest httpServletRequest)
	{
		RequestServiceImpl requestServiceImpl=new RequestServiceImpl();
		String address="";
		IPGeolocationAPI api = new IPGeolocationAPI(geoLocationApi_Key);
		GeolocationParams geoParams = new GeolocationParams();
		Geolocation geolocation = api.getGeolocation(geoParams);
		geoParams.setIncludeSecurity(true);
		geoParams.setFields("geo,time_zone,currency");
		String ip=requestServiceImpl.getClientIp(httpServletRequest);
		String longitude=geolocation.getLongitude();
		String latitude=geolocation.getLatitude();
		String countryCode=geolocation.getCountryCode2();
		String zipcode=geolocation.getZipCode();
		String dist=geolocation.getDistrict();
		String stateProviance=geolocation.getStateProvince();
		address="Address [ip=" + ip + ", longitude=" + longitude + ", latitude=" + latitude + ", countryCode=" + countryCode
				+ ", zipcode=" + zipcode + ", dist=" + dist + ", stateProviance=" + stateProviance+"]";
		return address;
	}
	
	@GetMapping("/privacy")
	public String showPrivacyPage()
	{
		return "privacy";
	}
}
