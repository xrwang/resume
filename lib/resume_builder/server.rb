require_relative "renderer/html"

module ResumeBuilder
  class Server
    def call(env)
      renderer = Renderer::HTML.new
      body = renderer.render
      headers = {"Content-Type" => "text/html; charset=utf-8"}
      [200, headers, [body]]
    end
  end
end
