## title card
Карта-заголовок страниц. Типа http://take.ms/PXu47

    $title_card:
      # ..
      content:
        #TODO peoples: {type: 'string'}
        #TODO dates: {type: 'string'}
        rating: {type: 'number'}
        # массив локаций к которым относится тур/или другой объект
        # объединяются на клиенте
        # ['Норвегия', 'Швеция'] => "Норвегия и Швеция"
        locations: 
          [
            item: {type: 'string'}
          ]
        text: {type: 'string', required: true, format: 'html'}
        photos:
          [
            item: {type: "$photo"}
          ]