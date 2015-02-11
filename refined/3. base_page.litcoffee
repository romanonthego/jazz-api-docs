## 1. Страница:

любая контентная страница, собирается просто
состоит из следующих частей:
1. мета-информации
2. контента
3. описание объекта
пример: http://jazz-api.romanonthego.rocks/locations/norway


      $page: {
        id: 'numeric id',
        type: 'article|location|etc..'
        title: 'title'
        # формальное описание обеъекта, используется для построения ссылки.
        # type используется для рендеринга, object - для навигации и прочего
        object: {
          id: 12 # если есть цифровой id
          name: 'norway' # если есть string id - например у локаций
          type: 'article'
          geo_prefix: 'norway/oslo' # без открывающего и закрывающего слэша
        },
        # мета-информация, будет передана в разные мета-теги
        meta_info: {
          title: "Самый лучший тур",
          description: "Описание самого лучшего тура",
          image: 'http://....',
          
          open_graph: {
            title: "Самый лучший тур для facebook"
          },
          schema_org: {
            
          },
          twitter: {

          }
        },
        content: {
          main: ['...'],
          aside: ['...']
        }
      },