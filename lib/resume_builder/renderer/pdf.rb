require "grover"
require_relative "html"

module ResumeBuilder
  module Renderer
    class PDF
      def render
        html = HTML.new.render
        grover = Grover.new(html)
        File.open("resume.pdf", "wb") { |f| f << grover.to_pdf }
      end
    end
  end
end
