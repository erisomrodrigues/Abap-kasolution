*&---------------------------------------------------------------------*
*& Include          ZIFI_CLASSES_INT_ERI001
*&---------------------------------------------------------------------*
INTERFACE LIF_DESPACHANTE.
    METHODS:
        MOSTRAR_INFO_AGENTE.
ENDINTERFACE.

CLASS LCL_BANCO DEFINITION.
    PUBLIC SECTION.
        INTERFACES: lif_despachante.

        METHODS:
            CONSTRUCTOR IMPORTING IM_NOME TYPE STRING
                                  IM_CODIGO TYPE CHAR3.

        METHODS:
            MOSTRAR_ATRIBUTOS.

    PRIVATE SECTION.
        DATA:
            NOME    TYPE STRING,
            CODIGO  TYPE CHAR3.

ENDCLASS.

CLASS LCL_BANCO IMPLEMENTATION.
    METHOD CONSTRUCTOR.
        NOME = IM_NOME.
        CODIGO = IM_CODIGO.
    ENDMETHOD.

    METHOD mostrar_atributos.
        WRITE:/ 'NOME: ', NOME,
              / 'CODIGO: ', CODIGO.
    ENDMETHOD.

    METHOD lif_despachante~mostrar_info_agente.
    mostrar_atributos( ).
    ENDMETHOD.
ENDCLASS.

***********************************************************************************
CLASS lcl_PREFEITURA DEFINITION.
  PUBLIC SECTION.
    INTERFACES:
      lif_despachante.

    METHODS:
      constructor IMPORTING im_cidade TYPE string
                            im_estado TYPE string.

    METHODS:
      mostra_informacoes.

  PRIVATE SECTION.
    DATA:
        CIDADE TYPE STRING,
        ESTADO TYPE STRING.

ENDCLASS.


CLASS lcl_prefeitura IMPLEMENTATION.
    METHOD constructor.
        CIDADE = IM_CIDADE.
        ESTADO = IM_ESTADO.
    ENDMETHOD.

    METHOD mostra_informacoes.
        WRITE:/ 'CIDADE', CIDADE,
              / 'ESTADO', ESTADO.
    ENDMETHOD.

    METHOD lif_despachante~mostrar_info_agente.
        mostra_informacoes( ).
    ENDMETHOD.

ENDCLASS.
