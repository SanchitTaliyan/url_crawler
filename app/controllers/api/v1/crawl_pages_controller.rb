module Api
  module V1
    class CrawlPagesController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:crawl_pages, :crawl_page]


      def crawl_pages
        urls = params[:urls]
        results = urls.map do |url|
          crawler = CrawlerService.new(url)
          metadata = crawler.fetch_metadata
          topics = crawler.classify_content(metadata[:body])
          { url: url, metadata: metadata, topics: topics }
        end

        render json: results, status: :ok
      end

      def crawl_page
        url = params[:url]
        crawler = CrawlerService.new(url)
        metadata = crawler.fetch_metadata
        topics = crawler.classify_content(metadata[:body])

        render json: { metadata: metadata, topics: topics }, status: :ok
      end

    end
  end
end