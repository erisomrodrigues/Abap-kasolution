FUNCTION Z_FM_SEL_ITAB_00.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_CARRID) TYPE  SPFLI-CARRID
*"  EXPORTING
*"     REFERENCE(ET_SPFLI) TYPE  ZIT_SPFLI_00
*"  EXCEPTIONS
*"      NENHUM_REGISTRO_ENCONTRADO
*"----------------------------------------------------------------------

SELECT *
  INTO TABLE ET_SPFLI
  FROM SPFLI
  WHERE CARRID = IV_CARRID.

IF SY-SUBRC <> 0.
  RAISE NENHUM_REGISTRO_ENCONTRADO.
ENDIF.
ENDFUNCTION.
