## services card
Карта, включено/не включено
http://take.ms/u0kIq

    $services_card:
      #..
      # включает два заголовка - для того что включено и что невключено
      # title будет проигнорирован
      included_title: {type: 'string', fallback: 'Включено в стоимость'}
      for_payment_title: {type: 'string', fallback: 'За отдельную плату'}
      # вроде бы простая карта но с заморочками
      # включает два массив - included и for_payment
      # который в свою очередь включает в себя катагории (подзаголовк и иконка)
      # и массив собственно услуг :)
      content:
        included:
          [
            item: 
              title: {type: 'string', required: true}
              icon: {type: 'string', required: true}
              services: 
                [
                  item: {type: 'string', required: true}
                ]
          ]
        for_payment:
          [
            item: 
              title: {type: 'string', required: true}
              icon: {type: 'string', required: true}
              services: 
                [
                  item: {type: 'string', required: true}
                ]
          ] 