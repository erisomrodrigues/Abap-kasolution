FUNCTION ZFM_CALCULAR_POTENCIA_00.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_BASE) TYPE  I
*"     REFERENCE(IV_EXPOENTE) TYPE  I
*"  EXPORTING
*"     REFERENCE(EV_RESULT) TYPE  I
*"  EXCEPTIONS
*"      EXPOENTE_MAIOR_5
*"----------------------------------------------------------------------

IF IV_EXPOENTE > 5.
  RAISE EXPOENTE_MAIOR_5.
ENDIF.

EV_RESULT = IV_BASE ** IV_EXPOENTE.


ENDFUNCTION.
