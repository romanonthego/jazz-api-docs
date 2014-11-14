## spec card
Карта "особенности"
http://take.ms/HWjlw


    $specs_card:
      #..
      title: {type: 'string', fallback: "Особенности тура || отеля || коттеджа"}
      content:
        specs:
          [
            item: {type: '$spec', required: true}
          ]
        description:
          [
            item: {type: 'string', required: true}
          ]
