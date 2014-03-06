module Decorator
  class Base
    attr_reader :model

    def initialize(model)
      @model = model
    end

    def method_missing(method, *args)
      @model.send(method, *args)
    end
  end
end
