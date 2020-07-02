class Endereco < ApplicationRecord
    validates :cep, presence: true
end
