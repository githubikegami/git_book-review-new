class Scraping

  def self.movie_urls
    links = []
    links2 = []
    abc = []
    agent = Mechanize.new
    current_page = agent.get("https://books.rakuten.co.jp/search?sitem=ruby&g=001&l-id=pc-search-box&x=0&y=0")
    current_page.search('p.gbs').remove
    current_page.search('.btn-preview').remove
    current_page.search('a.ui-carousel-media-image isLoaded').remove
    elements = current_page.search('.rbcomp__contents #ratArea .rbcomp__item-list .rbcomp__item-list__item .rbcomp__item-list__item__image a')
    abc = elements.uniq

    abc.each do |ele|
    links << ele[:href]
    end

    links.each do |link|
      get_product(link)
    end
  end

  def self.get_product(link)
    
    agent = Mechanize.new
    page = agent.get(link)


    efg = page.at('//*[@id="productExtra"]/dl/dt/a')
                  # //*[@id="productExtra"]/dl/dt/a*[not(self:://*[@id="productExtra"]/dl/dt/div/div/div[1]/div/span/a)]
    fgh = efg[:href]
    image_url = "#{"https:" + fgh}"
    # オッケー。返り値はオッケーだけど・・・。空欄は駄目かも。

    title = page.at('#productTitle h1').inner_text
    # # OK
    
    price = page.at('.productInfoArea p.productPrice span.price').inner_text
    # # ok
    
    release_date = page.at('.innerSection ul li.productInfo span.categoryValue').inner_text
    # # OK
    
    author = page.at('#productTitle .authorLink').inner_text
    # # ok
    
    publisher = page.at('//*[@id="productDetailedDescription"]/div/ul/li[3]/span[2]/a').inner_text
    # ok
    description = page.at('//*[@id="editArea2"]/div/p[2]/text()').inner_text
    # ok
    
    bookreviews = Bookreview.new(image_url: image_url, title: title, price: price,release_date: release_date,author: author,publisher: publisher ,description: description)
    bookreviews.save
  end
end
