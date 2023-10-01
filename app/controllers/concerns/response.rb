module Response
    def json_response(object, status = :ok)
        render json: object, status: status
    end

    def error_response(status = :error)
        json_response(message: :error, status: status)
    end
end