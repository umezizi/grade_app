class HealthCheckController < ApplicationController
  def index
    #ヘルスチェック用
    render json: '{ "status": "ok" }'
  end
end
