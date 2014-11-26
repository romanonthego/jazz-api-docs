## articles card
на самом деле - подвид карты x_in_y :)
представляет собой заголовк и прикрепленные объекты статьи

    $articles_card:
      title: {type: 'string', required: true}
      content:
        article: 
          [
            item: {type: '$inline_article'}
          ] 