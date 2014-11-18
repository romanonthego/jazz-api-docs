# Object structures
базовая структура объекта 
(рендерится на странице)

    tour:
      meta: {type: '$meta', required: true}
      content: {type: '$content', required: true} # of cards - will be rendered in order in main panel 
      aside: {type: '$aside'} # of cards - will be rendered at sidebar


## Meta structure
Мета информация об объекте. 
Будет, в основном включена в head страницы, а так же для валидации урла, и прочее

    $meta:
      # базовая мет-информация
      # 'tour', 'hotel', 'location' etc
      type: {type: 'string', required: true}
      # на некоторые есть ограничения
      title: {type: 'string', required: true, maxLength: 80}
      geo_prefix: {type: 'string', required: true}
      slug: {type: 'string', required: true}
      id: {type: 'number || string', required: true}
      # тут тоже ограничение
      description: {type: 'string', required: true, maxLength: 160}
      keywords: {type: 'string', required: false}
      # абсолютный путь до картинки
      # не путать с объектом фото
      # просто картинка 300х300
      # будет показываться во всех социалках и пр если для них не перегруженно отдельно
      image: {type: 'string', required: true, format: 'url', fallback: '$jazztour_default_image'}
      
      # массив цен в разных валютах
      prices: 
        [
            currency: {type: 'string', required: true}
            ammount: {type: 'number', req: true}
        ]
      # Инфа о которой нужно подумать
      ocсupancy: {type: '$ocсupancy' }

      
      # информация для shema.org - google и прочее
      schema:
        name: {type: 'string', fallback: @title} # будет использован meta.title если не передано
        description: {type: 'string', fallback: @description} # будет использован meta.description если не передано
        image: {type: 'string', format: 'url' fallback: @image}
      
      # информация для твиттера и их карт
      # почитать тут - https://dev.twitter.com/cards/overview
      twitter:
        # product - для продуктов и summary для всего остального
        # summary - по факту "статья" или "страница"
        card: {type: 'string', fallback: 'summary'}
        site: {type: 'string', fallback: '@Jazztour_ru'} # twitter user
        creator: {type: 'string', fallback: '@Jazztour_ru'}
        domain: {type: 'string', fallback: 'jazztour.ru'}
        title: {type: 'string', fallback: @title}
        description: {type: 'string', fallback: @description} 
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
        image: {type: 'string', format: 'url', fallback: @image}
        description: {type: 'string', fallback: @description}
        site_name: {type: 'string', fallback: "Jazztour"}
        price: 
          ammount: {type: 'number'}
          currency: {type: 'string'}



## Content structure

Content - это массив карт. тут все просто - они выводятся в том порядке в котором переданы. если карта не проходит валидацию или, к примеру, карта запрашивает тип карты еще не реализованый на клиенте - да что угодно - карта пропускается. Таким образом даже если ничего не передано - будет отрендерена почти пустая старница (будет проверятся наличие только title card).Я еще раздумываю над тем включить или нет валидацию для содержимого карт - с одной стороны мы доверяем источнику данных, с другой - качество не гарантируется :(


    content: 
      [
        {type: '$card', required: true}
      ]

аналогично aside

## Aside
то же самое:

    
    aside: 
      [
        {type: '$card', required: true}
      ]



## Page cards

Сама карта предельно проста:

    $card:
      type: {type: 'string', required: true}
      size: {type: 'string', fallback: '2/3'}
      # поддерживаем версионность карт
      # на тот случай если заведем более 1 версии какой-то карты - пригодится
      version: {type: 'string', fallback: '1.0'}
      title: {type: 'string'}
      icon: {type: 'string'}
      # если присутсвует объект меню - значит эта карта добавляется в меню
      menu:
        # какая якорная ссылка будет у карты в навигации
        anchor_link: {type: 'string', fallback: @type}
        # тайтл который будет показан в меню
        title: {type: 'string', fallback: @title}
      
      # собственно контент карты
      # отличается от карты к карте
      # может быть пустым объектом если нам нужно просто отрендерить карту но инфу мы туда не передаем (почему-то)
      content: {type: '{object}', required: true}