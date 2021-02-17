// Map mit Leaflet

	var map;
	var allPins = new Array;
	
	function fetchJson(useQuestionMark){
		var url = window.location;
		
		if(useQuestionMark){
			url+='?';
		} else {
			url+='&';
		}
		
		url = url+'format=json&down=false';
		
		var json = $.getJSON(url);
		var parsedJson = JSON.parse(json);
		
		return parsedJson;
	}
	
	
	
	function getPlace(map){
		for (var i = 0;i < eventsJson.length; i++){
			var currentevent = eventsJson[i];
			var currentplaceID = currentevent.EreignisOrt;
			var currentplace = getObjectByID(placesJson, currentplaceID);
			if(currentplace["@Marker"]=="punkt"){
				var mapPin =  L.marker(L.latLng(getCoords(currentplace)), {id: getID(currentevent), title: getName(currentplace)});
			}
			else {
				var mapPin = L.circle(L.latLng(getCoords(currentplace)), {id: getID(currentevent), title: getName(currentplace), radius:70, color:'#0099FF'});
			}
			allPins.push(mapPin);
			mapPin.addTo(map);
			mapPin.bindPopup('<span style ="font-size:16pt;text-shadow:none">'+getName(currentplace)+'</span>');
			mapPin.on('click', clickZoom);
		}
	}
	
	
	function initializeMap(useQuestionMark) {
		
		/*map = L.map('mapBox', {crs: L.CRS.Simple, draggable: false, zoomControl: true, maxZoom: 2, minZoom: -3,});
		var bounds= [[0,0], [6112, 5376]];
		var img = L.imageOverlay('../imgs/karte.jpg', bounds).addTo(map);
		map.fitBounds(bounds);*/
		//initializeMarkers(useQuestionMark);
		
		/*map = L.map('mapBox').setView([51.505, -0.09], 13);
		L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
			maxZoom: 18,
			id: 'mapbox/streets-v11',
			tileSize: 512,
			zoomOffset: -1,
			accessToken: 'your.mapbox.access.token'
		}).addTo(mymap);*/
		document.getElementById('mapBox').innerHTML = 'Hier sollte eine Karte erscheinen!';
	}
	
	function clickZoom(e) {
		map.setView(e.target.getLatLng(),0);
		
		synchronizeData('map', e.target.options.id);
	}
	
	function getID(currentplace) {
		var id = currentplace["@ID"];
		return id;
	}

	function getName(currentplace) {
		var name = currentplace.Name;
		return name;
	}

	function getCoords(currentplace) {
		var array = new Array;
		var lat = currentplace.coords.lat;
		var lng = currentplace.coords["long"];
		array.push(6112-Number(lat));
		array.push(Number(lng));
		return array;
	}

	function setMap(eventID){
		var eventmarker;
		for(var i = 0; i<allPins.length; i++){
			var currentpin = allPins[i];
			if(currentpin.options.id == eventID){
				eventmarker=currentpin;
			break;
			}
		}
		eventmarker.openPopup();
		map.setView(eventmarker.getLatLng(),0);
	}