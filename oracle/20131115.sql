DECLARE
    CURSOR CUR
    IS
    SELECT DISTINCT IDEPOL, IDEOP
    FROM POLIZAS_A_TRANSF_TOTALFAST A
    WHERE INDPOLTRANSF = 'S'
    AND TIPOPROCESO = 1
    AND EXISTS(
        SELECT 1 FROM POLIZA B
        WHERE B.IDEPOL = A.IDEPOL AND B.CODPOL = 'AUTI'
    )
    AND EXISTS (
        SELECT 1 FROM RECIBO C
        WHERE C.IDEPOL = A.IDEPOL
        AND C.IDEOP = A.IDEOP
        AND STSREC <> 'MIG'
    )
    ORDER BY 1, 2;

    VCODPRODUCTO    POLIZA.CODPOL%TYPE;
    VPOLIZA         POLIZA.NUMPOL%TYPE;
    VSUSCPOL        POLIZA.CODOFIEMI%TYPE;
    VRECIBO         RECIBO.NUMREC%TYPE;
    CANT            NUMBER := 0;
BEGIN
    FOR I IN CUR
    LOOP
        DBMS_OUTPUT.PUT_LINE (I.IDEPOL || ' - ' || I.IDEOP);
        BEGIN
            SELECT DISTINCT IDEPOL INTO VPOLIZA
            FROM POLIZA
            WHERE IDEPOL = I.IDEPOL;

            SELECT DISTINCT NUMREC
            INTO VRECIBO
            FROM RECIBO
            WHERE IDEPOL = I.IDEPOL AND IDEOP = I.IDEOP;
        EXCEPTION WHEN NO_DATA_FOUND THEN
            CANT := CANT + 1;
        END;
        DBMS_OUTPUT.PUT_LINE (CANT);
    END LOOP;
END;