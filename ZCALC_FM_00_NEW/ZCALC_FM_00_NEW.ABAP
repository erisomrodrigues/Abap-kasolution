REPORT ZCALC_FM_00_NEW.

PARAMETERS: P_VALOR1 TYPE I,
            P_VALOR2 TYPE I,
            P_OPER   TYPE C LENGTH 2.

TYPES: TY_RESULT TYPE P DECIMALS 2.
DATA V_RESULT TYPE P DECIMALS 2.
DATA V_RESULT_I TYPE I.

CASE P_OPER.
  WHEN '**'.
    CALL FUNCTION 'ZFM_CALCULAR_POTENCIA_00'
      EXPORTING
        IV_BASE                = P_VALOR1
        IV_EXPOENTE            = P_VALOR2
     IMPORTING
       EV_RESULT              = V_RESULT_I
     EXCEPTIONS
       EXPOENTE_MAIOR_5       = 1
*       OTHERS                 = 2
              .
    IF SY-SUBRC <> 0.
* Implement suitable error handling here
      MESSAGE TEXT-003 TYPE 'I'.
      STOP.
    ENDIF.

    V_RESULT = V_RESULT_I.

  WHEN '%'.
    PERFORM CALC_PERC USING P_VALOR1
                            P_VALOR2
                      CHANGING V_RESULT.
  WHEN '+'.
    V_RESULT = P_VALOR1 + P_VALOR2.
  WHEN '-'.
    V_RESULT = P_VALOR1 - P_VALOR2.
  WHEN '*'.
    V_RESULT = P_VALOR1 * P_VALOR2.
  WHEN '/'.
    IF P_VALOR2 IS INITIAL.
    MESSAGE TEXT-001 TYPE 'I'.
    V_RESULT = P_VALOR1 / P_VALOR2.
       STOP.
    ENDIF.
    WHEN OTHERS.
   MESSAGE TEXT-002 TYPE 'I'.
ENDCASE.

   WRITE:/ 'O Resultado é: ', V_RESULT.
*&---------------------------------------------------------------------*
*& Form CALC_PERC
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> P_VALOR1
*&      --> P_VALOR2
*&      <-- V_RESULT
*&---------------------------------------------------------------------*
FORM CALC_PERC  USING    P_P_VALOR1 TYPE I
                         P_P_VALOR2 TYPE I
                CHANGING P_V_RESULT TYPE TY_RESULT.

  P_V_RESULT = P_P_VALOR1 / P_P_VALOR2 * 100.

ENDFORM.
