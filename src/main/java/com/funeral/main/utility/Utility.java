package com.funeral.main.utility;

import javax.servlet.http.HttpServletRequest;

import com.funeral.main.model.Funeral;

import io.ipgeolocation.api.Geolocation;
import io.ipgeolocation.api.GeolocationParams;
import io.ipgeolocation.api.IPGeolocationAPI;

public class Utility {

	public static final String geoLocationApi_Key = "e56d46b3344b4c7189c05675747b8dcc";

	RequestServiceImpl requestServiceImpl=new RequestServiceImpl();
	public  Funeral getGeoLocation(Funeral funeral,HttpServletRequest httpServletRequest) {

		IPGeolocationAPI api = new IPGeolocationAPI(geoLocationApi_Key);
		GeolocationParams geoParams = new GeolocationParams();
		/*
		 * geoParams.setIPAddress(requestServiceImpl.getClientIp(httpServletRequest));
		 */
		Geolocation geolocation = api.getGeolocation(geoParams);
		geoParams.setIncludeSecurity(true);
		geoParams.setFields("geo,time_zone,currency");
		funeral.setIp(requestServiceImpl.getClientIp(httpServletRequest));
		funeral.setLatitude(geolocation.getLatitude());
		funeral.setLongitude(geolocation.getLongitude());
		funeral.setZipcode(geolocation.getZipCode());
		return funeral;
		
	}
}
