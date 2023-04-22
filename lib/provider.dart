import 'package:flutter/foundation.dart';
import 'dart:math';

class AppProvider extends ChangeNotifier {
  late String _level;
  late String _theme;
  dynamic _questionDrawn = {};
  bool _alreadyShuffled = false;
  final random = Random();
  late Map<String, String> selectedQuestion;

  bool get alreadyShuffled => _alreadyShuffled;

  final List<Map<String, String>> _portugueseNoob = [
    {"Qual é a língua oficial do Brasil?": "Português"},
    {"Qual é a língua oficial de Portugal?": "Português"},
    {"Qual é o plural de lápis?": "Lápis"},
    {"Qual é o plural de cidadão?": "Cidadãos"},
    {"Qual é o feminino de elefante?": "Elefanta"},
    {"Qual é o feminino de poeta?": "Poetisa"},
    {"Qual é o antônimo de claro?": "Escuro"},
    {"Qual é o antônimo de alto?": "Baixo"},
    {"Qual é o sinônimo de bonito?": "Lindo"},
    {"Qual é o sinônimo de inteligente?": "Esperto"},
    {"Como se escreve 20 em algarismos romanos?": "XX"},
    {"Como se escreve 50 em algarismos romanos?": "L"},
    {"Quantas letras tem o alfabeto português?": "26"},
    {"Quantas vogais tem o alfabeto português?": "5"},
    {"Quantas consoantes tem o alfabeto português?": "21"},
    {"Quem escreveu 'Os Lusíadas'?": "Luís Vaz de Camões"},
    {"Quem escreveu 'Dom Casmurro'?": "Machado de Assis"},
    {"Quem escreveu 'Grande Sertão: Veredas'?": "Guimarães Rosa"},
    {"Quem escreveu 'O Cortiço'?": "Aluísio Azevedo"},
    {"Quem escreveu 'Vidas Secas'?": "Graciliano Ramos"}
  ];

  final List<Map<String, String>> _portugueseSmartass = [
    {'Qual é a língua oficial de Portugal?': 'Português'},
    {'Qual é a capital de Portugal?': 'Lisboa'},
    {'Quem escreveu "Os Lusíadas"?': 'Luís Vaz de Camões'},
    {'Quem é o autor de "Dom Casmurro"?': 'Machado de Assis'},
    {'Quem é o autor de "Grande Sertão: Veredas"?': 'Guimarães Rosa'},
    {'Quem é o autor de "A Hora da Estrela"?': 'Clarice Lispector'},
    {'Quem é o autor de "O Auto da Compadecida"?': 'Ariano Suassuna'},
    {'Quem é o autor de "Vidas Secas"?': 'Graciliano Ramos'},
    {'Quem é o autor de "Capitães da Areia"?': 'Jorge Amado'},
    {
      'Quem é o autor de "Memórias Póstumas de Brás Cubas"?': 'Machado de Assis'
    },
    {'Qual é a moeda oficial de Portugal?': 'Euro'},
    {'Qual é a maior cidade de Portugal?': 'Lisboa'},
    {'Qual rio corta a cidade do Porto?': 'Douro'},
    {'Qual é a região vinícola mais famosa de Portugal?': 'Douro'},
    {'Qual é a serra mais alta de Portugal continental?': 'Estrela'},
    {'Qual é a maior ilha dos Açores?': 'São Miguel'},
    {'Qual é a maior ilha da Madeira?': 'Madeira'},
    {'Em que ano Portugal se tornou uma república?': '1910'},
    {'Em que ano Brasil declarou independência de Portugal?': '1822'},
    {'Quem foi o primeiro rei de Portugal?': 'Afonso Henriques'}
  ];

  final List<Map<String, String>> _portugueseBeast = [
    {"Qual é o plural de cônsul?": "Cônsules"},
    {"Qual é o plural de lápis?": "Lápis"},
    {"Qual é o plural de atlas?": "Atlas"},
    {"Qual é o plural de bônus?": "Bônus"},
    {"Qual é o plural de ônibus?": "Ônibus"},
    {"Qual é o plural de vírus?": "Vírus"},
    {"Qual é o plural de júri?": "Júris"},
    {"Qual é o plural de caráter?": "Caracteres"},
    {"Qual é o plural de mal?": "Males"},
    {"Qual é o plural de cidadão?": "Cidadãos"},
    {
      "Qual é a conjugação do verbo 'ver' na terceira pessoa do singular do presente do indicativo?":
          "Vê"
    },
    {
      "Qual é a conjugação do verbo 'vir' na terceira pessoa do singular do presente do indicativo?":
          "Vem"
    },
    {
      "Qual é a conjugação do verbo 'pôr' na terceira pessoa do singular do presente do indicativo?":
          "Põe"
    },
    {
      "Qual é a conjugação do verbo 'dar' na terceira pessoa do singular do presente do indicativo?":
          "Dá"
    },
    {
      "Qual é a conjugação do verbo 'estar' na terceira pessoa do singular do presente do indicativo?":
          "Está"
    },
    {
      "Qual é a conjugação do verbo 'ser' na terceira pessoa do singular do presente do indicativo?":
          "É"
    },
    {
      "Qual é a conjugação do verbo 'ter' na terceira pessoa do singular do presente do indicativo?":
          "Tem"
    },
    {
      "Qual é a conjugação do verbo 'fazer' na terceira pessoa do singular do presente do indicativo?":
          "Faz"
    },
    {
      "Qual é a conjugação do verbo 'ir' na terceira pessoa do singular do presente do indicativo?":
          "Vai"
    },
    {
      "Qual é a conjugação do verbo 'saber' na terceira pessoa do singular do presente do indicativo?":
          "Sabe"
    }
  ];

  final List<Map<String, String>> _tvandcultureNoob = [
    {'Quem criou Mickey Mouse?': 'Walt Disney'},
    {'Qual é a capital do cinema?': 'Hollywood'},
    {'Quem escreveu Harry Potter?': 'J.K. Rowling'},
    {'Qual é o nome do filme com Leonardo DiCaprio e um navio?': 'Titanic'},
    {'Qual é o nome do filme com um tubarão assassino?': 'Tubarão'},
    {'Quem é o diretor de Pulp Fiction?': 'Quentin Tarantino'},
    {'Qual é o nome do filme com um robô chamado Wall-E?': 'Wall-E'},
    {'Qual é o nome do filme com um ogro verde?': 'Shrek'},
    {'Quem é o autor de O Pequeno Príncipe?': 'Antoine de Saint-Exupéry'},
    {'Qual é o nome do filme com um leão chamado Simba?': 'Rei Leão'},
    {'Quem é o autor de Dom Quixote?': 'Miguel de Cervantes'},
    {
      'Qual é o nome do filme com uma menina e um monstro peludo?':
          'Monstros S.A.'
    },
    {'Quem escreveu Orgulho e Preconceito?': 'Jane Austen'},
    {'Qual é o nome do filme com um menino e um ET?': 'ET'},
    {'Quem é o autor de O Senhor dos Anéis?': 'J.R.R. Tolkien'},
    {'Qual é o nome do filme com uma princesa chamada Elsa?': 'Frozen'},
    {'Quem escreveu O Grande Gatsby?': 'F. Scott Fitzgerald'},
    {'Qual é o nome do filme com uma família de super-heróis?': 'Os Incríveis'},
    {'Quem escreveu Cem Anos de Solidão?': 'Gabriel García Márquez'},
    {
      'Qual é o nome do filme com um menino e um urso de pelúcia falante?':
          'Ted'
    }
  ];

  final List<Map<String, String>> _tvandcultureSmartass = [
    {"Quem escreveu 'Dom Casmurro'?": "Machado de Assis"},
    {"Quem pintou a Mona Lisa?": "Leonardo da Vinci"},
    {
      "Qual é o nome do filme que ganhou o Oscar de Melhor Filme em 2020?":
          "Parasita"
    },
    {"Quem é o autor de 'Cem Anos de Solidão'?": "Gabriel García Márquez"},
    {"Qual é a capital do cinema mundial?": "Hollywood"},
    {"Quem é o diretor de 'Pulp Fiction'?": "Quentin Tarantino"},
    {"Qual é a banda mais famosa de todos os tempos?": "The Beatles"},
    {"Quem é o autor de 'O Pequeno Príncipe'?": "Antoine de Saint-Exupéry"},
    {"Qual é a série mais assistida da Netflix?": "Squid Game"},
    {"Quem é o autor de 'Orgulho e Preconceito'?": "Jane Austen"},
    {
      "Qual é o nome do primeiro filme da saga Star Wars?": "Uma Nova Esperança"
    },
    {"Quem é o autor de 'O Senhor dos Anéis'?": "J.R.R. Tolkien"},
    {"Qual é a banda mais famosa do Brasil?": "Legião Urbana"},
    {"Quem é o autor de 'A Divina Comédia'?": "Dante Alighieri"},
    {
      "Qual é o nome do primeiro filme da saga Harry Potter?": "Pedra Filosofal"
    },
    {"Quem é o autor de 'Dom Quixote'?": "Miguel de Cervantes"},
    {"Qual é a série mais longa da televisão?": "Os Simpsons"},
    {"Quem é o autor de 'Crime e Castigo'?": "Fiódor Dostoiévski"},
    {
      "Qual é o nome do primeiro filme da saga Indiana Jones?":
          "Os Caçadores da Arca Perdida"
    },
    {"Quem é o autor de 'O Processo'?": "Franz Kafka"}
  ];

  final List<Map<String, String>> _tvandcultureBeast = [
    {'Quem dirigiu o filme Titanic?': 'James Cameron'},
    {'Qual é a série mais longa da TV?': 'Os Simpsons'},
    {'Quem escreveu "Cem Anos de Solidão"?': 'Gabriel García Márquez'},
    {'Quem pintou "A Noite Estrelada"?': 'Vincent van Gogh'},
    {'Qual é a ópera mais famosa de Mozart?': 'A Flauta Mágica'},
    {'Quem é o autor de "Dom Quixote"?': 'Miguel de Cervantes'},
    {'Quem compôs a música "Bohemian Rhapsody"?': 'Queen'},
    {'Quem escreveu "Orgulho e Preconceito"?': 'Jane Austen'},
    {'Qual é o nome do primeiro álbum dos Beatles?': 'Please Please Me'},
    {'Quem é o autor de "O Grande Gatsby"?': 'F. Scott Fitzgerald'},
    {'Quem dirigiu o filme "Pulp Fiction"?': 'Quentin Tarantino'},
    {'Qual é a banda mais vendida de todos os tempos?': 'The Beatles'},
    {'Quem escreveu "O Sol é para Todos"?': 'Harper Lee'},
    {'Qual é o nome do primeiro filme de Star Wars?': 'Uma Nova Esperança'},
    {'Quem pintou a Mona Lisa?': 'Leonardo da Vinci'},
    {'Qual é o nome do primeiro livro de Harry Potter?': 'Pedra Filosofal'},
    {'Quem escreveu "O Senhor dos Anéis"?': 'J.R.R. Tolkien'},
    {'Qual é a banda mais famosa da Inglaterra?': 'The Beatles'},
    {'Quem dirigiu o filme "O Poderoso Chefão"?': 'Francis Ford Coppola'},
    {'Qual é o nome do primeiro álbum de Michael Jackson?': 'Got to Be There'}
  ];

  final List<Map<String, String>> _sciencesNoob = [
    {"Qual é a fórmula química da água?": "H2O"},
    {"Quantos elementos tem a tabela periódica?": "118"},
    {"Qual é o maior órgão do corpo humano?": "Pele"},
    {
      "Qual é o nome do processo de transformação de um líquido em gás?":
          "Evaporação"
    },
    {"Qual é a unidade de medida da força?": "Newton"},
    {
      "Qual é o nome do processo de transformação de um gás em líquido?":
          "Condensação"
    },
    {"Qual é a unidade de medida da energia?": "Joule"},
    {"Qual é a unidade de medida da temperatura?": "Kelvin"},
    {"Qual é a unidade de medida da massa?": "Quilograma"},
    {"Qual é a unidade de medida da corrente elétrica?": "Ampere"},
    {
      "Qual é o nome do processo de transformação de um sólido em gás?":
          "Sublimação"
    },
    {"Quantos planetas tem o sistema solar?": "8"},
    {
      "Qual é o nome do processo de transformação de um gás em sólido?":
          "Deposição"
    },
    {"O que significa DNA?": "Ácido desoxirribonucleico"},
    {"O que significa RNA?": "Ácido ribonucleico"},
    {"O que significa ATP?": "Trifosfato de adenosina"},
    {"O que significa ADP?": "Difosfato de adenosina"},
    {"O que significa NADH?": "Nicotinamida adenina dinucleotídeo"},
    {"O que significa FADH2?": "Flavina adenina dinucleotídeo"},
    {"O que significa GTP?": "Trifosfato de guanosina"}
  ];

  final List<Map<String, String>> _sciencesSmartass = [
    {'Óptica é o estudo de quê?': 'Luz'},
    {'O que significa DNA?': 'Ácido desoxirribonucleico'},
    {'Qual missão Apollo levou um veículo lunar?': 'Apollo 15'},
    {
      'Qual foi o nome do primeiro satélite artificial lançado pela União Soviética em 1957?':
          'Sputnik'
    },
    {'Qual é o tipo de sangue mais raro?': 'AB negativo'},
    {'A Terra tem quantas camadas?': 'Três'},
    {'Sapos pertencem a qual grupo animal?': 'Anfíbios'},
    {
      'O que é a Unidade Astronômica (UA)?': 'Distância média entre Terra e Sol'
    },
    {'Qual é o nome geral dado aos satélites naturais?': 'Luas'},
    {'Humanos e chimpanzés compartilham quanto DNA?': '98%'},
    {'Qual é o órgão mais pesado do corpo humano?': 'Fígado'},
    {'Qual é conhecida como a “glândula mestra” do corpo humano?': 'Hipófise'},
    {'Quanto mais alta fica a Torre Eiffel durante o verão?': '15 cm'},
    {'Qual é o único planeta que gira no sentido horário?': 'Vênus'},
    {
      'A Nebulosa Cabeça de Cavalo pode ser encontrada em qual constelação?':
          'Órion'
    },
    {'Qual é a planta de crescimento mais rápido do mundo?': 'Bambu'},
    {'Com que frequência o Cometa Halley aparece no céu?': '76 anos'},
    {'Que rocha derretida eventualmente se torna lava?': 'Magma'},
    {'Em que continente você não encontraria abelhas?': 'Antártida'},
    {'Quantos planetas em nosso sistema solar têm luas?': 'Seis'}
  ];

  final List<Map<String, String>> _sciencesBeast = [
    {'Qual é a fórmula química da água?': 'H2O'},
    {'Qual é o elemento químico mais abundante no universo?': 'Hidrogênio'},
    {
      'Qual é a unidade de medida de força no Sistema Internacional de Unidades?':
          'Newton'
    },
    {'Quem é conhecido como o pai da física moderna?': 'Isaac Newton'},
    {'Qual é a velocidade da luz no vácuo?': '299792458 m/s'},
    {'Qual é a fórmula química do ácido sulfúrico?': 'H2SO4'},
    {'Quem propôs a teoria da relatividade geral?': 'Albert Einstein'},
    {
      'Qual é o nome do processo pelo qual as plantas produzem seu próprio alimento?':
          'Fotossíntese'
    },
    {'Qual é o nome do maior osso do corpo humano?': 'Fêmur'},
    {'Quem foi o primeiro ser humano a viajar para o espaço?': 'Yuri Gagarin'},
    {
      'Qual é a unidade de medida de energia no Sistema Internacional de Unidades?':
          'Joule'
    },
    {
      'Quem propôs a teoria da evolução das espécies por seleção natural?':
          'Charles Darwin'
    },
    {
      'Qual é o nome do processo pelo qual as células se dividem para formar novas células?':
          'Mitose'
    },
    {
      'Qual é o nome do processo pelo qual os seres vivos obtêm energia dos alimentos?':
          'Respiração celular'
    },
    {'Quem descobriu a penicilina?': 'Alexander Fleming'},
    {'Qual é a fórmula química do dióxido de carbono?': 'CO2'},
    {'Quem foi o primeiro ser humano a pisar na Lua?': 'Neil Armstrong'},
    {
      'Qual é o nome do processo pelo qual os seres vivos produzem novos indivíduos de sua espécie?':
          'Reprodução'
    },
    {
      'Quem propôs a teoria do Big Bang para explicar a origem do universo?':
          'Georges Lemaître'
    },
    {
      'Qual é o nome do processo pelo qual os seres vivos eliminam resíduos e substâncias tóxicas de seu corpo?':
          'Excreção'
    }
  ];

  final List<Map<String, String>> _sportsNoob = [
    {"Qual é o esporte mais popular do mundo?": "Futebol"},
    {"Qual é o nome do estádio do time de futebol Barcelona?": "Camp Nou"},
    {
      "Quem é o maior medalhista olímpico de todos os tempos?": "Michael Phelps"
    },
    {"Em que país foram realizadas as Olimpíadas de 2016?": "Brasil"},
    {"Quantos jogadores há em um time de basquete?": "Cinco"},
    {"Qual é a duração de uma partida de futebol?": "90 minutos"},
    {"Em que esporte é usado o termo 'home run'?": "Beisebol"},
    {
      "Quem é o jogador de futebol com mais gols na história da Copa do Mundo?":
          "Miroslav Klose"
    },
    {"Em que esporte é usado o termo 'ace'?": "Tênis"},
    {"Quantos jogadores há em um time de vôlei?": "Seis"},
    {"Qual é a duração de uma partida de basquete?": "48 minutos"},
    {"Em que esporte é usado o termo 'birdie'?": "Golfe"},
    {
      "Quem é o jogador de basquete com mais pontos na história da NBA?":
          "Kareem Abdul-Jabbar"
    },
    {"Em que país foram realizadas as Olimpíadas de 2012?": "Reino Unido"},
    {"Quantos jogadores há em um time de futebol americano?": "Onze"},
    {"Qual é a duração de uma partida de vôlei?": "Indeterminado"},
    {"Em que esporte é usado o termo 'knockout'?": "Boxe"},
    {
      "Quem é o jogador de tênis com mais títulos de Grand Slam na história?":
          "Novak Djokovic"
    },
    {"Em que país foram realizadas as Olimpíadas de 2008?": "China"},
    {"Quantos jogadores há em um time de hóquei no gelo?": "Seis"}
  ];

  final List<Map<String, String>> _sportsSmartass = [
    {'Qual é o país de origem do futebol?': 'Inglaterra'},
    {'Quem é o maior campeão da NBA?': 'Boston Celtics'},
    {'Quem é o maior campeão da F1?': 'Lewis Hamilton'},
    {'Qual é o país de origem do judô?': 'Japão'},
    {'Quem é o maior campeão da Copa do Mundo?': 'Brasil'},
    {'Qual é o país de origem do tênis?': 'França'},
    {'Quem é o maior campeão da NFL?': 'Green Bay Packers'},
    {'Qual é o país de origem do vôlei?': 'Estados Unidos'},
    {'Quem é o maior campeão da NHL?': 'Montreal Canadiens'},
    {'Qual é o país de origem do basquete?': 'Estados Unidos'},
    {'Quem é o maior campeão da MLB?': 'New York Yankees'},
    {'Qual é o país de origem do rugby?': 'Inglaterra'},
    {'Quem é o maior campeão da UEFA Champions League?': 'Real Madrid'},
    {'Qual é o país de origem do críquete?': 'Inglaterra'},
    {'Quem é o maior campeão da Copa América?': 'Uruguai'},
    {'Qual é o país de origem do boxe?': 'Egito'},
    {'Quem é o maior campeão da Copa Libertadores?': 'Independiente'},
    {'Qual é o país de origem do hóquei no gelo?': 'Canadá'},
    {'Quem é o maior campeão da Copa Davis?': 'Estados Unidos'},
    {'Qual é o país de origem do badminton?': 'Índia'}
  ];

  final List<Map<String, String>> _sportsBeast = [
    {'Quem é o maior medalhista olímpico?': 'Michael Phelps'},
    {'Qual é o país com mais Copas do Mundo?': 'Brasil'},
    {
      'Quem é o maior artilheiro da história da Copa do Mundo?':
          'Miroslav Klose'
    },
    {'Qual é o país com mais medalhas olímpicas?': 'EUA'},
    {'Qual é o país com mais medalhas de ouro olímpicas?': 'EUA'},
    {
      'Quem é o maior artilheiro da história da UEFA Champions League?':
          'Cristiano Ronaldo'
    },
    {'Qual é o país com mais títulos da Copa América?': 'Uruguai'},
    {'Quem é o maior artilheiro da história da NBA?': 'Kareem Abdul-Jabbar'},
    {'Qual é o país com mais títulos da Copa Davis?': 'EUA'},
    {'Quem é o maior artilheiro da história da NFL?': 'Adam Vinatieri'},
    {
      'Qual é o país com mais títulos da Copa do Mundo de Rugby?':
          'Nova Zelândia'
    },
    {'Quem é o maior artilheiro da história da NHL?': 'Wayne Gretzky'},
    {
      'Qual é o país com mais títulos da Copa do Mundo de Críquete?':
          'Austrália'
    },
    {
      'Quem é o maior artilheiro da história do futebol inglês?': 'Alan Shearer'
    },
    {'Qual é o país com mais títulos do Tour de France?': 'França'},
    {
      'Quem é o maior artilheiro da história do futebol espanhol?':
          'Lionel Messi'
    },
    {
      'Qual é o país com mais títulos do Campeonato Mundial de Vôlei Masculino?':
          'Rússia'
    },
    {
      'Quem é o maior artilheiro da história do futebol italiano?':
          'Silvio Piola'
    },
    {
      'Qual é o país com mais títulos do Campeonato Mundial de Handebol Masculino?':
          'França'
    },
    {'Quem é o maior artilheiro da história do futebol alemão?': 'Gerd Müller'},
  ];

  final List<Map<String, String>> _historyNoob = [
    {"Quem descobriu o Brasil?": "Pedro Álvares Cabral"},
    {
      "Quem foi o primeiro presidente do Brasil?": "Marechal Deodoro da Fonseca"
    },
    {"Em que ano foi a independência do Brasil?": "1822"},
    {"Quem proclamou a República no Brasil?": "Marechal Deodoro da Fonseca"},
    {"Qual foi a primeira capital do Brasil?": "Salvador"},
    {"Quem foi o primeiro imperador do Brasil?": "Dom Pedro I"},
    {"Em que ano foi a Proclamação da República no Brasil?": "1889"},
    {"Quem foi o segundo imperador do Brasil?": "Dom Pedro II"},
    {"Qual foi a segunda capital do Brasil?": "Rio de Janeiro"},
    {"Em que ano começou a Primeira Guerra Mundial?": "1914"},
    {"Em que ano terminou a Primeira Guerra Mundial?": "1918"},
    {"Em que ano começou a Segunda Guerra Mundial?": "1939"},
    {"Em que ano terminou a Segunda Guerra Mundial?": "1945"},
    {
      "Quem foi o líder da Alemanha durante a Segunda Guerra Mundial?":
          "Adolf Hitler"
    },
    {"Qual país lançou bombas atômicas em Hiroshima e Nagasaki?": "EUA"},
    {"Em que ano caiu o Muro de Berlim?": "1989"},
    {"Quem foi o primeiro homem a pisar na Lua?": "Neil Armstrong"},
    {"Em que ano o homem pisou na Lua pela primeira vez?": "1969"},
    {
      "Quem foi o líder da União Soviética durante a Segunda Guerra Mundial?":
          "Joseph Stalin"
    },
    {
      "Qual é o nome do período histórico em que ocorreu a Revolução Industrial?":
          "Século XVIII"
    },
  ];

  final List<Map<String, String>> _historySmartass = [
    {'Quem descobriu o Brasil?': 'Pedro Álvares Cabral'},
    {
      'Quem foi o primeiro presidente do Brasil?': 'Marechal Deodoro da Fonseca'
    },
    {'Em que ano ocorreu a Revolução Francesa?': '1789'},
    {'Quem foi o primeiro homem a pisar na Lua?': 'Neil Armstrong'},
    {'Em que ano caiu o Muro de Berlim?': '1989'},
    {'Quem foi o líder da Revolução Cubana?': 'Fidel Castro'},
    {'Em que ano começou a Primeira Guerra Mundial?': '1914'},
    {'Quem foi o primeiro imperador do Brasil?': 'Dom Pedro I'},
    {'Em que ano ocorreu a Proclamação da República no Brasil?': '1889'},
    {'Quem foi o líder da independência da Índia?': 'Mahatma Gandhi'},
    {'Em que ano ocorreu a Revolução Russa?': '1917'},
    {'Quem foi o primeiro presidente dos Estados Unidos?': 'George Washington'},
    {'Em que ano começou a Segunda Guerra Mundial?': '1939'},
    {
      'Quem foi o líder da Alemanha nazista durante a Segunda Guerra Mundial?':
          'Adolf Hitler'
    },
    {'Em que ano ocorreu a independência dos Estados Unidos?': '1776'},
    {'Quem foi o líder da Revolução Chinesa?': 'Mao Tsé-Tung'},
    {'Em que ano ocorreu a Queda do Império Romano do Ocidente?': '476'},
    {
      'Quem foi o líder da União Soviética durante a Segunda Guerra Mundial?':
          'Joseph Stalin'
    },
    {'Em que ano ocorreu a independência do Brasil?': '1822'},
    {'Quem foi o líder da Revolução Iraniana de 1979?': 'Ruhollah Khomeini'},
  ];

  final List<Map<String, String>> _historyBeast = [
    {'Quem foi o primeiro presidente dos EUA?': 'George Washington'},
    {'Quem escreveu a Ilíada e a Odisseia?': 'Homero'},
    {'Qual foi a primeira capital do Brasil?': 'Salvador'},
    {'Quem foi o primeiro homem a pisar na Lua?': 'Neil Armstrong'},
    {'Qual foi o primeiro imperador romano?': 'Augusto'},
    {'Quem foi o líder da Revolução Russa de 1917?': 'Vladimir Lênin'},
    {'Qual foi a primeira guerra mundial?': '1914-1918'},
    {'Quem foi o primeiro imperador do Brasil?': 'Pedro I'},
    {'Qual foi a primeira civilização da América?': 'Olmeca'},
    {'Quem foi o líder da independência da Índia?': 'Mahatma Gandhi'},
    {'Qual foi a primeira dinastia chinesa?': 'Xia'},
    {'Quem foi o líder da Revolução Cubana?': 'Fidel Castro'},
    {'Qual foi a primeira cidade-estado grega?': 'Atenas'},
    {'Quem foi o líder da Revolução Francesa?': 'Maximilien Robespierre'},
    {'Qual foi a primeira civilização mesopotâmica?': 'Suméria'},
    {'Quem foi o líder da independência dos EUA?': 'George Washington'},
    {'Qual foi a primeira civilização egípcia?': 'Antigo Egito'},
    {'Quem foi o líder da independência do Haiti?': 'Toussaint Louverture'},
    {'Qual foi a primeira civilização africana?': 'Núbia'},
    {
      'Quem foi o líder da independência do México?':
          'Miguel Hidalgo y Costilla'
    },
  ];

  final List<Map<String, String>> _geographyNoob = [
    {"Qual é a capital do Brasil?": "Brasília"},
    {"Qual é o maior país do mundo?": "Rússia"},
    {"Qual é o menor país do mundo?": "Vaticano"},
    {"Qual é o rio mais longo do mundo?": "Amazonas"},
    {"Qual é o deserto mais quente do mundo?": "Lut"},
    {"Qual é o continente mais populoso?": "Ásia"},
    {"Qual é a montanha mais alta do mundo?": "Everest"},
    {"Qual é a capital da Itália?": "Roma"},
    {"Qual é a capital da Espanha?": "Madri"},
    {"Qual é a capital da Alemanha?": "Berlim"},
    {"Qual é a capital da Inglaterra?": "Londres"},
    {"Qual é a capital dos Estados Unidos?": "Washington, D.C."},
    {"Qual é a capital da Austrália?": "Canberra"},
    {"Qual é a capital da Argentina?": "Buenos Aires"},
    {"Qual é a capital do Canadá?": "Ottawa"},
    {"Quantos países existem na União Europeia?": "27"},
    {"Quantos estados tem o Brasil?": "26"},
    {"Quantos continentes existem no mundo?": "7"},
    {"Em que continente fica o Egito?": "África"},
    {"Em que continente fica a Austrália?": "Oceania"},
  ];

  final List<Map<String, String>> _geographySmartass = [
    {'Qual é a capital do Brasil?': 'Brasília'},
    {'Qual é o maior país do mundo?': 'Rússia'},
    {'Qual é o menor país do mundo?': 'Vaticano'},
    {'Qual é a montanha mais alta do mundo?': 'Everest'},
    {'Qual é o rio mais longo do mundo?': 'Amazonas'},
    {'Qual é o deserto mais seco do mundo?': 'Atacama'},
    {'Qual é o oceano mais profundo do mundo?': 'Pacífico'},
    {'Qual é a cidade mais populosa do mundo?': 'Tóquio'},
    {'Qual é a língua mais falada no mundo?': 'Inglês'},
    {'Quantos países existem no mundo?': '195'},
    {'Qual é a moeda mais usada no mundo?': 'Dólar'},
    {'Quantos continentes existem no mundo?': '7'},
    {'Qual é o país mais populoso do mundo?': 'China'},
    {'Qual é a capital da Austrália?': 'Canberra'},
    {'Qual é a capital da Espanha?': 'Madri'},
    {'Qual é a capital da Itália?': 'Roma'},
    {'Qual é a capital da Alemanha?': 'Berlim'},
    {'Qual é a capital da Rússia?': 'Moscou'},
    {'Qual é a capital da China?': 'Pequim'},
    {'Qual é a capital dos Estados Unidos?': 'Washington, D.C.'},
  ];

  final List<Map<String, String>> _geographyBeast = [
    {'Qual é a capital da Austrália?': 'Canberra'},
    {'Qual é o maior deserto do mundo?': 'Antártica'},
    {'Qual é o rio mais longo do mundo?': 'Amazonas'},
    {'Qual é a montanha mais alta do mundo?': 'Everest'},
    {'Qual é o país mais populoso do mundo?': 'China'},
    {'Qual é o país com a maior área territorial?': 'Rússia'},
    {'Qual é o menor país do mundo?': 'Vaticano'},
    {'Qual é a cidade mais populosa do mundo?': 'Tóquio'},
    {'Qual é o oceano mais profundo do mundo?': 'Pacífico'},
    {'Qual é o lago mais profundo do mundo?': 'Baikal'},
    {'Qual é a maior ilha do mundo?': 'Groenlândia'},
    {'Qual é a maior floresta tropical do mundo?': 'Amazônia'},
    {'Qual é a maior cachoeira do mundo?': 'Angel'},
    {'Qual é a maior península do mundo?': 'Arábia'},
    {'Qual é o país mais frio do mundo?': 'Antártica'},
    {'Qual é a capital da Nova Zelândia?': 'Wellington'},
    {'Qual é o ponto mais alto da África?': 'Kilimanjaro'},
    {'Quantos países existem na União Europeia?': '27'},
    {'Quantos estados tem os Estados Unidos da América?': '50'},
    {'Quantos países fazem fronteira com o Brasil?': '10'},
  ];

  String get level => _level;
  String get theme => _theme;

  List<Map<String, String>> get geography {
    if (level == 'noob') {
      return _geographyNoob;
    }
    if (level == 'smartass') {
      return _geographySmartass;
    }
    return _geographyBeast;
  }

  List<Map<String, String>> get history {
    if (level == 'noob') {
      return _historyNoob;
    }
    if (level == 'smartass') {
      return _historySmartass;
    }
    return _historyBeast;
  }

  List<Map<String, String>> get sports {
    if (level == 'noob') {
      return _sportsNoob;
    }
    if (level == 'smartass') {
      return _sportsSmartass;
    }
    return _sportsBeast;
  }

  List<Map<String, String>> get sciences {
    if (level == 'noob') {
      return _sciencesNoob;
    }
    if (level == 'smartass') {
      return _sciencesSmartass;
    }
    return _sciencesBeast;
  }

  List<Map<String, String>> get tvandculture {
    if (level == 'noob') {
      return _tvandcultureNoob;
    }
    if (level == 'smartass') {
      return _tvandcultureSmartass;
    }
    return _tvandcultureBeast;
  }

  List<Map<String, String>> get portuguese {
    if (level == 'noob') {
      return _portugueseNoob;
    }
    if (level == 'smartass') {
      return _portugueseSmartass;
    }
    return _portugueseBeast;
  }

  Map<String, String> get question => selectedQuestion;

  void selectQuestion() {
    List<Map<String, String>> dquestion;

    switch (theme) {
      case "tvandculture":
        dquestion = tvandculture;
        getQuestion(dquestion);
        break;
      case "sciences":
        dquestion = sciences;
        getQuestion(dquestion);
        break;
      case "sports":
        dquestion = sports;
        getQuestion(dquestion);
        break;
      case "history":
        dquestion = history;
        getQuestion(dquestion);
        break;
      case "geography":
        dquestion = geography;
        getQuestion(dquestion);
        break;
      case "portuguese":
        dquestion = portuguese;
        getQuestion(dquestion);
        break;
      default:
        selectedQuestion = {
          "Pergunta não encontrada": "Pergunta não encontrada"
        };
        break;
    }
  }

  void getQuestion(List<Map<String, String>> dquestion) {
    int x;
    if (!_questionDrawn.containsKey(_level)) {
      _questionDrawn[_level] = {};
    }
    if (!_questionDrawn[_level].containsKey(_theme)) {
      _questionDrawn[_level][_theme] = [];
    }

    if (_questionDrawn[_level][_theme].length == dquestion.length) {
      _questionDrawn[_level][_theme] = [];
    }

    do {
      x = 0 + random.nextInt(dquestion.length - 0);
    } while (_questionDrawn[_level][_theme].contains(x));
    _questionDrawn[_level][_theme].add(x);
    print(_questionDrawn);
    // return dquestion[x];
    selectedQuestion = dquestion[x];
  }

  void changeLevel(String l) {
    _level = l;
    notifyListeners();
  }

  void changeTheme(String t) {
    _theme = t;
    notifyListeners();
  }

  void resetGame() {
    _questionDrawn = {};
    _alreadyShuffled = false;
  }

  void shuffle() {
    if (!_alreadyShuffled) {
      _alreadyShuffled = true;
    }
  }
}
