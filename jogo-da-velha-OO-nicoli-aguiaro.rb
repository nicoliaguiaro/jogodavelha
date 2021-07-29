#
# Objetivos do Trabalho
#

# 1. Entregar uma versão refatorada Jogo da Velha, modo Orientação a Objetos
# Critérios de aceites:
# 1.1 Código compilando e sem quebrar
# 1.2 Tem que ter uma classe para a Tela, uma classe para Anotacao (anotação das jogadas) e uma classe Jogador
# OBS.: Se vocês julgarem necessário ter mais classes (além das obrigatórias), fiquem à vontade
# Entregar um código-fonte novo (jogo-da-velha-OO-<nome>.rb), com a versão OO do jogo da velha

class Tela

    JOGADAS_VAZIAS = Array.new(9, " ").freeze

    def desenha_tela(jogadas)
        linhas = []
        linhas.push "\n"
        linhas.push " #{jogadas[0]} | #{jogadas[1]} | #{jogadas[2]} "
        linhas.push "---|---|---"
        linhas.push " #{jogadas[3]} | #{jogadas[4]} | #{jogadas[5]} "
        linhas.push "---|---|---"
        linhas.push " #{jogadas[6]} | #{jogadas[7]} | #{jogadas[8]} "
        linhas.push "\n"
        puts linhas
    end
end

class AnotacaoJogadas < Tela

    def alguem_venceu?(jogadas)
        return false if jogadas == JOGADAS_VAZIAS
        return true if jogadas[0] != " " and jogadas[0] == jogadas[1] and jogadas[1] == jogadas[2]
        return true if jogadas[3] != " " and jogadas[3] == jogadas[4] and jogadas[4] == jogadas[5]
        return true if jogadas[6] != " " and jogadas[6] == jogadas[7] and jogadas[7] == jogadas[8]
        return true if jogadas[0] != " " and jogadas[0] == jogadas[3] and jogadas[3] == jogadas[6]
        return true if jogadas[1] != " " and jogadas[1] == jogadas[4] and jogadas[4] == jogadas[7]
        return true if jogadas[2] != " " and jogadas[2] == jogadas[5] and jogadas[5] == jogadas[8]
        return true if jogadas[0] != " " and jogadas[0] == jogadas[4] and jogadas[4] == jogadas[8]
        return true if jogadas[2] != " " and jogadas[2] == jogadas[4] and jogadas[4] == jogadas[6]
        return false
    end

    def tem_mais_jogadas?(jogadas)    
        return jogadas.include? " "
    end
end

class Jogador < AnotacaoJogadas

    def marca_jogada(jogador, jogadas)
        jogada_valida = false
        until jogada_valida
            print "Informe a jogada de #{jogador} (número de 1 a 9 ainda não foi jogado): "
            jogada = gets.chomp
            if jogada.to_i < 1 || jogada.to_i > 9  # que se a String não for possível, será retornado 0 
                next
                elsif jogadas[jogada.to_i-1] == "X" || jogadas[jogada.to_i-1] == "O"
                    next
                else
                jogada_valida = true  # ou simplesmente, break
            end
        end
        jogadas[jogada.to_i-1] = jogador
    end
end

class Jogo < Jogador
    def jogo_da_velha
        puts "JOGO DA VELHA"

        jogadas = Array.new(9, " ")

        desenha_tela jogadas
        jogador = "X"
        until alguem_venceu? jogadas or not tem_mais_jogadas? jogadas
            marca_jogada jogador, jogadas
            desenha_tela jogadas
            if jogador == "X"
                jogador = "O"
                else
                jogador = "X"
            end
        end
    end

    puts "\n"
    puts "FIM DE JOGO"
    puts "\n"

end

iniciar = Jogo.new
iniciar.jogo_da_velha