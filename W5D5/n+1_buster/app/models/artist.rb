# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO: your code here
    albums_with_tracks = self
      .albums # returns array of albums
      .select('albums.title, COUNT(*) AS tracks_count') # of those albums, select count of tracks within in each album
      # .joins(:tracks) # inner join albums with tracks table
      # .group('albums.id') # collapse rows on each album --> each album = array of track objects

    albums_with_tracks.map do |album|
      [album.title, album.tracks_count]
    end
  end
end
