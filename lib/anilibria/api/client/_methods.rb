module Anilibria
  module Api
    class Client
      # Public Methods
      api_method :get_title, returns: Types::Title
      api_method :get_titles, returns: DryTypes::Array.of(Types::Title)
      api_method :get_updates, returns: DryTypes::Array.of(Types::Title)
      api_method :get_changes, returns: DryTypes::Array.of(Types::Title)
      api_method :get_schedule, returns: DryTypes::Array.of(Types::Schedule)
      api_method :get_random_title, returns: Types::Title
      api_method :get_youtube, 'getYouTube', returns: DryTypes::Array.of(Types::YouTube)
      api_method :get_feed, returns: Types::Feed
      api_method :get_years, returns: DryTypes::Array.of(DryTypes::Integer)
      api_method :get_genres, returns: DryTypes::Array.of(DryTypes::String)
      api_method :get_caching_nodes, returns: DryTypes::Array.of(DryTypes::String)
      api_method :get_team, returns: DryTypes.Constructor(Types::Team) { |team| team[:team] }
      api_method :get_rss, 'getRSS', returns: DryTypes::String | DryTypes::Hash
      api_method :get_seed_stats, returns: DryTypes::Array.of(Types::SeedStats)
      api_method :search_titles, returns: DryTypes::Array.of(Types::Title)
      api_method :advanced_search, returns: DryTypes::Array.of(Types::Title)

      # Methods that require authorization
      api_method :get_favorites, returns: DryTypes::Array.of(Types::Title)
      api_method :add_favorite, http_method: :put, returns: Types::T::Success
      api_method :del_favorite, http_method: :delete, returns: Types::T::Success
    end
  end
end
