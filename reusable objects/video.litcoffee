## video

  видео объект
  http://take.ms/5ekI0
  
    $video:
      description: {type: 'html'}
      # мы сами конструируем видео-фрейм на клиенте
      # все что нужно это провайдер (ютуб/вимео) и id видео
      id: {type: 'string', required: true}
      provider: {type: 'string', required: true, fallback: 'vimeo'} 