-- CREATE TABLE HistoriStokBarang (
--     KodeStok 		INT PRIMARY KEY,
--     Tanggal 		DATE,
--     KodeBarang 	CHAR(1),
--     StokAkhir 	INT
-- );

-- INSERT INTO HistoriStokBarang (KodeStok, Tanggal, KodeBarang, StokAkhir) VALUES
-- (1, '2009-01-01', 'A', 2),
-- (2, '2009-01-02', 'A', 5),
-- (3, '2009-01-02', 'B', 1),
-- (4, '2009-01-03', 'A', 3),
-- (5, '2009-01-03', 'B', 3),
-- (6, '2009-01-04', 'A', 5),
-- (7, '2009-01-04', 'A', 4);

-- SELECT * FROM historistokbarang

SELECT		HS.KODEBARANG,
			HS.STOKAKHIR
FROM 		historistokbarang HS
JOIN		(
						SELECT 		KODEBARANG,
  									MAX(TANGGAL) AS TanggalTerbaru
						FROM 		historistokbarang
  					    GROUP BY 	KODEBARANG
			) TERBARU_T ON HS.KODEBARANG = TERBARU_T.KODEBARANG AND HS.TANGGAL = TERBARU_T.TanggalTerbaru
JOIN		(
						SELECT		KODEBARANG,
  									TANGGAL,
  									MAX(KODESTOK) AS StokTerbaru
  					    FROM		historistokbarang
  					    GROUP BY	KODEBARANG, TANGGAL
			) TERBARU_S ON HS.KODEBARANG = TERBARU_S.KODEBARANG AND HS.TANGGAL = TERBARU_S.TANGGAL AND HS.KODESTOK = TERBARU_S.StokTerbaru
ORDER BY	HS.KODEBARANG