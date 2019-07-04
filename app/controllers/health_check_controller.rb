class HealthCheckController < ApplicationController
  def index
    # ヘルスチェック用にjsonを返す
    render json: '{ "status": "ok" }'
  end
end
