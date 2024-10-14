require "yaml"

module ResumeBuilder
  class Data

    def self.load
      new(YAML.load_file("data/resume.yml"))
    end

    def initialize(hash)
      @hash = hash
    end

    private

    def method_missing(m, *args, &block)
      v = @hash[m.to_s]
      if v.is_a?(Hash)
        Data.new(v)
      elsif v.is_a?(Array)
        v.map {|e| Data.new(e) }
      else
        v
      end
    end

    def respond_to_missing?(m, include_private = false)
      @hash.keys.include?(m.to_s) || super
    end
  end
end
