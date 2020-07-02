require 'httparty'

class Api::V1::EnderecoController < Api::V1::ApiController
    
    def index 
        render json: Endereco.all        
    end    
    
    def show

        cep = params[:id]
        response = HTTParty.get("https://viacep.com.br/ws/#{cep}/json/")
        
        data = JSON.parse(response.body)

        if data['erro'].present?
                    
            payload = {
                error: "Não foi possível processar cep informado",
                status: 400
            }

            return render :json => payload, :status => :bad_request
        end

        #busca ou cria endereço buscado:
        @endereco = Endereco.find_or_create_by(cep: cep)
        @endereco.assign_attributes(data)

        #registra endereço:
        @endereco.save 
        
        return render json: @endereco, status: :created
        
    end 

end
