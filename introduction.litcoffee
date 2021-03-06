# Introduction
API - целиком про данные

## Какие данные мне нужно получить для рендеринга страницы
Зависит исключительно от страницы. по сути у нас есть два типа страниц:

* старница объекта - тура/отеля и пр
* страница-страница - главная, о компании, список локаций и пр

страницы объектов очень формальны и легко описываются - очевидно.
страницы-страницы описываются несколько хуже потому что часто уникальны

## Страницы объектов
для постраение страницы объектов мне нужен ровно 1 определенный объект:

    $object:
      meta: {type: '$meta', required: true}
      content: {type: '$content', required: true} # of cards - will be rendered in order in main panel 
      aside: {type: '$aside'} # of cards - will be rendered at sidebar


подробнее о нем в соседнем файле *page cards*. Но вобщем мне нужно: 
meta для построениея мета-информации и seo ништяков
content для построения контента
aside для построения боковой строки


## Страницы-страницы
тут и проще и сложнее. по идее структура та же но:
    
    $page:
      # скорее всего будет закешировано ибо меняется ну очень редко
      # даже вплоть до хардкода ибо нефиг
      meta: {type: '$meta', required: true}
      # скорее всего только часть контента нужно запрашивать
      # остальное де-факто прибито гвоздями
      content: {type: '$content', required: true}
      # аналогично
      aside: {type: '$aside'}

поэтому нужно найти компромис
примеры:
1. на главной нужно только данные для сетки объектов и начальные данные для формы
2. старинца "о компании" может быть статичной вообще
3. страницы проектов/локаций/видов отдыха (именно каталоги) - могут быть закешированы полностью

