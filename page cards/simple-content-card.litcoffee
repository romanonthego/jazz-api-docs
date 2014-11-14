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