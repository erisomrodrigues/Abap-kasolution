FUNCTION Z_FM_SEL_SINGLE_00.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_CARRID) TYPE  SPFLI-CARRID
*"     REFERENCE(IV_CONNID) TYPE  SPFLI-CONNID
*"  EXPORTING
*"     REFERENCE(ST_SPFLI) TYPE  SPFLI
*"  EXCEPTIONS
*"      NENHUM_REGISTRO_ENCONTRADO
*"----------------------------------------------------------------------


SELECT SINGLE *
  INTO ST_SPFLI
  FROM SPFLI
  WHERE CARRID = IV_CARRID
  AND CONNID = IV_CONNID.

  IF SY-SUBRC NE 0.
    RAISE NENHUM_REGISTRO_ENCONTRADO.
  ENDIF.

ENDFUNCTION.
