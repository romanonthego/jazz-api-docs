## entertaimen card
http://take.ms/pBaIj

    $entertaimen_card:
      #...
      object:
        id: {type: 'number', required: true}
        geo_prefix: {type: 'string', required: true, empty: true}
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
        prices: 
          [
            item: {type: '$price'}
          ]