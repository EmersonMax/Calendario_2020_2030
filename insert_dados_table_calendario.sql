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
