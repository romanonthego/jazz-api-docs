## inline object
  Объект прицепляемый как "инлайновый" (прошу прощения за тавтологию)
  Выглядит вот так - http://take.ms/lq21q
  или так: http://take.ms/kPSXM

  тут задачка посложнее - показать общий интерфей для таких объектов


    $inline_object:
      # ...
      title: {type: 'string', required: true}

      # для объектов (не фотогаллерей и пр) - прилагать object как для stand-alone card
      object:
        # ...
      content:
        photo: {type: 'string', required: true, format: 'url'}
        description: {type: 'string', required: true}


  для всевозможных туров, отелей, коттеджей, статей - просто передавать как stand-alone карту
    $tour_card:
      #...
      object:
        id: {type: 'number', required: true}
        geo_prefix: {type: 'string', required: true, empty: true}
        slug: {type: 'string', required: true, empty: false}
      
      content:
        #...