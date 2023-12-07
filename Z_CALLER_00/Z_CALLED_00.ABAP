*&---------------------------------------------------------------------*
*& Report z_called_00
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_called_00.

DATA: V_ENVIADO TYPE C LENGTH 30.

PARAMETERS: P_NOME TYPE C LENGTH 30.

START-OF-SELECTION.

IMPORT V_ENVIADO FROM MEMORY ID 'ENVIADO'.

WRITE: P_NOME, SY-cprog,
       / 'ENVIADO POR:', V_ENVIADO.
