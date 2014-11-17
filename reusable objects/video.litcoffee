## video

  видео объект
  http://take.ms/5ekI0
  
    $video:
      description: {type: 'string'}
      # мы сами конструируем видео-фрейм на клиенте
      # все что нужно это провайдер (ютуб/вимео) и id видео
      video_id: {type: 'string', required: true}
      video_provider: {type: 'string', required: true, fallback: 'vimeo'} 