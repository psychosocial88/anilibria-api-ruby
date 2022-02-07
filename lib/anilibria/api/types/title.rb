module Anilibria
  module Api
    module Types
      class Title < Base
        class Series < Base
          attribute? :first, DryTypes::Integer.optional
          attribute? :last, DryTypes::Integer.optional
          attribute? :string, DryTypes::String.optional
        end

        class Posters < Base
          class Poster < Base
            attribute? :url, DryTypes::String.optional
            attribute? :raw_base64_file, DryTypes::String.optional
          end

          %i[small medium original].each do |size|
            attribute? size, Poster
          end
        end

        class Player < Base
          class Playlist < Base
            attribute? :serie, DryTypes::Strict::Integer
            attribute? :created_timestamp, DryTypes::Timestamp

            attribute? :hls, Base do
              attribute? :fhd, DryTypes::String.optional
              attribute? :hd, DryTypes::String.optional
              attribute? :sd, DryTypes::String.optional
            end
          end

          attribute? :alternative_player, DryTypes::String.optional
          attribute? :host, DryTypes::String.optional
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
                attribute? :file, DryTypes::Strict::String
                attribute? :size, DryTypes::Strict::Integer
                attribute? :offset, DryTypes::Strict::Integer
              end

              undef hash

              attribute? :hash, DryTypes::Strict::String
              attribute? :name, DryTypes::Strict::String
              attribute? :announce, DryTypes::Array.of(DryTypes::Strict::String)
              attribute? :created_timestamp, DryTypes::Timestamp
              attribute? :files_list, DryTypes::Array.of(FilesList)
            end

            undef hash

            attribute? :torrent_id, DryTypes::Strict::Integer
            attribute? :series, Title::Series

            attribute? :quality, Base do
              attribute? :string, DryTypes::Strict::String
              attribute? :type, DryTypes::Strict::String
              attribute? :resolution, DryTypes::Strict::Integer
              attribute? :encoder, DryTypes::Strict::String
              attribute? :lq_audio, DryTypes::Strict::Bool
            end

            %i[leechers seeders downloads total_size].each do |i|
              attribute? i, DryTypes::Strict::Integer
            end

            attribute? :url, DryTypes::Strict::String
            attribute? :uploaded_timestamp, DryTypes::Timestamp
            attribute? :hash, DryTypes::Strict::String
            attribute? :metadata, DryTypes::Strict::Nil | Metadata
            attribute? :raw_base64_file, DryTypes::String.optional
          end

          attribute? :series, Title::Series
          attribute? :list, DryTypes::Array.of(Torrent)
        end

        attribute? :id, DryTypes::Strict::Integer
        attribute? :code, DryTypes::Strict::String

        attribute? :names, Base do
          attribute? :ru, DryTypes::String.optional
          attribute? :en, DryTypes::String.optional
          attribute? :alternative, DryTypes::String.optional
        end

        attribute? :announce, DryTypes::String.optional

        attribute? :status, Base do
          attribute? :string, DryTypes::Strict::String
          attribute? :code, DryTypes::Strict::Integer
        end

        attribute? :posters, Posters
        attribute? :updated, DryTypes::Timestamp.optional
        attribute? :last_change, DryTypes::Timestamp.optional

        attribute? :type, Base do
          attribute? :full_string, DryTypes::String.optional
          attribute? :string, DryTypes::String.optional
          attribute? :length, DryTypes::String.optional
          attribute? :series, DryTypes::Integer.optional
          attribute? :code, DryTypes::Integer.optional
        end

        attribute? :genres, DryTypes::Array.of(DryTypes::Strict::String)
        attribute? :team, Types::Team

        attribute? :season, Base do
          attribute? :string, DryTypes::String.optional
          attribute? :code, DryTypes::Integer.optional
          attribute? :year, DryTypes::Integer.optional
          attribute? :week_day, DryTypes::Integer.optional
        end

        attribute? :description, DryTypes::String.optional
        attribute? :in_favorites, DryTypes::Integer.optional

        attribute? :blocked, Base do
          attribute? :blocked, DryTypes::Strict::Bool
          attribute? :bakanim, DryTypes::Strict::Bool
        end

        attribute? :player, Player
        attribute? :torrents, Torrents
      end
    end
  end
end
