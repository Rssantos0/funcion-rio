# Define o salário base dos funcionários
SALARIO_BASE = 1500

# Define a classe base Funcionario
class Funcionario
  attr_accessor :nome, :cargo, :salario
  
  def initialize(nome, cargo, salario)
    @nome = nome
    @cargo = cargo
    @salario = salario
  end

  def to_s
    "Nome: #{@nome}, Cargo: #{@cargo}, Salário: R$#{'%.2f' % @salario}"
  end
end

# Define a classe FuncionarioCLT que herda de Funcionario
class FuncionarioCLT < Funcionario
  def initialize(nome)
    salario = SALARIO_BASE * 0.70  # 30% de desconto
    super(nome, "CLT", salario)
  end
end

# Define a classe FuncionarioGerente que herda de Funcionario
class FuncionarioGerente < Funcionario
  def initialize(nome, cargo)
    salario = SALARIO_BASE * 1.30  # 30% a mais
    super(nome, cargo, salario)
  end
end

# Função para exibir o menu
def exibir_menu
  puts "Bem-vindo ao sistema de cadastro de funcionários!"
  puts "1. Cadastrar funcionário base CLT"
  puts "2. Cadastrar funcionário GERENTE"
  puts "3. Sair"
  print "Escolha uma opção: "
end

# Função para coletar dados do funcionário
def coletar_dados_funcionario
  puts "Digite o nome do funcionário:"
  nome = gets.chomp
  { nome: nome }
end

def coletar_dados_funcionario_gerente
  dados = coletar_dados_funcionario
  puts "Digite a classe gerente (Gerente):"
  cargo = gets.chomp
  dados[:cargo] = cargo
  dados
end

# Função para salvar os dados do funcionário (aqui, apenas imprimimos)
def salvar_dados_funcionario(funcionario)
  puts "Funcionário cadastrado com sucesso!"
  puts funcionario
end

# Função principal do programa
def main
  funcionarios = []

  loop do
    exibir_menu
    opcao = gets.chomp.to_i

    case opcao
    when 1
      dados = coletar_dados_funcionario
      funcionario = FuncionarioCLT.new(dados[:nome])
      salvar_dados_funcionario(funcionario)
      funcionarios << funcionario
    when 2
      dados = coletar_dados_funcionario_gerente
      funcionario = FuncionarioGerente.new(dados[:nome], dados[:cargo])
      salvar_dados_funcionario(funcionario)
      funcionarios << funcionario
    when 3
      puts "Saindo do sistema..."
      break
    else
      puts "Opção inválida. Tente novamente."
    end

    # Pergunta se o usuário deseja continuar cadastrando
    puts "Deseja cadastrar outro funcionário? (s/n)"
    resposta = gets.chomp.downcase
    break unless resposta == 's'
  end
end

# Executa o programa
main
