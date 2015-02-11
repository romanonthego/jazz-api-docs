## 2. Страница объекта который продается:

отличается от предыдущей только тем, что aside может содержать 2 карты: booking, help
так же наличествует объект price

пример: http://jazz-api.romanonthego.rocks/tours/12

      $page: {
        id: 'numeric id',
        type: 'article|location|etc..'
        title: 'title'
        # формальное описание обеъекта, используется для построения ссылки.
        # type используется для рендеринга, object - для навигации и прочего
        object: {
          id: 12 # если есть цифровой id
          name: 'norway' # если есть string id - например у локаций
          type: 'tour'
          geo_prefix: 'norway/oslo' # без открывающего и закрывающего слэша
        },

      },
      # мета-информация, будет передана в разные мета-теги
      meta_info: {
        '...'
      },

      # цена - важна. 
      # тут важно - массив опций
      # массив цен с разными валютами
      # type, id что бы можно было получать цену от сервера потом
      price: {
        type: 'tour',
        id: 12,
        options: {
          dates: {
            departure_date: '23.10.2014',
            return_date: '30.10.2014',
          },
          peoples: {
            adults: 4,
            children: [1,12,12]
          }
        },
        prices: [
          {
            currency: 'rub',
            value: 122000
          },
          {
            currency: 'usd',
            value: 2000
          } 
        ]
      }
      content: {
        main: ['...'],
        aside: [{type: 'booking'}, {type: 'help'}]
      } 


Вобщем-то это все что нужно знать для того что бы понять принцип. будут еще часть вещей которые нужно уложить, но они уже ок
