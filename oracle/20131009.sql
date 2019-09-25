DELETE FROM HJPF02_REN R
WHERE NOT EXISTS (
	SELECT 1 FROM HJPF05_REN C 
	WHERE R.Ramo = C.Ramo 
	AND R.Poliza = C.Poliza 
	AND R.NumRec = C.NumRec
);
--
DELETE FROM HJPF02_REN R
WHERE NOT EXISTS (
	SELECT 1 FROM REPF14_REN D 
	WHERE R.Ramo = D.Ramo
	AND R.Poliza = D.Poliza
	AND R.NumRec = D.NumRec
);
--
DELETE FROM HJPF05_REN C
WHERE NOT EXISTS (
	SELECT 1 FROM HJPF02_REN R 
	WHERE R.Ramo = C.Ramo
	AND R.Poliza = C.Poliza
	AND R.NumRec = C.NumRec
);
--
DELETE FROM HJPF01_REN P
WHERE NOT EXISTS (
	SELECT 1 FROM HJPF02_REN R
	WHERE P.Ramo = R.Ramo
	AND P.Poliza = R.Poliza
);
--
DELETE FROM HJPF01_REN P
WHERE NOT EXISTS (
	SELECT 1 FROM HJPF05_REN C 
	WHERE P.Ramo = C.Ramo
	AND P.Poliza = C.Poliza
);
--
DELETE FROM REPF14_REN D
WHERE NOT EXISTS (
	SELECT 1 FROM HJPF02_REN R
	WHERE R.Ramo = D.Ramo
	AND R.Poliza = D.Poliza
	AND R.NumRec = D.NumRec
);
--
DELETE FROM HJPF03_REN V
WHERE NOT EXISTS (
	SELECT 1 FROM HJPF02_REN R
	WHERE R.Ramo = V.Ramo
	AND R.Poliza = V.Poliza
	AND R.NumRec = V.NumRec
);
--
DELETE FROM CLPF07_REN V
WHERE NOT EXISTS (
	SELECT 1 FROM HJPF02_REN R
	WHERE R.Ramo = V.Ramo
	AND R.Poliza = V.Poliza
);