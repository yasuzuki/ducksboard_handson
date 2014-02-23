module Ducksboard
  class Base
    PUSH_URL = 'https://push.ducksboard.com/values'
    BASIC_PASSWORD = 'unused'

    def self.setup
      @@key = ''
    end

    def initialize id
      @connection = Faraday.new PUSH_URL
      @connection.basic_auth @@key, BASIC_PASSWORD
      @id = id
      @data = {}
    end
    
    def push
      @connection.post "#{PUSH_URL}/#{@id}", JSON.generate(@data)
    end


    def number value
      @data[:value] = value
    end

    def counter value, delta = nil
      # curl -v -u YOUR_API_KEY:unused -d '{"value": 783, ga}' https://push.ducksboard.com/values/235
      @data[:value] = value
      @data[:delta] = delta if delta.present?
    end

    def gauge
      # curl -v -u YOUR_API_KEY:unused -d '{"value": 0.93}' https://push.ducksboard.com/values/235
    end

    def graph
      # curl -v -u YOUR_API_KEY:unused -d '[{"timestamp":1337724000, "value": 1},
      #                      {"timestamp":1337810400, "value": 5}]' \
      # https://push.ducksboard.com/values/234
    end

    def bar
      # curl -v -u YOUR_API_KEY:unused -d '{"value": 60}' https://push.ducksboard.com/values/235
    end

    def box
      # curl -v -u YOUR_API_KEY:unused -d '{"value": 20}' https://push.ducksboard.com/values/235
      # curl -v -u YOUR_API_KEY:unused -d '{"value": 4843}' https://push.ducksboard.com/values/236
      # curl -v -u YOUR_API_KEY:unused -d '{"value": 125120}' https://push.ducksboard.com/values/237
      # curl -v -u YOUR_API_KEY:unused -d '{"value": 6874843}' https://push.ducksboard.com/values/238
    end

    def pin
      # curl -v -u YOUR_API_KEY:unused -d '{"value": 6124843}' https://push.ducksboard.com/values/235
      # curl -v -u YOUR_API_KEY:unused -d '{"value": 25120}' https://push.ducksboard.com/values/236
    end

    def image
      # curl -v -u YOUR_API_KEY:unused -d '{"timestamp": 1310649204, "value": {
      #                        "source": "data:image/png;base64,iVB...==",
      #                        "caption": "Ducksboard logo!"}}' \
      # https://push.ducksboard.com/values/235
    end

    def status
      # curl -v -u YOUR_API_KEY:unused -d '{
      #   "timestamp": 1310649204,
      #   "value": 0}' \
      # https://push.ducksboard.com/values/235
    end

    def text
      # curl -v -u YOUR_API_KEY:unused -d '{
      #   "timestamp": 1310649204,
      #   "value": {"content": "Text!\nLorem ipsum dolor sit amet..."}}' \
      # https://push.ducksboard.com/values/235
    end

    def timeline
      # curl -v -u YOUR_API_KEY:unused -d '{"timestamp": 1310649204, "value": {
      #                        "title": "error message",
      #                        "image": "https://app.ducksboard.com/static/img/timeline/red.gif",
      #                        "content": "Some details about my error message"}}' \
      # https://push.ducksboard.com/values/235
    end

    def leaderboard
    end

    def funnel
      # curl -v -u YOUR_API_KEY:unused -d '{"value": {"funnel": [
      #      {"name": "STEP 1", "value": 1600},
      #      {"name": "STEP 2", "value": 1400},
      #      {"name": "STEP 3", "value": 1200},
      #      {"name": "STEP 4", "value": 900},
      #      {"name": "STEP 5", "value": 600},
      #      {"name": "STEP 6", "value": 330}]}}' \
      # https://push.ducksboard.com/values/236
    end

    def completion
      # curl -v -u YOUR_API_KEY:unused -d '{
      # "value": {
      #     "current": 19790,
      #     "min": 0,
      #     "max": 25000 }}' \
      # https://push.ducksboard.com/values/236
    end

    alias_method :gauge, :number
    alias_method :bar, :number
    alias_method :box, :number
    alias_method :pin, :number
  end
end