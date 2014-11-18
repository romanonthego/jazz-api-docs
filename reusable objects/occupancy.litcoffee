## occupancy
  объект описывающий количество и возраст людей
  в перспективе еще разбивка на комнаты

    $occupancy:
      adults: {type: 'number', required: true, fallback: 1}
      # массив возрастов детей
      # длинна массива - количество детей
      childrens: 
        [
          item: {type: 'number', required: true}
        ]
