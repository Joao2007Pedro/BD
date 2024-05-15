-- A) A quantidade de livros agrupado pelo nome do gênero
  SELECT g.nomeGenero, COUNT(l.codLivro) AS QuantidadeLivros
  FROM tbGenero g
  LEFT JOIN tbLivro l ON g.codGenero = l.codGenero
  GROUP BY g.nomeGenero;

-- B) A soma das páginas agrupada pelo nome do autor
  SELECT a.nomeAutor, SUM(l.numPaginas) AS SomaPaginas
  FROM tbAutor a
  LEFT JOIN tbLivro l ON a.codAutor = l.codAutor
  GROUP BY a.nomeAutor;

-- C) A média de páginas agrupada pelo nome do autor em ordem alfabética (de A a Z)
  SELECT a.nomeAutor, AVG(l.numPaginas) AS MediaPaginas
  FROM tbAutor a
  LEFT JOIN tbLivro l ON a.codAutor = l.codAutor
  GROUP BY a.nomeAutor
  ORDER BY a.nomeAutor ASC;

-- D) A quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A)
  SELECT e.nomeEditora, COUNT(l.codLivro) AS QuantidadeLivros
  FROM tbEditora e
  RIGHT JOIN tbLivro l ON e.codEditora = l.codEditora
  GROUP BY e.nomeEditora
  ORDER BY e.nomeEditora DESC;

-- E) A soma de páginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra “C”
  SELECT a.nomeAutor, SUM(l.numPaginas) AS SomaPaginas
  FROM tbAutor a
  LEFT JOIN tbLivro l ON a.codAutor = l.codAutor
  WHERE a.nomeAutor LIKE 'C%'
  GROUP BY a.nomeAutor;

-- F) A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja “Machado de Assis” ou “Cora Coralina” ou “Graciliano Ramos” ou “Clarice Lispector”
  SELECT a.nomeAutor, COUNT(l.codLivro) AS QuantidadeLivros
  FROM tbAutor a
  LEFT JOIN tbLivro l ON a.codAutor = l.codAutor
  WHERE a.nomeAutor IN ('Machado de Assis', 'Cora Coralina', 'Graciliano Ramos', 'Clarice Lispector')
  GROUP BY a.nomeAutor;
 
-- G) A soma das páginas dos livros agrupadas pelo nome da editora cujo número de páginas esteja entre 200 e 500 (inclusive)
  SELECT e.nomeEditora, SUM(l.numPaginas) AS SomaPagin
  FROM tbEditora e
  LEFT JOIN tbLivro l ON e.codEditora = l.codEditora
  WHERE l.numPaginas BETWEEN 200 AND 500
  GROUP BY e.nomeEditora;
 
-- H) O nome dos livros ao lado do nome das editoras e do nome dos autores
  SELECT l.nomeLivro, e.nomeEditora, a.nomeAutor
  FROM tbLivro l
  INNER JOIN tbEditora e ON l.codEditora = e.codEditora
  INNER JOIN tbAutor a ON l.codAutor = a.codAutor;

-- I) O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Cia das Letras”
  SELECT l.nomeLivro, a.nomeAutor
  FROM tbLivro l
  INNER JOIN tbEditora e ON l.codEditora = e.codEditora AND e.nomeEditora = 'Cia das Letras'
  INNER JOIN tbAutor a ON l.codAutor = a.codAutor;

-- J) O nome dos livros ao lado dos nomes dos autores, somente dos livros que não forem do autor “Érico Veríssimo”
  SELECT l.nomeLivro, a.nomeAutor
  FROM tbLivro l
  INNER JOIN tbAutor a ON l.codAutor = a.codAutor AND a.nomeAutor != 'Érico Veríssimo';

-- K) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não tem livros cadastrados
  SELECT a.nomeAutor, l.nomeLivro
  FROM tbAutor a
  LEFT JOIN tbLivro l ON a.codAutor = l.codAutor;

-- L) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não tem autores cadastrados
  SELECT (a.nomeAutor, 'Sem Autor') AS nomeAutor, l.nomeLivro
  FROM tbLivro l
  LEFT JOIN tbAutor a ON l.codAutor = a.codAutor;

-- M) O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou não livro publicado, e indiferente do livro pertencer a algum autor
  SELECT a.nomeAutor, l.nomeLivro
  FROM tbAutor a
  FULL JOIN tbLivro l ON a.codAutor = l.codAutor;

-- N) A editora Ática irá publicar todos os títulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora Ática.
  SELECT l.nomeLivro, e.nomeEditora
  FROM tbLivro l
  CROSS JOIN tbEditora e
  WHERE e.nomeEditora = 'Ática';

-- O) Somente os nomes dos autores que não tem livros cadastrados
  SELECT a.nomeAutor
  FROM tbAutor a
  LEFT JOIN tbLivro l ON a.codAutor = l.codAutor
  WHERE l.codLivro IS NULL;

-- P)  Os nomes dos gêneros que não possuem nenhum livro cadastrado
  SELECT g.nomeGenero
  FROM tbGenero g
  LEFT JOIN tbLivro l ON g.codGenero = l.codGenero
  WHERE l.codLivro IS NULL;
