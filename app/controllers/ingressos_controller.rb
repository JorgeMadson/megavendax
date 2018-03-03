class IngressosController < ApplicationController
    def index

    end
    def show
        @ingresso = Ingresso.find(params[:id])
    end
    def new

    end
    def create
        #render plain: params[:ingresso].inspect
        @ingresso = Ingresso.new(ingresso_params)
        
        @ingresso.save
        redirect_to @ingresso
    end
    
    #Para evitar o erro de atributo proibido, dizemos aqui quais parametros são permitidos
    private def ingresso_params
        params.require(:ingresso).permit(:nome, :preco, :taxa, :data)
    end
end
