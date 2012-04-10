#Robot = require "../../robot"

beers = [
    "http://beerimages.com/wp-content/uploads/2011/03/beer-collection.jpg"
    "http://stuffeducatedlatinoslike.files.wordpress.com/2008/03/beer.jpg"
    "http://www.beer100.com/images/beermug.jpg"
    "http://www.fitceleb.com/files/images/beer.jpg"
    "http://www.atlantaintownpaper.com/wp-content/uploads/2010/07/beer.jpg"
    "http://goodfoodforhealth.files.wordpress.com/2010/02/beer.jpg"
    "http://tacomacdouglasville.com/wgbf/images/beers.jpg"
    "http://blog.rosemontapthomes.com/files/2010/05/beer.jpg"
    "http://sixpacktech.com/wp-content/uploads/2009/06/perfect-beer.jpg"
    "http://www.houstonbeerweek.com/wp-content/uploads/2011/06/beers.jpg"
    "http://dsc.discovery.com/tv/how-stuff-works/images/beer.jpg"
    "http://cdn.sheknows.com/articles/variety-of-beers.jpg"
    "http://beerimages.com/wp-content/uploads/2011/03/beer-chicks.jpg"
    "http://www.aperfectpint.net/wp-content/uploads/2011/08/iStock_000008728976XSmall.jpg"
    "http://newfashionmode.com/wp-content/uploads/2011/06/Fotolia-beer.jpg"
    "http://justglasssite.com/glass-pics/beer-21.jpg"
    "http://rolkanation.com/wp-content/uploads/2010/12/beers-for-web.jpg"
    "http://legendsofbeer.files.wordpress.com/2008/12/smiling20with20a20duff20beer.gif"
    "http://definitiveale.files.wordpress.com/2010/06/beer-anatomy.jpg"
    "http://www.hoppsy.com/wp-content/uploads/2007/11/duff-beer-real.gif"
    "http://www.freakingnews.com/pictures/54000/Volcanic-Glass-of-Beer-54060.jpg"
    "http://www.brenandsven.com/blog/wp-content/uploads/2011/09/pouring-beer.jpg"
    "http://denomolos.com/images/egyptian_beer_party_lg.jpg"
    "http://www.fortybeers.com/wp-content/uploads/2009/09/beers7.jpg"
    "http://www.bitchdujour.com/wp-content/uploads/2009/06/homer-simpson-beer.jpg"
    "http://www.coolhunting.com/2011/01/11/beer-10.jpg"
    "http://i.nuseek.com/images/template/360x318/hk_20080207_beer.JPG"
    "http://www.triplepundit.com/wordpress/wp-content/uploads/2010/09/beer-mug-250x300.jpg"
    "http://www.delish.com/cm/delish/images/XK/shandy-beer-esq0410-400.jpg"
    "http://uploads.neatorama.com/wp-content/uploads/2010/04/beer-glass.jpg"
    "http://sndstl.com/wp-content/uploads/2011/04/beer1.jpg"
    "http://blogs.scientificamerican.com/media/inline/blog/Image/beer-pints.jpg"
    "http://brewbakersbrewingco.com/images/3beers2.jpg"
    "http://www.beerh.com/wp-content/uploads/2010/09/stout-beer.jpg"
    "http://www.alcoholcontents.com/Beers.jpg"
]    

module.exports = (robot) ->
    robot.respond /.*?\b(beers?)\b/i, (msg) ->
#        msg.http('http://ajax.googleapis.com/ajax/services/search/images')
#            .query(v: "1.0", rsz: '8', q: msg.match[1])
#            .get() (err, res, body) ->
#                images = JSON.parse(body)
#                images = images.responseData.results
#                image  = msg.random images
#                msg.send "#{image.unescapedUrl}"

        msg.message.text = "#{robot.name} img me #{msg.match[1]}"
        robot.receive msg.message
#            msg.send "#{robot.name} img me #{msg.match[1]}"
 
#        msg.send msg.random robot.receive msg #"image me " + msg.match[1] #msg.random beers    
#        robot.receive "img me #{msg.match[1]}#", (url) ->
#            msg.send url
