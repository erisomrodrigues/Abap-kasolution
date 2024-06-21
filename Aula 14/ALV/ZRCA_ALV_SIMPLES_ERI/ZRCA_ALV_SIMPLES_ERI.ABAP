*&---------------------------------------------------------------------*
*& Report ZRCA_ALV_SIMPLES_ERI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrca_alv_simples_eri.

DATA: BEGIN OF wa_sflight.
        INCLUDE STRUCTURE sflight.
DATA:   txocc TYPE dec_16_02_s.
DATA: END OF wa_sflight.

DATA: V_REPID TYPE disvariant.


DATA: it_sflight LIKE TABLE OF  wa_sflight.

DATA: wa_field_cat TYPE lvc_s_fcat.
DATA: it_field_cat TYPE lvc_t_fcat.

DATA: WA_LAYOUT TYPE lvc_s_layo.

DATA: WA_SORT TYPE lvc_s_sort.
DATA: IT_SORT TYPE lvc_t_sort.

DATA: r_container TYPE REF TO cl_gui_custom_container,
      r_guid      TYPE REF TO cl_gui_alv_grid.

START-OF-SELECTION.
  SELECT *
          INTO TABLE it_sflight
          FROM sflight.

LOOP AT IT_SFLIGHT INTO WA_SFLIGHT.
  wa_sflight-txocc = ( WA_SFLIGHT-seatsocc / WA_SFLIGHT-seatsmax ) * 100.
  MODIFY it_sflight FROM wa_sflight.
ENDLOOP.

  CALL SCREEN '0100'.

  INCLUDE zrca_alv_simples_eri_o01.

  INCLUDE zrca_alv_simples_eri_i01.
