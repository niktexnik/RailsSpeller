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
      if body.empty?
        'Какой Вы молодец! Все написно верно.'
      else
        errors = []
        maybe = []
        body.each do |check_result|
          errors << check_result['word']
          maybe << check_result['s']
        end
        "Ошибки в слове #{errors}, возможно вы имели ввиду: #{maybe}"
      end
    end

    def request(path, params)
      response = HTTP.get("#{BASE_SPELLER_URL}#{path}", params: params)
      parse_response(response)
    end
  end
end
