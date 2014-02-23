var myApp = angular.module('dinnerMovieApp', []);

//==================================================================================================
// CONTROLLERS
//==================================================================================================
myApp.controller('dinnerMovieCtrl', function($scope, $http){
  $scope.controllerTest = 'Controller working, yay!';
  $http.get('/restaurants/sfo')
    .then(function(res){
      $scope.restaurants = res.data;
     });
});

//==================================================================================================
// DIRECTIVE - dinner-movie-dir test controller
//==================================================================================================
myApp.directive('dinnerMovieDir', function(){
  return {
    restrict: 'AE',
  link: function(scope, element, attrs){
    scope.directiveTest = "directive working, yay!";
  }
  };
});

//==================================================================================================
// DIRECTIVE - geo-location-dir attached to body to find user device location
//==================================================================================================
myApp.directive('geoLocationDir', function(){
  return {
    restrict: 'AE',
  link: function(scope, element, attrs){
    $(function(){
      // NEED to fix this so that this gets populated without clicking:
      $('p').on('click', function(){
        getLocation();
      })
      // If navigator.geolocation exist, sePosition function gets called
      // otherwise, askPosition function is executed
      var getLocation = function(){
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(setPosition, askPosition);
        }
      }
      var setPosition = function(position){
        console.log("position is: ", position);
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        // //randomize lat, lng for development only
        // lat += Math.random() / 100;
        // lng += Math.random() / 100;
        var latlng = lat + "," + lng;
        // $.cookie("location", latlng, {expires: 20/(24*60)})
        getAddress(lat, lng) //toFixed(5) up to 5 sigfigs
      }
      var askPosition = function(position){
        address = prompt("Please enter your location.")
      }
      var getAddress = function(lat, lng) {
        var latlng = lat + "," + lng;
        // if($.cookie("address") === undefined && $.cookie("city") === undefined){
        var request = $.ajax({
          type: "GET",
            url: "http://maps.googleapis.com/maps/api/geocode/json",
            data: {latlng: latlng, sensor: true},
            dataType: 'json',
            success: function (response) {
              var city = 'not found';
              var address = 'not found';
              if(response['results'].length == 0) {
                console.log("No geocode results");
              } else {
                console.log("response is: ", response);
                address = response["results"][0]["formatted_address"];
                street = response["results"][0]["address_components"][0]["long_name"] + ' ' + response["results"][0]["address_components"][1]["long_name"];
                city = response["results"][0]["address_components"][3]["long_name"];
                state = response["results"][0]["address_components"][5]["long_name"];
                if (response["results"][0]["address_components"][7] != undefined){
                  zip = response["results"][0]["address_components"][7]["long_name"];
                }else{
                  zip = response["results"][0]["address_components"][6]["long_name"];
                }
              };
              console.log('ajax get request');
              console.log("address", address)
                displayLocation(lat, lng, address, street, city, state, zip);  //perform callback
            }
        }); //end ajax request to google map api
      }; //end getAddress function
      var displayLocation = function(lat, lng, address, street, city, state, zip) {
        console.log("the address is ", address)
          la = '<li id="city">'+city+'</li>'
          $('#location').append(la);
        $('#location').append('<li id="lat">'+lat+'</li>');
        $('#location').append('<li id="lng">'+lng+'</li>');
        $('#location').append('<li id="address">'+address+'</li>');
        $('#current_location').append('Your device indicates that you are currently located at: ' + address);
        $('#current_location').append('<button id="restaurant">Where\'s my Nearest Eats?!</button>')
          // $('#current_lat').append(typeof(lat));
          $('#current_lat').append('Latitude: ' + parseFloat(lat).toFixed(5));
        $('#current_lng').append('Longitude: ' + parseFloat(lng).toFixed(5));

      }
      // get nearest restaurant
      $('body').on('click', '#restaurant', function(){
        console.log("you've clicked the nearest restaurant.");
        expediaHotelSearch(lat, lng);
      });
      // Expedia Hotel API Call
      var expediaHotelSearch = function(lat, lng) {
      }
      });//end document.ready()
    }
  };
});
