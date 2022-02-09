module Anilibria
  module Api
    module Types
      class Title < Base
        class Series < Base
          attribute? :first, T::Integer
          attribute? :last, T::Integer
          attribute? :string, T::String
        end

        class Posters < Base
          class Poster < Base
            attribute? :url, T::String
            attribute? :raw_base64_file, T::String
          end

          %i[small medium original].each do |size|
            attribute? size, Poster
          end
        end

        class Player < Base
          class Playlist < Base
            attribute? :serie, T::Integer
            attribute? :created_timestamp, T::Timestamp

            attribute? :hls, Base do
              attribute? :fhd, T::String
              attribute? :hd, T::String
              attribute? :sd, T::String
            end
          end

          attribute? :alternative_player, T::String
          attribute? :host, T::String
          attribute? :series, Title::Series

          attribute?(
            :playlist,
            DryTypes::Hash.map(
              DryTypes.Constructor(Integer) { |i| Integer(i.to_s) }, DryTypes.Constructor(Playlist)
            ) | DryTypes::Array.of(Playlist)
          )
        end

        class Torrents < Base
          class Torrent < Base
            class Metadata < Base
              class FilesList < Base
                attribute? :file, T::String
                attribute? :size, T::Integer
                attribute? :offset, T::Integer
              end

              undef hash

              attribute? :hash, T::String
              attribute? :name, T::String
              attribute? :announce, DryTypes::Array.of(T::String)
              attribute? :created_timestamp, T::Timestamp
              attribute? :files_list, DryTypes::Array.of(FilesList)
            end

            undef hash

            attribute? :torrent_id, T::Integer
            attribute? :series, Title::Series

            attribute? :quality, Base do
              attribute? :string, T::String
              attribute? :type, T::String
              attribute? :resolution, T::Integer
              attribute? :encoder, T::String
              attribute? :lq_audio, T::Bool
            end

            %i[leechers seeders downloads total_size].each do |i|
              attribute? i, T::Integer
            end

            attribute? :url, T::String
            attribute? :uploaded_timestamp, T::Timestamp
            attribute? :hash, T::String
            attribute? :metadata, Metadata.optional
            attribute? :raw_base64_file, T::String
          end

          attribute? :series, Title::Series
          attribute? :list, DryTypes::Array.of(Torrent)
        end

        attribute? :id, T::Integer
        attribute? :code, T::String

        attribute? :names, Base do
          attribute? :ru, T::String
          attribute? :en, T::String
          attribute? :alternative, T::String
        end

        attribute? :announce, T::String

        attribute? :status, Base do
          attribute? :string, T::String
          attribute? :code, T::Integer
        end

        attribute? :posters, Posters
        attribute? :updated, T::Timestamp
        attribute? :last_change, T::Timestamp

        attribute? :type, Base do
          attribute? :full_string, T::String
          attribute? :string, T::String
          attribute? :length, T::Integer
          attribute? :series, T::Integer
          attribute? :code, T::Integer
        end

        attribute? :genres, DryTypes::Array.of(T::String)
        attribute? :team, Types::Team

        attribute? :season, Base do
          attribute? :string, T::String
          attribute? :code, T::Integer
          attribute? :year, T::Integer
          attribute? :week_day, T::Integer
        end

        attribute? :description, T::String
        attribute? :in_favorites, T::Integer

        attribute? :blocked, Base do
          attribute? :blocked, T::Bool
          attribute? :bakanim, T::Bool
        end

        attribute? :player, Player
        attribute? :torrents, Torrents
      end
    end
  end
end
