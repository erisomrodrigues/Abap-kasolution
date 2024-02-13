*&---------------------------------------------------------------------*
*& Report ZRFI_CONTA_INT_ERI001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrfi_conta_int_poli_eri001.

INCLUDE: zifi_classes_int_eri001.

DATA: r_banco TYPE REF TO lcl_banco.
*      r_pref  TYPE REF TO lcl_prefeitura.

START-OF-SELECTION.

  CREATE OBJECT r_banco
    EXPORTING
      im_nome   = 'BANCO DO ABAP'
      im_codigo = '701'.


  " Declaração inLine (ABAP Moderno)
  DATA(r_pref) = NEW lcl_prefeitura(
                                    im_cidade = 'SÃO PAULO'
                                    im_estado = ' SÃO PAULO').

  DATA(R_CLIENTE) = NEW lcl_cliente( ).
  r_cliente->adiciona_agente( im_agente = R_BANCO ).
  R_CLIENTE->adiciona_agente( im_agente = R_PREF ).



  r_banco->lif_despachante~mostrar_info_agente( ).
  r_pref->lif_despachante~mostrar_info_agente( ).
  r_cliente->mostra_info_todos_agentes( ).
