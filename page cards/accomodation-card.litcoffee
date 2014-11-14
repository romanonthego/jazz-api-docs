## accomodation card
Карта размещений
http://take.ms/wywSu
сюда же включается 
http://take.ms/RbENg

причина: размещение не хочется разбивать на комнаты/отели, логичнее держать все в одном

    $accomodation_card:
      #..
      title: {type: 'string', required: true, fallback: "Размещение"}
      content:
        accomodations: 
          [
            item:
              title: {type: 'string', required: true}
              stars: {type: 'number'}
              is_default: {type: 'boolean'}
              # разница с основной ценой
              # вот эта самая +100500$
              # в разных валютах
              # можно подумать и сделать не диф а ценник полный
              # формат не меняется, меняется только смысл - передаем или полную ценую
              diffs:
                [
                  item: {type: '$price'}
                ]
              # TODO description: {}
              
              # виды размещений и комнат
              # подцепляются как отдельные объекты
              varianst: 
                [
                  item: {type: '$inline_accomodation_variant'}
                ]
          ]