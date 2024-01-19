*&---------------------------------------------------------------------*
*& Include          ZIFI_CLASSES_00
*&---------------------------------------------------------------------*

CLASS lcl_conta  DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_titular TYPE string
                                   iv_saldo   TYPE dec_16_02_s.

    METHODS: define_atributos IMPORTING iv_titular TYPE string
                                        iv_saldo   TYPE dec_16_02_s.

    METHODS: retorna_saldo      RETURNING VALUE(rv_saldo) TYPE dec_16_02_s.

    METHODS: imprimi_atributos.

    CLASS-METHODS: retorna_num_contas RETURNING VALUE(rv_contas) TYPE i. " METODO ESTATICO

  PRIVATE SECTION.
    DATA: titular TYPE string,
          saldo   TYPE dec_16_02_s.

    CLASS-DATA: num_contas TYPE i.

ENDCLASS.

CLASS lcl_conta IMPLEMENTATION.
  METHOD constructor.
    me->define_atributos(
      EXPORTING
        iv_titular = iv_titular
        iv_saldo   = iv_saldo
    ).

    num_contas = num_contas + 1.
  ENDMETHOD.

  METHOD define_atributos.
    titular = iv_titular.
    saldo   = iv_saldo.
  ENDMETHOD.

  METHOD RETORNA_SALDO.
    RV_SALDO = SALDO.
  ENDMETHOD.

  METHOD IMPRIMI_ATRIBUTOS.
    WRITE:/ 'TITULA:', TITULAR,
         / 'SALDO:', SALDO.
  ENDMETHOD.

  METHOD RETORNA_NUM_CONTAS.
    RV_CONTAS = NUM_CONTAS.
  ENDMETHOD.



ENDCLASS.
