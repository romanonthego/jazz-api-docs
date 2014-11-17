## locations card
http://take.ms/Av7N6

    $locations_card:
      # ..
      object:
        id: {type: 'string', required: true}
        geo_prefix: {type: 'string', required: true}
        # no slug
      title: {type: 'string', required: true}
      content:
        # можно передать картинку - будет использована вместо бэкграунда
        cover_image: {type: 'string', format: 'url'}
        # тут немного сложнее
        # передается массив стран - с флагами
        # у каждой страны можно получиь опциональный массив с регионами/городами
        locations: 
          [
            item:
              title: {type: 'string', required: true}
              id: {type: 'string', required: true}
              geo_prefix: {type: 'string', required: true}
              flag: {type: 'string', fallback: @id}

              regions:
                [
                  item:
                    title: {type: 'string', required: true}
                    id: {type: 'string', required: true}
                    geo_prefix: {type: 'string', required: true}
                ]
          ]

