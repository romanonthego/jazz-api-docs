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


# Постраничный прогон :)

## "/" - main page
нужные данные:
1. "сетка" на главной старнице
2. данные для формы

    @api.get 'main_grid', opts
    # => 
    # [
    #   ...
    #   {type: 'tour', size: '2/3'...}
    #   ...
    # ]

    # данные для формы
    # локация по-умолчанию
    # плэйсхолдер для поисковой строки
    # локация по-умолчиню
    @api.get 'form_data', opts
    # =>
    # {
    #   default_departure_date: "27.11.2014",
    #   default_return_date: "12.12.2014",
    #   default_location: "norway",
    #   search_placeholder: "Туры в норвегии"
    # }