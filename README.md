Projeto de Tabela de Calendário
Este projeto contém o script SQL para criar e preencher uma tabela de calendário, útil para consultas e análises baseadas em datas no SQL Server.

Descrição
A tabela de calendário é uma ferramenta essencial em muitos sistemas de bancos de dados, especialmente para relatórios e análises onde a manipulação de datas é frequente. Esta tabela inclui colunas para a data, ano, mês, dia, primeiro dia do mês e último dia do mês.

Começando
Pré-requisitos
SQL Server (qualquer versão recente deve ser adequada)
Acesso a um banco de dados onde você pode executar scripts SQL
Instalação
Criar a Tabela de Calendário

Primeiro, crie a tabela de calendário usando o seguinte script SQL:


CREATE TABLE Calendario (
    Data DATE PRIMARY KEY,
    Ano INT,
    Mes INT,
    Dia INT,
    PrimeiroDiaMes DATE,
    UltimoDiaMes DATE
);
Preencher a Tabela de Calendário

Em seguida, preencha a tabela com datas. O script a seguir preenche a tabela do início de 2020 até o final de 2023:


DECLARE @Data DATE = '2020-01-01';

WHILE @Data <= '2023-12-31'
BEGIN
    INSERT INTO Calendario (Data, Ano, Mes, Dia, PrimeiroDiaMes, UltimoDiaMes)
    VALUES (
        @Data,
        YEAR(@Data),
        MONTH(@Data),
        DAY(@Data),
        DATEFROMPARTS(YEAR(@Data), MONTH(@Data), 1),
        EOMONTH(@Data)
    );

    SET @Data = DATEADD(DAY, 1, @Data);
END
