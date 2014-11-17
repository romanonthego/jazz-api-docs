## project card
http://take.ms/RGT5z

    $project_card:
      #..
      object:
        # TODO подумать - передавать имя или передавать ID
        id: {type: 'number', required: true}
        # geo_prefix - можно передать, но не требуется
        geo_prefix: {type: 'string'}
        slug: {type: 'string', required: true, empty: false}
      
      content:
        special_tags: 
          [
            item: {type: 'string'}
          ]
        photos:
          [
            item: {type: '$photo', required: true}
          ]
        specs:
          peoples: 
            min: {type: 'number'}
            max: {type: 'number'}
            exact: {type: 'number'}
            # даты, но только те которые мы отображаем на карте (ближайшие/выгодные)
          dates:
            departure_date: {type: 'date', required: true}
            return_date: {type: 'date', required: true}
            duration: {type: 'number'}
          rating: {type: 'number'}
          # TODO: accomodation:
          # TODO: addtional tags
        description: {type: 'string', required: true}
        
        # http://take.ms/D6VH3
        # в маленьких картах не рендерится поэтому передается отдельно
        feature_list: 
          [
            item: {type: 'string', required: 'true'}
          ]
        prices: 
          [
            item: {type: '$price'}
          ]