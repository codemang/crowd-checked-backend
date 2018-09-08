class LaunchController < ApplicationController
  def index
    highlights = ActiveRecord::Base.connection.execute(<<-SQL
      SELECT
        highlights.article_title,
        highlights.url,
        COUNT(DISTINCT highlights.id) AS highlight_count,
        COUNT(DISTINCT comments.id) AS comment_count,
        MAX(comments.created_at::DATE) AS last_comment_date
      FROM highlights
      LEFT JOIN comments
        ON comments.highlight_id = highlights.id
      GROUP BY 1,2
      ORDER BY MAX(comments.created_at) DESC
    SQL
    )

    @highlights = highlights.map do |highlight|
      url = highlight['url']
      if url !~ /^http/
        url = 'http://' + url
      end
      highlight['url'] = url
      highlight['hostname'] = URI.parse(url).host
      highlight
    end
  end
end
