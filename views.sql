/*
EMARKET

1. Crie uma view que mostre o codigo do cliente, o nome do cliente, o total que ele gastou (campo transporte tabela faturas) e
a classificação dos clientes de acordo com o quanto eles gastaram:
	- se gastou acima de 3500 reais, então classificação "Categoria A"
	- se gastou abaixo de 1000 reais, então classificação "Categoria C"
	- algo diferente disso, então classificação "Categoria B"
	
Ordene os resultados por categoria

*/

CREATE OR REPLACE VIEW emarket1 AS
SELECT  
	Clientes.ClienteID,
    Empresa,
    SUM(Faturas.Transporte)AS total,
    CASE 
		WHEN SUM(Faturas.Transporte) > 3500
		THEN "CATEGORIA A"
        WHEN SUM(Faturas.Transporte ) < 1000
        THEN "CATEGORIA C"
        ELSE "CATEGORIA B" 
        END AS informacao   
FROM Clientes
INNER JOIN Faturas
ON Clientes.ClienteID = Faturas.ClienteID
GROUP BY ClienteID
ORDER BY total DESC 
;
-- Testando a View
SELECT *
FROM emarket1;
