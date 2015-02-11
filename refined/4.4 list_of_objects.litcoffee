list_of_objects

список объектов.
Отмечаю отдельно что они могут быть и разных видов, но логичнее что бы были одного.
опционально можно добавить ссылку на список (список туров, отелей и прочего.)


    {
      type: 'list_of_objects',
      id: id,
      title: 'Что почитать про Норвегию',
      content: {
        objects: [
          {
            type: 'article',
            title: 'Виза в Норвегию',
            object: {
              type: 'article',
              id: 12,
              slug: 'some-awesome-article'
            },
            content: {
              description: description,
              photos: [
                photo
              ]
            }
          }
        ]*4
      }
    }

    # с сылкой на туры:
    {
      type: 'list_of_objects',
      id: id,
      title: 'Туры в Норвегию',
      content: {
        objects: [
          tour,
          tour,
          tour,
          tour 
        ],
        link_to_list: {
          type: 'tours',
          name: 'norway',
          title: 'Все туры в Норвегию',
          geo_prefix: 'europe/norway'
        }
      }
    }
