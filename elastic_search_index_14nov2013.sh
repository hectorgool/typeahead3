
curl -X DELETE localhost:9200/geonames2



curl -X PUT "http://localhost:9200/geonames2" -d '
{
    "settings": {
        "index": {
            "analysis": {
                "analyzer": {
                    "autocomplete": {
                        "tokenizer": "whitespace",
                        "filter": [
                            "lowercase",
                            "engram"
                        ]
                    }
                },
                "filter": {
                    "engram": {
                        "type": "edgeNGram",
                        "min_gram": 1,
                        "max_gram": 10
                    }
                }
            }
        }
    },
    "mappings": {
        "geoname": {
            "properties": {
                "name": {
                    "type": "multi_field",
                    "fields": {
                        "name": {
                            "type": "string",
                            "index": "not_analyzed",
                            "store": "yes"
                        },
                        "autocomplete": {
                            "type": "string",
                            "index_analyzer": "autocomplete",
                            "index": "analyzed",
                            "search_analyzer": "standard"
                        }
                    }
                },
		"location" : { "type" : "geo_point", "store":"yes", "index":"analyzed" }
            }
        }
    }
}
'


    
curl -X PUT "http://localhost:9200/geonames2/geoname/1555414" -d '
  {
    "name": "Santa Fe",
    "location" : "29.01048, -101.26557"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/1818178" -d '
  {
    "name": "Wardlow",
    "location" : "32.55064, -115.33943"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/1818179" -d '
  {
    "name": "Los Carapilas",
    "location" : "32.01389, -115.01611"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/1818180" -d '
  {
    "name": "Aguaje del Laretto",
    "location" : "32.53306, -115.75139"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/1948754" -d '
  {
    "name": "Cañada El Oro",
    "location" : "30.8973, -110.75184"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/2593121" -d '
  {
    "name": "Paso Salinas",
    "location" : "18.90224, -95.94041"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3411918" -d '
  {
    "name": "Chun Cedro",
    "location" : "20.1542, -89.78498"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482868" -d '
  {
    "name": "Tres Marías",
    "location" : "22.48036, -98.01065"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482869" -d '
  {
    "name": "Lorenzo del Real",
    "location" : "22.51667, -97.91667"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482870" -d '
  {
    "name": "El Estero",
    "location" : "22.65685, -98.00748"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482871" -d '
  {
    "name": "Teresa",
    "location" : "22.48804, -97.98885"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482872" -d '
  {
    "name": "Benito Juárez",
    "location" : "22.49068, -98.02647"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482873" -d '
  {
    "name": "Maclovio Herrera",
    "location" : "22.50076, -98.08459"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482874" -d '
  {
    "name": "Estación El Esfuerzo",
    "location" : "22.48333, -98.08333"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482875" -d '
  {
    "name": "Estación San Carlitos",
    "location" : "22.46667, -98.06667"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482876" -d '
  {
    "name": "Cervantes",
    "location" : "22.44675, -98.05398"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482877" -d '
  {
    "name": "Tres de Mayo",
    "location" : "22.40637, -98.0224"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482878" -d '
  {
    "name": "La Colonia",
    "location" : "22.43748, -98.01684"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482879" -d '
  {
    "name": "El Fuerte",
    "location" : "22.42649, -98.08051"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482880" -d '
  {
    "name": "Laguna La Tortuga",
    "location" : "22.34481, -98.12635"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482881" -d '
  {
    "name": "Mata de Labra",
    "location" : "22.44711, -98.1242"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482882" -d '
  {
    "name": "Laguna la Josesito",
    "location" : "22.48762, -98.2273"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482883" -d '
  {
    "name": "Vuelta de las Yeguas",
    "location" : "22.48017, -98.23893"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482884" -d '
  {
    "name": "Esteros",
    "location" : "22.52031, -98.12594"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482885" -d '
  {
    "name": "La Laguna",
    "location" : "22.5203, -98.18905"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482886" -d '
  {
    "name": "Cuauhtémoc",
    "location" : "22.545, -98.15053"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482887" -d '
  {
    "name": "Las Palmas",
    "location" : "22.5361, -98.12584"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482888" -d '
  {
    "name": "Estación Los Plátanos",
    "location" : "22.6, -98.2"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482889" -d '
  {
    "name": "Paso de Mora",
    "location" : "22.6346, -98.07176"
  }
'
        
curl -X PUT "http://localhost:9200/geonames2/geoname/3482890" -d '
  {
    "name": "Santa Gertrudis",
    "location" : "22.62695, -98.21271"
  }
'
    