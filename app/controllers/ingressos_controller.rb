class IngressosController < ApplicationController
    def index
        @ingressos = Ingresso.all
    end
    def show
        @ingresso = Ingresso.find(params[:id])
    end
    def new
        @ingresso = Ingresso.new
    end
    def create
        #render plain: params[:ingresso].inspect
        @ingresso = Ingresso.new(ingresso_params)
        
        if(@ingresso.save)
            redirect_to @ingresso
        else
            render 'new'
        end
    end
    
    def edit
        @ingresso = Ingresso.find(params[:id])
    end
    
    def update 
        @ingresso = Ingresso.find(params[:id])

        if(@ingresso.update(ingresso_params))
            redirect_to @ingresso
        else
            render 'edit'
        end
    end
    #Para evitar o erro de atributo proibido, dizemos aqui quais parametros são permitidos
    private def ingresso_params
        params.require(:ingresso).permit(:nome, :preco, :taxa, :data)
    end
end
