const express = require('express');
const app = express();
const port = 3000;
 
// new API route: GET /users, returning a list of users
app.get('/data/2.5/weather', (request, response) => {
  response.json({
    "coord": {
      "lon": -123.56,
      "lat": 44.56
    },
    "weather": [
      {
        "id": 800,
        "main": "Clear",
        "description": "clear sky",
        "icon": "01d"
      }
    ],
    "base": "stations",
    "main": {
      "temp": 286.86,
      "feels_like": 286.09,
      "temp_min": 285.3,
      "temp_max": 289.3,
      "pressure": 1019,
      "humidity": 69,
      "sea_level": 1019,
      "grnd_level": 977
    },
    "visibility": 10000,
    "wind": {
      "speed": 2.71,
      "deg": 51,
      "gust": 4.98
    },
    "clouds": {
      "all": 5
    },
    "dt": 1664561528,
    "sys": {
      "type": 2,
      "id": 2004457,
      "country": "US",
      "sunrise": 1664547054,
      "sunset": 1664589438
    },
    "timezone": -25200,
    "id": 5713677,
    "name": "Benton",
    "cod": 200
  });
});
 
// DELETE user
app.delete('/users', (request, response) => {
  response.json({ result: 'success' });
});
 
app.listen(3000, () => {});


