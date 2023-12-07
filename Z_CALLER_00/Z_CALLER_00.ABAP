*&---------------------------------------------------------------------*
*& Report z_caller_00
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_caller_00.


PARAMETERS: P_NOME  TYPE C LENGTH 30,
            P_ENVIA TYPE C LENGTH 30.


START-OF-SELECTION.

EXPORT p_envia FROM P_ENVIA TO MEMORY ID 'ENVIADO'.

SUBMIT Z_CALLED_00
    WITH P_NOME = P_NOME
        AND RETURN.
            WRITE:/ P_NOME, SY-cprog.

FREE MEMORY ID 'ENVIADO'.

SET PARAMETER ID 'BKL' FIELD 'BR'.
SET PARAMETER ID 'BNK' FIELD '123456'.

CALL TRANSACTION 'FI03'
AND SKIP FIRST SCREEN.
