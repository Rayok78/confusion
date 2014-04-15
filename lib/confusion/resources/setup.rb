# encoding: utf-8

require 'confusion/resource'

module Confusion
  module Resources
    # Performs initial setup of the system
    class Setup < Confusion::Resource
      allow :post, :options

      def resource_exists?; true; end

      def post_is_create?;  true; end

      def create_path
        URI.join(request.base_uri.to_s, '/setup/')
      end

      accept_content_type 'application/x-www-form-urlencoded' => :accept_form
      def accept_form
        form =  URI.decode_www_form(request.body.to_s)
        _, password = form.select { |name, _| name == "password-field" }.first

        puts "Got password: #{password}"
      end
    end
  end
end
