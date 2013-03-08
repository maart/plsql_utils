create or replace package a_time as
  /*=========================================================================*/
  procedure start_time;
  /*=========================================================================*/
  procedure end_time;
  /*=========================================================================*/
  procedure result_time;
  /*=========================================================================*/
end a_time;
/
create or replace package body a_time as
  /*=========================================================================*/
  g_start_time number;
  g_end_time   number;
  /*=========================================================================*/
  /*=========================================================================*/
  procedure start_time as
  begin
    g_start_time := dbms_utility.get_time;
  end start_time;
  /*=========================================================================*/
  procedure end_time as
  begin
    g_end_time := dbms_utility.get_time;
  end end_time;
  /*=========================================================================*/
  procedure result_time as
  begin
    put('Process executed in ' ||
        FLOOR(((g_end_time - g_start_time) / 100) / 60) || ' minute(s) ' ||
        MOD(((g_end_time - g_start_time) / 100), 60) || ' seconds.');
  end result_time;
  /*=========================================================================*/
end a_time;
/
