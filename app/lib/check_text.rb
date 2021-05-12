# frozen_string_literal: true

require 'http'
require 'json'
class CheckText
  BASE_SPELLER_URL = 'https://speller.yandex.net/services/spellservice.json'

  class << self
    def check_text(text)
      request('/checkText', { text: text })
    end

    def check_texts(text)
      request('/checkTexts', { text: text })
    end

    def parse_response(response)
      return 'Что-то пошло не так' if !response.code == 200
      body = JSON.parse(response.body)
    end

    def request(path, params)
      response = HTTP.get("#{BASE_SPELLER_URL}#{path}", params: params)
      parse_response(response)
    end
  end
end
