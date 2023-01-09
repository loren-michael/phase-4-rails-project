class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :poster_url, :mpaa, :year, :runtime, :synopsis, :summary

  def summary
    "#{self.object.synopsis[0-49]}"
  end

end
