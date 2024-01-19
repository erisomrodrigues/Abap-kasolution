*&---------------------------------------------------------------------*
*& Report ZRFI_CONTA_OBJ_17
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRFI_CONTA_OBJ_17.

INCLUDE: ZIFI_CLASSES_17.

DATA: R_CONTA TYPE REF TO lcl_conta.
DATA: IT_CONTAS TYPE TABLE OF REF TO LCL_CONTA.

START-OF-SELECTION.
  WRITE:/ 'NÚMERO DE CONTAS CRIADAS: ', lcl_conta=>RETORNA_NUM_CONTAS(  ). " Metodo estatico

  CREATE OBJECT r_conta
    EXPORTING
      iv_titular = 'JOSÉ DA SILVA'
      iv_saldo   = 2000.
   APPEND R_CONTA TO IT_CONTAS.

     CREATE OBJECT r_conta
    EXPORTING
      iv_titular = 'JOAO DOS SANTOS'
      iv_saldo   = 3000.
   APPEND R_CONTA TO IT_CONTAS.

     CREATE OBJECT r_conta
    EXPORTING
      iv_titular = 'MARIA GARCIA'
      iv_saldo   = 6300.
   APPEND R_CONTA TO IT_CONTAS.

   LOOP AT IT_CONTAS INTO R_CONTA.
      r_conta->imprimi_atributos( ).
   ENDLOOP.

   WRITE:/ 'NÚMERO DE CONTAS CRIADAS:', LCL_CONTA=>RETORNA_NUM_CONTAS(  ).
