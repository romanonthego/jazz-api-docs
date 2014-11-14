## documents card
Карта необходимые документы
http://take.ms/Njjx2

    $documents_card:
      #..
      title: {type: 'string', fallback: "Документы"}
      content:
        documents: 
        [
          item:
            description: {type: 'string', required: true}
            # будет подставлено "входит" или "не входит" в стоимость тура
            # если не передано - значит без комментариев (как например загранпаспорт)
            is_included: {type: 'boolean'}
        ]