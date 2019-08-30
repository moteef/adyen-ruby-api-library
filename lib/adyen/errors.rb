module AdyenOfficial
  class AdyenOfficialError < StandardError
    attr_reader :code, :response, :request, :msg

    def initialize(request = nil, response = nil, msg = nil, code = nil)
      attributes = {
        code: code,
        request: request,
        response: response,
        msg: msg
      }.select { |_k, v| v }.map { |k, v| "#{k}:#{v}" }.join(', ')
      message = "#{self.class.name} #{attributes}"
      super(message)
      @code = code
      @response = response
      @request = request
      @msg = msg
    end
  end

  class AuthenticationError < AdyenOfficialError
    def initialize(msg, request)
      super(request, nil, msg, 401)
    end
  end

  class PermissionError < AdyenOfficialError
    def initialize(msg, request)
      super(request, nil, msg, 403)
    end
  end

  class FormatError < AdyenOfficialError
    def initialize(msg, request, response)
      super(request, response, msg, 422)
    end
  end

  class ServerError < AdyenOfficialError
    def initialize(msg, request, response)
      super(request, response, msg, 500)
    end
  end

  class ConfigurationError < AdyenOfficialError
    def initialize(msg, request)
      super(request, nil, msg, 905)
    end
  end

  class ValidationError < AdyenOfficialError
    def initialize(msg, request)
      super(request, nil, msg, nil)
    end
  end

  # catchall for errors which don't have more specific classes
  class APIError < AdyenOfficialError
    def initialize(msg, request, response, code)
      super(request, response, msg, code)
    end
  end
end
