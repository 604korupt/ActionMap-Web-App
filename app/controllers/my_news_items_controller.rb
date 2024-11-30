# frozen_string_literal: true

class MyNewsItemsController < SessionController
  before_action :set_representative
  before_action :set_representatives_list
  before_action :set_issues_list
  before_action :set_news_item, only: %i[edit update destroy]

  def new
    @news_item = NewsItem.new
  end

  def search
    @representative = Representative.find(params[:representative_id])
    @issue = params[:news_item][:issue]
    # Call News API to get articles
    query = "#{@representative.name} #{@issue}"
    @articles = fetch_news_articles(query)

    render 'search'
  end

  def create
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  def edit; end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  def set_issues_list
    @issues_list = ['Free Speech', 'Immigration', 'Terrorism', 'Social Security and
    Medicare', 'Abortion', 'Student Loans', 'Gun Control', 'Unemployment',
                    'Climate Change', 'Homelessness', 'Racism', 'Tax Reform', 'Net
    Neutrality', 'Religious Freedom', 'Border Security', 'Minimum Wage',
                    'Equal Pay']
  end

  def fetch_news_articles(query)
    api_key = Rails.application.credentials[:GOOGLE_NEWS_API_KEY]
    url = "https://newsapi.org/v2/everything?q=#{CGI.escape(query)}&apiKey=#{api_key}&pageSize=5"
    response = Faraday.get(url)
    json = JSON.parse(response.body)
    articles = []
    json['articles'].each do |article|
      title = article['title']
      link = article['url']
      description = article['description']
      articles.append({ title: title, link: link, description: description })
    end
    articles
  rescue StandardError => e
    Rails.logger.error("News API error: #{e.message}")
    []
  end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue)
  end
end
