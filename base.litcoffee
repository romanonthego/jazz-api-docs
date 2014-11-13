# Jazz Api


## Object structures
базовая структура объекта (рендерится на странице)

    tour:
      meta: {type: '$meta', required: true}
      content: {type: '$content', required: true} # of cards - will be rendered in order in main panel 
      aside: {type: '$aside'} # of cards - will be rendered at sidebar


## Meta structure
Мета информация об объекте. 
Будет, в основном включена в head страницы, а так же для валидации урла, и прочее

    $meta:
      # базовая мет-информация
      type: {type: 'string', required: true} # 'tour', 'hotel', 'location' etc
      title: {type: 'string', required: true, maxLength: 80}
      geo_prefix: {type: 'string', required: true} # даже если это пустая строка - все равно очень важно
      description: {type: 'string', required: true, maxLength: 160}
      keywords: {type: 'string', required: false}
      image: {type: 'string', required: true, format: 'url'} # абсолютный путь до картинки
      
      # массив цен в разных валютах
      prices: 
        [
            currency: {type: 'string', required: true}
            ammount: {type: 'number', req: true}
        ]
      # Инфа о которой нужно подумать
      ocupancy: {type: TODO }

      
      # информация для shema.org - google и прочее
      schema:
        name: {type: 'string'} # будет использован meta.title если не передано
        description: {type: 'string'} # будет использован meta.description если не передано
        image: {type: 'string', format: 'url'} # будет использован meta.image если не передано
      
      # информация для твиттера и их карт
      # почитать тут - https://dev.twitter.com/cards/overview
      twitter:
        card: {type: 'string', fallback: 'summary'} # product - для продуктов и summary для всего остального
        site: {type: 'string', fallback: '@Jazztour_ru'} # twitter user
        creator: {type: 'string', fallback: '@Jazztour_ru'}
        domain: {type: 'string', fallback: 'jazztour.ru'}
        title: {type: 'string'} # будет использован meta.title если не передано
        description: {type: 'string'} # будет использован meta.description если не передано
        # массив дополнительной информации. поставляется в виде [{label: "Цена", data: "100500руб."}, {...}]
        # хотя бы 2 нужно передать
        data: 
          [
            label: {type: 'string', required: true}
            data: {type: 'string', required: true}
          ]

      # информация для opengraph и прочего
      opengraph:
        type: {type: 'string', fallback: 'article'} 
        title: {type: 'string'}
        url: {type: 'string', format: 'url', fallback: @currentUrl}
        image: {type: 'string', format: 'url'}
        description: {type: 'string'}
        site_name: {type: 'string'}
        price: 
          ammount: {type: 'number'}
          currency: {type: 'string'}



## Content structure

Content - это массив карт. тут все просто - они выводятся в том порядке в котором переданы. если карта не проходит валидацию или, к примеру, карта запрашивает тип карты еще не реализованый на клиенте - да что угодно - карта пропускается. Таким образом даже если ничего не передано - будет отрендерена почти пустая старница (будет проверятся наличие только title card).Я еще раздумываю над тем включить или нет валидацию для содержимого карт - с одной стороны мы доверяем источнику данных, с другой - качество не гарантируется :(


    content: 
      [
        {type: '$card', required: true}
      ]

Сама карта предельно проста (замечу только что требование к заголовку могут меняться):

    $card:
      type: {type: 'string', required: true}
      title: {type: 'string'}
      icon: {type: 'string'}
      # показывать или нет карту в навигации
      display_in_menu: {type: 'boolean', default: false}
      # какая якорная ссылка будет у карты в навигации
      anchor_link: {type: 'string', default: @type}
      # тайтл который будет показан в меню
      menu_title: {type: 'string', default: @title}
      
      # собственно контент карты
      # отличается от карты к карте
      # может быть пустым объектом если нам нужно просто отрендерить карту но инфу мы туда не передаем (почему-то)
      content: {type: '{object}', required: true}


# Сards  
## simple content card
Самая простая карта которую можно придумать. Ее содержимое рендерится как html без проверок и валидаций

    $simple_content_card:
      # ..
      content: { type: 'string', required: true, format: 'html'}

*пример*:
    
    $simple_content_card:
      type: 'simple_content'
      title: "Моя офигенная карта"
      icon: 'anchor'
      display_in_menu: true
      anchor_link: "awesome-card" # tours/15-slug#awesome-card
      menu_title: "Офигенная карта"
      content: "<span>Блаблабла</span>"


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

## tour title card
    # TODO
## hotel title card
    # TODO
## cottage title card
    # TODO
## entetaiment title card
    # TODO

# route card
Карта маршрута тура


    $route_card:
      # ..
      content:
        # объект для постраения карты
        map:
          # описание карты - начальные координаты центра, зум, другие настройки
          meta: {type: '{object}'}
          # ноды на карте - координаты, содержимое баблов и прочее
          # TODO
          waypoints:
            [
              item: {type: '$map_point'}
            ]
        days:
          [
            item:
              # этот немного сложный
              # нам нужно поддерживать не только "День 1" и "День 2"
              # но и "Дни 1-4", "День 1 и 2" и "День 1 и 5-7"
              # скорее всего не понадобится но я бы хотел иметь эту гибкость уже в системе
              # так [1, [2,3],{start: 7, end: 12}] => "Дни 1-3 и 7-12"
              # но чаще всего -  [1] => "День 1"
              days_numbers: 
                [
                  item: {type: 'number || [array] || {range}'}
                ]
              description: {type: 'string', required: true}
              # тоже непростой концепт
              # к дню можно прицепить любые объекты и их показывать
              # например отель
              # экскурсию, ресторан
              # экскурсию или ресторан которые можно купить дополнительно
              # фотогралерею
              # видео
              attached_objects: 
                [
                  item: {type: '$inline_object'}
                ]
          ]


# Reusable objects

## photo
   
    $photo:
      url: {type: 'string', required: true, format: 'url'}
      title: {type: 'string', required: true}
      alt: {type: 'string', default: @title}
      # опциональное описание
      description: {type: 'string'}


## range 

    # это объект который задается началом и концом
    $range:
      start: {type: 'number', required: true}
      end: {type: 'number', required: true}


## inline object
  Объект прицепляемый как "инлайновый" (прошу прощения за тавтологию)
  Выглядит вот так - http://take.ms/lq21q
  или так: http://take.ms/kPSXM

  тут задачка посложнее - показать общий интерфей для таких объектов










