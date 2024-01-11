class Api::V1::SearchQueriesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def search
        searched = params[:query].to_s.strip
        ip = request.remote_ip
        
        if searched.present?
            SearchQuery.create(query: searched, ip: ip)

            render json:{message: "Successfully created"}
        else
            render json:{error: "Invalid search"}
        end
    end

    def get_suggestions
        partial_input = params[:query].to_s.strip
        current_ip = request.remote_ip
        user_searches = SearchQuery.where(ip:current_ip).group(:query).count(:query)
        if user_searches.present?
            suggestions = if partial_input.present? 
                          user_searches.keys.select { |query| query.start_with?(partial_input) }.take(5)
                          else 
                            user_searches.sort_by { |query, count| -count }.take(5)
                          end
            render json: {suggestions: suggestions}
        else
            render json: {message: 'No search history'}
        end
    end
  end