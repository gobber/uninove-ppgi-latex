# Template LaTeX PPGI

Este é um template LaTeX para teses e disssertações desenvolvido para o PPGI (Programa de Pós Graduação em Informática e Gestão do Conhecimento) da Uninove. Ele é uma modificação e extensão do template do IME USP desenvolvido pelo professor Jesús P. Mena-Chalco:

* [http://latex-exemplo.blogspot.com.br/2015/11/modelo-latex-para-dissertacoes-e-teses.html](http://latex-exemplo.blogspot.com.br/2015/11/modelo-latex-para-dissertacoes-e-teses.html)

Observação: Sempre olhar a seção de novidades.

# Novidades

- Incluído um arquivo **clean.bat** para limpar arquivos temporários do LateX. É recomendável rodar esse arquivo toda vez que você incluir novas referências no seu arquivo *.bib*, pois o cash do bibtex as vezes não atualiza sozinho e ele não adiciona a novas referências.

# Incluindo o template

O template é incluido da seguinte forma:

```Tex
\documentclass[nome da fonte]{uninove-ppgi}
```

Atualmente são suportadas as fontes **courier** e **times**. Junto com o template são incluidos diversos pacotes. Consulte o [source](https://github.com/gobber/uninove-ppgi-latex/blob/master/uninove-ppgi.cls) para mais informações.

# Comandos

O pacote provê diversos comandos para as mais diversas tarefas para contrução de teses e disssertações.

## Capa

Para gerar a capa é necessário antes carregar as seguintes informações:

```Tex
\Universidade{Nome da universidade}
\Programa{Nome do programa}
\Autor{Nome do autor}
\Titulo{Título da tese ou dissertação}
\Tipoexame{Qualificação ou defesa}
\Titulacao{Mestre ou Doutor}
\Orientador{Nome do orientador}
\Ano{Ano}
```

Basta posteriormente chamar o seguinte comando para gerar a capa:

```Tex
\capa
```

Com as mesmas informações podemos gerar a folha de rosto:

```Tex
\folharosto
```

## Agradecimentos

Podemos escrever agradecimentos por meio do seguinte *environment*:

```Tex
\begin{agradecimentos}

   Conteúdo

\end{agradecimentos}
```

## Resumo

Para gerar o resumo em português primeiro passamos as palavras chave:

```Tex
\PalavrasChave{Palavra1, Palavra2,...,PalavraN}
```

Posteriormente fazemos a chamada do seguinte *environment* que já adiciona as palavras chave configuradas acima:

```Tex
\begin{resumo}

   Resumo...	

\end{resumo}
```

Para gerar o resumo em inglês passamos as palavras chave:

```Tex
\KeyWords{Word1, Word2,...,WordN}
```

E então fazemos a chamda do seguinte *environment* que já adiciona as palavras chave em inglês configuradas acima:

```Tex
\begin{abstract}

   Content...

\end{abstract}
```

## Lista de abreviaturas

A lista de abreviaturas é gerada internamente com o uso do *environment tabular*. É necessário incluir um caracter % antes da chamada para evitar edentação automática.

```Tex
% Sempre colocar o símbolo percentual em frente da chamada do *environment*
% Não adicionar espaçamento vertical depois da chamada do *environment*
% Não incluir \\ na última abreviatura

\begin{listaabreviaturas}%
   MM & Morfologia matemática \\
   CC & Componente conexo \\
   EE & Elemento estruturante
\end{listaabreviaturas}
```

## Lista de símbolos

Analogamente a lista de abreviaturas podemos gerar uma lista de símbolos. Em geral queremos agrupar símbolos por tipo, por isto temos um comando para gerar cada lista. Note que, também é necessário incluir um caracter % antes da chamada para evitar edentação automática.

```Tex
% Sempre colocar o símbolo percentual em frente da chamada do *environment*
% Não adicionar espaçamento vertical depois da chamada do *environment*
% Não incluir \\ no último símbolo

\simbolos{Nome do agrupamento}{%
  símbolo & significado\\
  símbolo 2 & significado 2
}
```

Com auxilio do comando acima criamos as listas de símbolos com o seguinte *environment*:

```Tex
% Sempre colocar o símbolo percentual em frente da chamada do *environment*
% Não adicionar espaçamento vertical depois da chamada do *environment*

\begin{listasimbolos}%
\simbolos{Conceitos básicos} {%
  $ \mathbb{Z} $ & Conjunto dos números inteiros \\
  $ \mathbb{N} $ & Conjunto dos números naturais \\
  $ \mathbb{R} $ & Conjunto dos números reais
}
\simbolos{Imagens} {%
  $ f \text{ e } g $ & Variáveis que representam imagens \\
  $ p, q \in \mathcal{D} $ & Variáveis que representam pares $ (x,y) $ aqui chamados de \textit{pixels}
}
\end{listasimbolos}
```
# Outros

## Configurações adicionais

Os *environments* **\chapter, \section, \subsection e \subsubsection** estão configurados de acordo com o template. Além de customizações a nível de cabeçalho, rodapé e citações (contadores de citações). Para mais informações veja o exemplo [main.tex](https://github.com/gobber/uninove-ppgi-latex/blob/master/main.tex) que vem acompanhado com o template.

## Extras

Dentro do exemplo é fornecido um arquivo de *shell* linux **clean.sh** para excluir arquivos temporários gerados pelo LaTeX que muitas vezes atrapalham o desenvolvimento (arquivos de *cash* do bibtex as vezes não adicionam as referências novas):
```
# chamar o arquivo pelo terminal
sh ./clean.sh
```

Para usuários *windows* existe um arquivo **clean.bat** que faz o mesmo papel.

# Autor

Podem me enviar um e-mail se houver alguma dúvida.

* **Charles Gobber** - charles26f@gmail.com


