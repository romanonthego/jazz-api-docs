## photo
   
    $photo:
      url: {type: 'string', required: true, format: 'url'}
      title: {type: 'string', required: true}
      alt: {type: 'string', fallback: @title}
      # опциональное описание
      # будет выводится в лайтбоксе когда нужно
      description: {type: 'string'}