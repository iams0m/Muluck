package com.multi.muluck.business;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class MapsController {
	
	@PostMapping("/saveLatLngToDB")
	public void saveLatLngToDB(@RequestBody MapsVO mapsvo) {
		double latitude =mapsvo.getLatitude();
		double longittude=mapsvo.getLongitude();
	}
}
