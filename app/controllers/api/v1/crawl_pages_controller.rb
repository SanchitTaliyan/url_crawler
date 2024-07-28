module Api
  module V1
    class CrawlPagesController < ApplicationController
      skip_before_action :verify_authenticity_token, only: :create


      def create
        urls = params[:urls]
        results = urls.map do |url|
          crawler = CrawlerService.new(url)
          metadata = crawler.fetch_metadata
          topics = crawler.classify_content(metadata[:body])
          { url: url, metadata: metadata, topics: topics }
        end

        render json: results, status: :ok
      end
    end
  end
end