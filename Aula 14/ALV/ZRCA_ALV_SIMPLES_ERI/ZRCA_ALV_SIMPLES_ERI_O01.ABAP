*----------------------------------------------------------------------*
***INCLUDE ZRCA_ALV_SIMPLES_ERI_O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'STATUS_0100'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module CREATE_ALV OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE create_alv OUTPUT.
  CREATE OBJECT r_container
    EXPORTING
      container_name              = 'CONTAINER' " Name of the Screen CustCtrl Name to Link Container To
    EXCEPTIONS
      cntl_error                  = 1      " CNTL_ERROR
      cntl_system_error           = 2      " CNTL_SYSTEM_ERROR
      create_error                = 3      " CREATE_ERROR
      lifetime_error              = 4      " LIFETIME_ERROR
      lifetime_dynpro_dynpro_link = 5.     " LIFETIME_DYNPRO_DYNPRO_LINK

  CREATE OBJECT r_guid
    EXPORTING
      i_parent          = r_container      " Parent Container
    EXCEPTIONS
      error_cntl_create = 1                " Error when creating the control
      error_cntl_init   = 2                " Error While Initializing Control
      error_cntl_link   = 3                " Error While Linking Control
      error_dp_create   = 4.               " Error While Creating DataProvider Control

  v_repid-report = sy-repid.

  r_guid->set_table_for_first_display(
    EXPORTING
*      i_buffer_active               =                  " Buffering Active
*      i_bypassing_buffer            =                  " Switch Off Buffer
*      i_consistency_check           =                  " Starting Consistency Check for Interface Error Recognition
      i_structure_name               = 'SFLIGHT'         " Internal Output Table Structure Name
      is_variant                     = v_repid                  " Layout
      i_save                         = 'A'              " Save Layout
*      i_default                     = 'X'              " Default Display Variant
      is_layout                      = wa_layout        " Layout
*      is_print                      =                  " Print Control
*      it_special_groups             =                  " Field Groups
*      it_toolbar_excluding          =                  " Excluded Toolbar Standard Functions
*      it_hyperlink                  =                  " Hyperlinks
*      it_alv_graphics               =                  " Table of Structure DTC_S_TC
*      it_except_qinfo               =                  " Table for Exception Quickinfo
*      ir_salv_adapter               =                  " Interface ALV Adapter
    CHANGING
      it_outtab                     = it_sflight        " Output Table
      it_fieldcatalog               = it_field_cat      " Field Catalog
      it_sort                       = it_sort                 " Sort Criteria
*      it_filter                     =                  " Filter Criteria
*    EXCEPTIONS
*      invalid_parameter_combination = 1                " Wrong Parameter
*      program_error                 = 2                " Program Errors
*      too_many_lines                = 3                " Too many Rows in Ready for Input Grid
*      others                        = 4
  ).
ENDMODULE.

*&---------------------------------------------------------------------*
*& Module SET_FIELD_CAT OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE set_field_cat OUTPUT.
  CLEAR wa_field_cat.
  wa_field_cat-fieldname = 'TXOCC'.
  wa_field_cat-coltext = 'Taxa Oc.'.
  wa_field_cat-col_pos = 10.
  wa_field_cat-edit = 'X'.
  APPEND wa_field_cat TO it_field_cat.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module SET_LAYOUT OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE set_layout OUTPUT.
wa_layout-zebra = 'X'.
wa_layout-cwidth_opt = 'X'.
wa_layout-grid_title = 'LISTA DE VOOS'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module SET_SORT OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE set_sort OUTPUT.
  CLEAR wa_sort.
  wa_sort-fieldname = 'FLDATE'.
  wa_sort-spos = 1.
  APPEND wa_sort TO it_sort.

  CLEAR wa_sort.
  wa_sort-fieldname = 'TXOCC'.
  WA_SORT-spos = 2.
  APPEND wa_sort TO it_sort.
ENDMODULE.
