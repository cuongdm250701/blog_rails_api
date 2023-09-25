class PingController < ApplicationController
    def pong
        json_response({message: 'pong'})
    end
end