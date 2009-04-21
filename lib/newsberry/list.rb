require 'rubygems'
require 'net/http'
require 'uri'
require 'csv'

module Newsberry
  class List

    attr_accessor :list_name, :custom_fields, :data

    def initialize(name)
      @list_name = name
    end

    def sync!

      req = Net::HTTP::Post.new('/api/subscriber.asmx/SynchronizeSubscribers')

      req.basic_auth Newsberry.auth[:username], Newsberry.auth[:password] if Newsberry.auth

      form_data = { 
        'licenseKey'  => Newsberry.api_key,
        'listName'    => list_name,
        'emailsList'  => build_data,
        'columnsList' => columns,
      }

      req.set_form_data(form_data)

      res = Net::HTTP.new(Newsberry.host).start {|http| http.request(req) }
      res.error! unless Net::HTTPSuccess === res
      res
    end


    def columns
      return 'Email' if custom_fields.nil?
      build_csv do |writer|
        writer << ['Email'] + custom_fields.map(&:last)
      end
    end
    
    def build_data
      build_csv do |writer|
        @data.inject(writer) do | rows, record |
          row = [record.email]
          if custom_fields 
            custom_fields.map(&:first).each do |key|
              row << record.send(key)
            end
          end

          writer << row
          writer
        end
      end
    end

    private 

    def build_csv
      out = ""
      CSV::Writer.generate out do |writer|
        yield writer
      end
      out
    end
    
  end
end
