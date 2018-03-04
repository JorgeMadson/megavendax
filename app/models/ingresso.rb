class Ingresso < ApplicationRecord
    validates :nome, presence: true,
                        length: {minimum: 5}
    validates :preco, presence: true,
                        length: {minimum: 1}
    validates :taxa, presence: true,
                        length: {minimum: 1}
    validates :data, presence: true,
                        length: {minimum: 8}
end
