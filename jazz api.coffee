meta:
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


# Базовая структура карты
card:
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
  content: {type: 'object', required: true}


