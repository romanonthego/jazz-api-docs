# Stand-alone cards
в отличии от контентной карты которая представляет собой кусок описания какого-то объекта (например карта "Маршрут тура")
самостоятельные карты а) сами представляют собой объекты б) не зависят от контекста

выражается это в том:
  
    # напоминаю контентную карту
    $card:
      type: {type: 'string', required: true}
      size: {type: 'string', fallback: '2/3'}
      version: {type: 'string', fallback: '1.0'}
      title: {type: 'string'}
      
      icon: {type: 'string'}

      menu:
        anchor_link: {type: 'string', fallback: @type}
        title: {type: 'string', fallback: @title}
      content: {type: '{object}', required: true}

    # 
    $stand_alone_card:
      # ..
      type: {type: 'string', required: true}
      # для самостоятельных карт обязателен размер
      # если не передано - подставляется *по обстоятельствам*
      size: {type: 'string', required: true, fallback: "1/3 || 2/3"}
      # не задается иконка
      # icon: {type: 'string'}

      # menu игнорируется
      # menu:
      #   anchor_link: {type: 'string', fallback: @type}
      #   title: {type: 'string', fallback: @title}

      # добавляется объект объект (=о)
      # он описывает объект для которого строится карта - id, slug, gej_prefix
      # id может быть и фактически name но внешний api портить я не хочу из-за этого
      object:
        id: {type: 'number || string', required: true}
        geo_prefix: {type: 'string', required: true}
        slug: {type: 'string', required: true, fallback: @title.translit()}

      content:
        #...
  