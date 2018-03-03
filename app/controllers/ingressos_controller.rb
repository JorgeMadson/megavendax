class IngressosController < ApplicationController
    def index

    end
    def new

    end
    def create
        render plain: params[:ingresso].inspect
    end
end
