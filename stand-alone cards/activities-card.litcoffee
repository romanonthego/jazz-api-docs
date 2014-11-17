## activities card
http://take.ms/RIgA2

    $activities_card:
      # ..
      object:
        # будет использован для постраения ссылки в заголовке и в кнопке
        # на самом деле name но для единообразия
        id: {type: 'string', required: true}
        geo_prefix: {type: 'string', required: true}
        # no slug
      title: {type: 'string', required: true}
      content:
        # можно передать картинку - будет использована вместо бэкграунда
        cover_image: {type: 'string', format: 'url'}
        activities: 
          [
            item:
              title: {type: 'string', required: true}
              id: {type: 'string', required: true}
              geo_prefix: {type: 'string', required: true}
          ]

