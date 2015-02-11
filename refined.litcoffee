#Итак.
основные концепции:

## Основы
1. Все наименования в snake_case
2. Будет дублирование, особенно это касается object, но оно нужно
3. 

## 1. Страница:

любая контентная страница, собирается просто
состоит из следующих частей:
1. мета-информации
2. контента
3. описание объекта
пример: http://jazz-api.romanonthego.rocks/locations/norway


      $page: {
        id: 'numeric id',
        type: 'article|location|etc..'
        title: 'title'
        # формальное описание обеъекта, используется для построения ссылки.
        # type используется для рендеринга, object - для навигации и прочего
        object: {
          id: 12 # если есть цифровой id
          name: 'norway' # если есть string id - например у локаций
          type: 'article'
          geo_prefix: 'norway/oslo' # без открывающего и закрывающего слэша
        },
        # мета-информация, будет передана в разные мета-теги
        meta_info: {
          title: "Самый лучший тур",
          description: "Описание самого лучшего тура",
          image: 'http://....',
          
          open_graph: {
            title: "Самый лучший тур для facebook"
          },
          schema_org: {
            
          },
          twitter: {

          }
        },
        content: {
          main: ['...'],
          aside: ['...']
        }
      },

2. Страница объекта который продается:

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

теперь отдельные карты:
1. title_card
* заголовок
* текст/ html_content
* фотографии
* локации к слайдшоу


    {
      "type": "title",
      "id": "1213165504",
      "title": "Марокко",
      "content": {
        "title": "Марокко",
        "rating": 4.2,
        "locations": [
          {
            "title": "Марокко",
            "name": "marocco",
            "geo_prefix": ""
          },
          {
            "title": "Рабат",
            "name": "rabat",
            "geo_prefix": "/marocco"
          },
          {
            "title": "Рабат",
            "name": "rabat",
            "geo_prefix": "/marocco"
          }
        ],
        "text": "Repellat rerum eveniet distinctio dolore dolor ut provident placeat error ut magni ipsa deserunt suscipit ipsum architecto quia eum adipisci ullam dolores laborum ut commodi.",
        "photos": [
          {
            "url": "http://admin.gde.travel/images/JazzTour/zphf2bw7kf.jpg",
            "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
            "title": "photo title (optional)",
            "alt": "photo alt (optional)"
          },
          {
            "url": "http://admin.gde.travel/images/JazzTour/qi8fykmir4.jpg",
            "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
            "title": "photo title (optional)",
            "alt": "photo alt (optional)"
          },
          {
            "url": "http://admin.gde.travel/images/JazzTour/krfvxdemi1.jpg",
            "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
            "title": "photo title (optional)",
            "alt": "photo alt (optional)"
          }
        ]
      }
    }


2. content_card

Самая общая карта
Фактически - итератор секций
поддерживаемые типы:
text (с опциональным подзаголовком, оборачивается в <p></p>),
html_content (вставляется как есть),
photo (одно фото с заголовком),
gallery (галлерея с описанием),
slideshow (слайдшоу с описанием),
video (видео - provider:"youtube|vimeo" + id, опционально с описанием),


    "type": "content",
        "id": "2714166743",
        "title": "5 причин отправиться на отдых в Норвегию",
        "navigation": true,
        "content": {
          "sections": [
            {
              "type": "text",
              "title": "Фьорды Норвегии",
              "text": "Фьорды – заливы в скалах ледникового происхождения, изумительные по форме, масштабности и красоте. Норвежские фьорды возглавляют список объектов Всемирного наследия и являются туристическим направлением №1 в обозрении «National Geographic».\nУмеренный климат, невероятно красивая девственная природа, чистейшая экология и спокойный ритм жизни в Норвегии создают идеальные условия для отдыха и восстановления жизненных сил. При этом вдали от цивилизации в колоритных поселках прямо на берегу фьорда в окружении живописных пейзажей можно остановиться в первоклассных четырех- и пятизвездочных отелях с самым высоким уровнем сервиса, что делает отдых еще более приятным."
            },
            {
              "type": "photo",
              "url": "http://public.gde.travel/images/JazzTour/thumbnail/slider/6sqh9z1uxo.jpg",
              "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
              "title": "Мыс Нордкап в лучах полуночного солнца, Северная Норвегия"
            },
            {
              "type": "text",
              "title": "Фьорды Норвегии",
              "text": "Фьорды – заливы в скалах ледникового происхождения, изумительные по форме, масштабности и красоте. Норвежские фьорды возглавляют список объектов Всемирного наследия и являются туристическим направлением №1 в обозрении «National Geographic».\nУмеренный климат, невероятно красивая девственная природа, чистейшая экология и спокойный ритм жизни в Норвегии создают идеальные условия для отдыха и восстановления жизненных сил. При этом вдали от цивилизации в колоритных поселках прямо на берегу фьорда в окружении живописных пейзажей можно остановиться в первоклассных четырех- и пятизвездочных отелях с самым высоким уровнем сервиса, что делает отдых еще более приятным."
            },
            {
              "type": "slideshow",
              "photos": [
                

                {
                  "url": "http://admin.gde.travel/images/JazzTour/krfvxdemi1.jpg",
                  "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
                  "title": "photo title (optional)",
                  "alt": "photo alt (optional)"
                },
                {
                  "url": "http://admin.gde.travel/images/JazzTour/krfvxdemi1.jpg",
                  "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
                  "title": "photo title (optional)",
                  "alt": "photo alt (optional)"
                },
                {
                  "url": "http://admin.gde.travel/images/JazzTour/krfvxdemi1.jpg",
                  "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
                  "title": "photo title (optional)",
                  "alt": "photo alt (optional)"
                },
                {
                  "url": "http://admin.gde.travel/images/JazzTour/krfvxdemi1.jpg",
                  "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
                  "title": "photo title (optional)",
                  "alt": "photo alt (optional)"
                },
                {
                  "url": "http://admin.gde.travel/images/JazzTour/krfvxdemi1.jpg",
                  "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
                  "title": "photo title (optional)",
                  "alt": "photo alt (optional)"
                }
              ],
              "description": "Eum et enim facere recusandae necessitatibus voluptatibus tempora est expedita at culpa sed repellendus quo voluptas ut nam natus veniam et aut ipsa est consectetur et ad dolorem.",
              "title": "Северная Норвегия, рыбалка"
            },
            {
              "type": "text",
              "title": "Фьорды Норвегии",
              "text": "Фьорды – заливы в скалах ледникового происхождения, изумительные по форме, масштабности и красоте. Норвежские фьорды возглавляют список объектов Всемирного наследия и являются туристическим направлением №1 в обозрении «National Geographic».\nУмеренный климат, невероятно красивая девственная природа, чистейшая экология и спокойный ритм жизни в Норвегии создают идеальные условия для отдыха и восстановления жизненных сил. При этом вдали от цивилизации в колоритных поселках прямо на берегу фьорда в окружении живописных пейзажей можно остановиться в первоклассных четырех- и пятизвездочных отелях с самым высоким уровнем сервиса, что делает отдых еще более приятным."
            },
            {
              "type": "gallery",
              "photos": [
                {
                  "url": "http://admin.gde.travel/images/JazzTour/qi8fykmir4.jpg",
                  "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
                  "title": "photo title (optional)",
                  "alt": "photo alt (optional)"
                },
                {
                  "url": "http://admin.gde.travel/images/JazzTour/qi8fykmir4.jpg",
                  "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
                  "title": "photo title (optional)",
                  "alt": "photo alt (optional)"
                },
                {
                  "url": "http://admin.gde.travel/images/JazzTour/qi8fykmir4.jpg",
                  "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
                  "title": "photo title (optional)",
                  "alt": "photo alt (optional)"
                },
                {
                  "url": "http://admin.gde.travel/images/JazzTour/qi8fykmir4.jpg",
                  "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
                  "title": "photo title (optional)",
                  "alt": "photo alt (optional)"
                },
                {
                  "url": "http://admin.gde.travel/images/JazzTour/qi8fykmir4.jpg",
                  "thumb": "http://public.gde.travel/images/JazzTour/thumbnail/content/p67i97mjpq.jpg",
                  "title": "photo title (optional)",
                  "alt": "photo alt (optional)"
                }
              ],
              "description": "Unde est iusto est suscipit quidem vel non porro temporibus voluptatem magnam ut quia dolor earum distinctio debitis nemo nulla occaecati eveniet fuga consequatur id minus perferendis sit.",
              "title": "Лофотенские острова, Норвегия"
            }
          ]
        }


3. single_object

ссылка на один объект. обязательно наличие object
контент не обязателен, может быть и тупо ссылка
если есть контент - там те же секции, тех же видов что и контент


    {
      "type": "single_object",
        "id": "3724202363",
        "title": "Виза",
        "object": {
          "type": "article",
          "id": 68,
          "geo_prefix": "marocco/rabat",
          "slug": "norway-visa"
        },
        "content": {
          "sections": [
            {
              "type": "text",
              "text": "Sed reprehenderit maiores qui iure beatae dolorem accusamus a ut asperiores et nihil saepe sit molestiae consequatur ipsum sunt ex aut repellat enim aspernatur aut velit."
            }
          ]
        }
    }

    #"пустой" объект - будет выглядеть вот так - http://take.ms/6JMmo

    {
      "type": "single_object",
      "id": "7636478356",
      "title": "Погода в норвегии",
      "object": {
        "type": "article",
        "id": 27,
        "geo_prefix": "marocco/rabat",
        "slug": "weather-in-norway"
      }
    }

4. list_of_objects

список объектов.
Отмечаю отдельно что они могут быть и разных видов, но логичнее что бы были одного.
опционально можно добавить ссылку на список (список туров, отелей и прочего.)


    {
      type: 'list_of_objects',
      id: id,
      title: 'Что почитать про Норвегию',
      content: {
        objects: [
          {
            type: 'article',
            title: 'Виза в Норвегию',
            object: {
              type: 'article',
              id: 12,
              slug: 'some-awesome-article'
            },
            content: {
              description: description,
              photos: [
                photo
              ]
            }
          }
        ]*4
      }
    }

    # с сылкой на туры:
    {
      type: 'list_of_objects',
      id: id,
      title: 'Туры в Норвегию',
      content: {
        objects: [
          tour,
          tour,
          tour,
          tour 
        ],
        link_to_list: {
          type: 'tours',
          name: 'norway',
          title: 'Все туры в Норвегию',
          geo_prefix: 'europe/norway'
        }
      }
    }
