require "yaml"
require "erb"
require_relative "../data"

module ResumeBuilder
  module Renderer
    class HTML
      def render
        data = Data.load
        template = File.read("source/resume.html.erb")
        erb = ERB.new(template)
        erb.result(binding)
      end
    end
  end
end
