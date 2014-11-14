## Dates card
выбор даты
http://take.ms/mHCGU

    $dates_card
      #..
      content:
        dates:
          [
            item:
              start: {type: 'date', required: true}
              end: {type: 'date', required: true}
              # нужно решить - передавать дифы или передавать цены
              diffs:
                [
                  item: {type: '$price'}
                ]
          ]
        # на самом деле довольно адски объект
        # для отеля может быть не ограничен ибо въехал/выехал
        # для тура - уже весело. есть ограниченый набор дат вылета
        # для каждой даты вылета есть свой набор дат возвращения
        # все это может менятся в зависимости от города вылета
        # а еще от отеля например...
        # так что пока базовый вариант
        user_dates:
          default
            departure_date: {type: 'date', required: true}
            return_date: {type: 'date', required: true}
          departure_date: {type: 'date', required: true}
            min: {type: 'date', required: true}
            max: {type: 'date', required: true}
          return_date: {type: 'date', required: true}
            min: {type: 'date', required: true}
            max: {type: 'date', required: true}