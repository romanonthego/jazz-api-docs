# API
Даже если API у нас не REST - это не повод его не использовать
я предлагаю следующий вариант:

    @api = new JazzInternalApi({})

    # cписок туров с пагинацией
    @api.get 'tours'

    # список туров для страны
    # страна передается как есть по name
    api.get 'tours', {location: 'norway'}

    # тур по id
    @api.get 'tours', {id: 125} 

    # alias
    @api.tours {id: 125} 
    @api.tours {location: 'norway'}



# Список методов

    # HTTP

    # main page
    # GET /main_grid
    # GET /form_config

    # footer links
    # GET /about
    # GET /agents
    # GET /vacancies
    # GET /vacancies/:id

    # locations lists
    # GET /locations_lists
    # GET /locations_list/:name

    # location
    # GET /locations
    # GET /locations/:name

    # GET /locations/:name/tours
    # GET /locations/:name/hotels
    # GET /locations/:name/cottages
    # GET /locations/:name/villages
    # GET /locations/:name/entertainments
    
    # GET /tours
    # GET /tours/:id
    
    # GET /hotels
    # GET /hotels/:id
    
    # GET /cottages
    # GET /cottages/:id
    
    # GET /villages
    # GET /villages/:id
    
    # GET /entertainments
    # GET /entertainments/:id

    # GET /manual_requset
    # POST /manual_request




## Singleton objects

    model = MainPageGrid
    @api.get('main_grid', options)
    
    @api.mainGrid(options)

    model = FormConfig
    @api.get('form_config', options)
    
    @api.FormConfig(options)



## LocationsLists
списки локаций
те самые что на /locations
нужны пока только в 1 виде - корневые списки локаций как вот тут
https://www.dropbox.com/s/eccenc332rkeba3/cards_preview_locations_activities.jpg?dl=0


    model = LocationsList
    collection = LocationsLists
    
    @api.get('locations_lists')
    @api.get('locations_list/norway')
    @api.get('locations_lists', {root: 'norway'})

    @api.locationsLists({root: 'norway'})


## Локации
коллекция локаций
пока используется только в виде инстансов, т.е. коллекции по сути не нужны, 
но пусть будут для порядка

    @api.get('locations', options)
    @api.get('locations/norway', options)
    
    # альтернативы:
    @api.get('location', {name: 'norway'})
    @api.locations(options)
    @api.location({name: 'norway'})



## Туры (отели, коттеджи и пр) в локацию
поскольку это а) явно коллекции и б) это явно не просто фильтр "все туры где локация=:name"
то будет новая коллекция и моделька

    # jazztour/tours/norway
    # jazztour/tours/norway/oslo (?)

    @api.get('locations/norway/tours', options)

    # альтернативы
    @api.locationTours({location: 'norway'})
    ...

## Туры
    
    # jazztour/tours/12-everything-is-awesome
    @api.get('tours') # по идее список всех туров (скорее всего пагинированый)
    @api.get('tours/12', options)
    
    # альтернативы
    @api.get('tours', {id: 12})
    @api.tours(options)
    @api.tour({id: 12})


## Отели
    
    @api.get('hotels') # по идее список всех туров (скорее всего пагинированый)
    @api.get('hotels/12', options)
    
    # альтернативы
    @api.get('hotels', {id: 12})
    @api.hotels(options)
    @api.hotel({id: 12})



## Коттеджи
    
    @api.get('cottages') # по идее список всех туров (скорее всего пагинированый)
    @api.get('cottages/12', options)
    
    # альтернативы
    @api.get('cottages', {id: 12})
    @api.cottages(options)
    @api.cottage({id: 12})



## Коттеджные поселки
    
    @api.get('villages') # по идее список всех туров (скорее всего пагинированый)
    @api.get('villages/12', options)
    
    # альтернативы
    @api.get('villages', {id: 12})
    @api.villages(options)
    @api.village({id: 12})



## Развлечения

    @api.get('entertainments') # по идее список всех туров (скорее всего пагинированый)
    @api.get('entertainments/12', options)
    
    # альтернативы
    @api.get('entertainments', {id: 12})
    @api.entertainments(options)
    @api.entertainment({id: 12})


## Поиск
поисковый запрос

    @api.get('search' {location: 'norway', departure_date: '...', ...})
    # альтернатива
    @api.search({...})





